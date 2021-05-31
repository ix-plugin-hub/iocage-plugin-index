#!/bin/sh
set -e

# global variables
plugin_dir="/usr/local/plugin"
exp_ui_url=""

pkg_dir=/usr/local/test
repos_dir="${pkg_dir}/repos"
fingerprints_dir="${pkg_dir}/fingerprints"
services_before=$(service -e)

print_info()
{
  printf "\033[0;36m$(date "+[%Y-%m-%d %H:%M:%S]")  %s\033[0m\n" "${1}"
}

print_success()
{
  printf "\033[0;32m$(date "+[%Y-%m-%d %H:%M:%S]")  %s\033[0m\n" "${1}"
}

print_error()
{
  printf "\033[0;31m$(date "+[%Y-%m-%d %H:%M:%S]")  %s\033[0m\n" "${1}"
}

install_requirements()
{
  pkg install --yes jq
  pkg install --yes git-lite || pkg install --yes git
}

clone_plugin_repo()
{
  plugin_repo=$(jq -r '.artifact' "${PLUGIN_FILE}")

  release_branch="$(freebsd-version | cut -d '-' -f1)-RELEASE"

  print_info "Trying to clone ${plugin_repo}, to ${plugin_dir}, using branch: ${release_branch} (with fallback to 'master')"
  git clone -b "${release_branch}" "${plugin_repo}" ${plugin_dir} || git clone -b master "${plugin_repo}" ${plugin_dir}
}

get_admin_ui()
{
  ip_address=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

  if [ "${OVERRIDE_ADMIN_UI}" != "" ]
  then
    print_info "OVERRIDE_ADMIN_UI variable set, will use it for admin portal check: ${OVERRIDE_ADMIN_UI}"
    exp_ui_url=$(echo "${OVERRIDE_ADMIN_UI}" | sed "s/<IP>/${ip_address}/")
    return
  fi

  if ! [ -f ${plugin_dir}/ui.json ]
  then
    print_info "No ui.json found in repo, will ignore admin portal check"
    return
  fi

  admin_portal=$(jq -r '.adminportal' ${plugin_dir}/ui.json | sed "s/%%IP%%/${ip_address}/")
  place_holders=$(jq -r '.adminportal_placeholders' ${plugin_dir}/ui.json)

  if [ "${place_holders}" != "null" ]
  then
    print_info "Found admin portal placeholders: ${place_holders}"
    ph_keys=$(echo "${place_holders}" | jq -r 'keys[]')

    for ph in ${ph_keys}
    do
      place_holder_value=$(jq -r '."adminportal_placeholders"."'"${ph}"'"' ${plugin_dir}/ui.json)
      resolved_default_value=$(jq -r '.options."'"${place_holder_value}"'".default' ${plugin_dir}/settings.json)

      print_info "Replacing ${ph} with ${resolved_default_value} in admin_portal UI ${admin_portal}"
      admin_portal=$(echo "${admin_portal}" | sed "s/${ph}/${resolved_default_value}/")
    done
  fi

  if ! echo "${admin_portal}" | grep -q "http\|localhost"
  then
    print_info "Admin Portal does not contain localhost or http. Will skip waiting for admin_portal"
    return
  fi

  exp_ui_url=${admin_portal}
}

__create_package_config()
{
  packagesite=$(jq '.packagesite' "${PLUGIN_FILE}")

  print_info "Creating main repos dir: ${repos_dir}"
  mkdir -p $repos_dir

  pkg_conf_path="${repos_dir}/test.conf"
  {
    echo "iocage-plugins: {"
    echo "url: ${packagesite},"
    echo "signature_type: \"fingerprints\","
    echo "fingerprints \"${fingerprints_dir}\","
    echo "enabled: true"
    echo "}"
  } > ${pkg_conf_path}

  print_info "Created test pkg config file:"
  cat ${pkg_conf_path}
}

__create_trusted_fingerprints()
{
  fingerprints=$(jq -r '.fingerprints | keys[]' "${PLUGIN_FILE}")

  trusted_fingerprints="$fingerprints_dir/trusted"
  mkdir -p "${trusted_fingerprints}"

  for repo_name in ${fingerprints}
  do
    repo_fingerprints=$(jq -rc '."fingerprints"."'"${repo_name}"'"[]' "${PLUGIN_FILE}")

    repo_count=1
    echo "${repo_fingerprints}" | while IFS='' read -r f
    do
      print_info "Creating fingerprint file for repo: ${f}"

      function=$(echo "${f}" | jq -r '.function')
      fingerprint=$(echo "${f}" | jq -r '.fingerprint')
      file_path=${trusted_fingerprints}/${repo_name}_${repo_count}

      print_info "Creating new fingerprint file: ${file_path}"

      echo "function: ${function}" > "${file_path}"
      echo "fingerprint: ${fingerprint}" >> "${file_path}"

      repo_count=$((repo_count + 1))
    done
  done
}

create_plugin_pkg_repo()
{
  __create_package_config

  __create_trusted_fingerprints
}

load_kmods()
{
  kmods=$(jq -r '.kmods' "${PLUGIN_FILE}")
  if [ "${kmods}" = "null" ]
  then
    print_info "No kmods found for plugin"
    return
  fi

  print_info "Plugin kmods set"
  echo "${kmods}" | jq -r  '.[]' | while IFS='' read -r kmod
  do
    print_info "Loading kmod: ${kmod}"
    kldload -nv "${kmod}"
  done
}

install_plugin_packages()
{
  pkgs=$(jq -r '.pkgs | join(" ")' "${PLUGIN_FILE}")
  name=$(jq '.name' "${PLUGIN_FILE}")

  print_info "Clean up packages before plugin installation"
  pkg delete --all --yes
  pkg autoremove --yes
  pkg clean --yes

  if echo "${packagesite}" | grep -q "https"
  then
    pkg install --yes ca_root_nss
  fi

  print_info "Start using plugin pkg repos"
  export REPOS_DIR=${repos_dir}

  print_info "Fetching ${name} pkgs: ${pkgs}"
  pkg fetch --dependencies --yes ${pkgs}

  pkg delete --yes ca_root_nss || true

  print_info "Installing ${name} pkgs: ${pkgs}"
  pkg install --no-repo-update --yes ${pkgs}
}

copy_overlay_folder()
{
  if ! [ -d "${plugin_dir}/overlay" ]
  then
    print_info "No overlay folder found"
    return
  fi

  print_info "Found overlay folder. Will copy '${plugin_dir}/overlay' into root path '/'"
  cp -r ${plugin_dir}/overlay/ /
}

run_post_install()
{
  print_info "Executing post_install.sh script"
  ${plugin_dir}/post_install.sh
  print_success "Post install complete"
}

post_install_cleanup()
{
  print_info "Disable plugins pkg repos"
  unset REPOS_DIR
}

wait_for_admin_portal()
{
  if [ "${exp_ui_url}" = "" ]
  then
    print_info "No admin portal, skipping admin portal check"
    return
  fi

  if [ "${SKIP_UI_CHECK}" = "true" ]
  then
    print_info "SKIP_UI_CHECK variable set to \"true\", skipping admin portal check"
    return
  fi

  pkg install --yes curl

  curl_follow_redirects="--location"
  if [ "${FOLLOW_REDIRECTS}" = "false" ]
  then
    curl_follow_redirects=""
  fi

  curl_user=""
  if [ "${ADMIN_UI_USER}" != "" ]
  then
    curl_user="--user ${ADMIN_UI_USER}"
  fi

  curl_retires=8
  curl_retries_sleep=2
  curl_timeout=8

  print_info "Trying to curl Admin Portal at: ${exp_ui_url}, with ${curl_retires} retries, sleeping ${curl_retries_sleep} seconds"

  if curl \
      --fail \
      --verbose \
      --insecure \
      ${curl_follow_redirects} \
      --connect-timeout ${curl_timeout} \
      --retry ${curl_retires} \
      --retry-delay ${curl_retries_sleep} \
      --retry-all-errors \
      --output /dev/null \
      --silent \
      ${curl_user} \
      ${exp_ui_url}
  then
    print_success "Admin Portal reachable"
  else
    print_error "Could not fetch Admin Portal"
    exit 1
  fi
}

check_services_status()
{
  if [ "$SKIP_SERVICE_CHECK" = "true" ]
  then
    print_info "SKIP_SERVICE_CHECK variable set to \"true\", skipping service status check"
    return
  fi

  services_now=$(service -e)

  print_info "Checking if post install services are running"
  echo "${services_now}" | while IFS=' ' read -r service_path
  do
    if ! echo "${services_before}" | grep -q "${service_path}"
    then
      __wait_for_service "${service_path}"
    fi
  done
}

__wait_for_service()
{
  service_path=${1}
  max_retries=5
  sleep=2

  print_info "Starting to wait for service: ${service_path} with ${max_retries} retries and ${sleep} s. sleep"

  try=1
  while [ ${try} -le ${max_retries} ]
  do
    print_info "Service status check (${try}/${max_retries})"
    "${service_path}" status && break

    try=$((try+1))
    sleep ${sleep}
  done

  if [ ${try} -gt ${max_retries} ]
  then
    print_error "Service ${service_path} not started"
    exit 1
  fi
}

check_update_scripts()
{
  if [ -f ${plugin_dir}/pre_update.sh ] && ! [ -x ${plugin_dir}/pre_update.sh ]
  then
    print_error "pre_update.sh script not executable"
    exit 1
  fi

  if [ -f ${plugin_dir}/post_update.sh ] && ! [ -x ${plugin_dir}/post_update.sh ]
  then
    print_error "post_update.sh script not executable"
    exit 1
  fi
}

cleanup()
{
  service ipfw stop > /dev/null || true  # stop possible ipfw blocking out cirrus agent communication
}

install_requirements

clone_plugin_repo

get_admin_ui

create_plugin_pkg_repo

load_kmods

install_plugin_packages

copy_overlay_folder

run_post_install

post_install_cleanup

check_services_status

wait_for_admin_portal

check_update_scripts

cleanup
