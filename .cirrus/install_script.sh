#!/bin/sh
set -e

print_info()
{
  echo -e "\033[0;35m$(date "+[%Y-%m-%d %H:%M:%S]")  ${1}\033[0m"
}

print_success()
{
  echo -e "\033[0;32m$(date "+[%Y-%m-%d %H:%M:%S]")  ${1}\033[0m"
}

print_error()
{
  echo -e "\033[0;31m$(date "+[%Y-%m-%d %H:%M:%S]")  ${1}\033[0m"
}

wait_for_admin_portal()
{
  pkg install --yes curl

  curl_follow_redirects="--location"
  if [ "$FOLLOW_REDIRECTS" == "false" ]
  then
    curl_follow_redirects=""
  fi

  curl_user=""
  if [ "$ADMIN_UI_USER" != "" ]
  then
    curl_user="--user ${ADMIN_UI_USER}"
  fi

  exp_ui_url=${1}

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

check_service_status()
{
  services_before=${1}
  services_after=${2}

  print_info "Checking if post install services are running"

  echo "${services_after}" | while IFS=' ' read -r a
  do
    if ! echo "${services_before}" | grep -q "${a}"
    then
      print_info "Checking if service $a is running"
      "${a}" status
    fi
  done
}

pkg install --yes jq

release=$(jq -r '.release' $PLUGIN_FILE)
name=$(jq '.name' $PLUGIN_FILE)
packagesite=$(jq '.packagesite' $PLUGIN_FILE)
fingerprints=$(jq -r '.fingerprints | keys[]' $PLUGIN_FILE)
plugin_repo=$(jq -r '.artifact' $PLUGIN_FILE)
pkgs=$(jq -r '.pkgs | join(" ")' $PLUGIN_FILE)
kmods=$(jq -r '.kmods' $PLUGIN_FILE)

# Clone plugins artifacts
plugin_dir="/usr/local/plugin"
pkg install --yes git-lite || pkg install --yes git
release_branch="$(freebsd-version | cut -d '-' -f1)-RELEASE"
print_info "Trying to clone ${plugin_repo}, to ${plugin_dir}, using branch: ${release_branch} (with fallback to 'master')"
git clone -b ${release_branch} ${plugin_repo} ${plugin_dir} || git clone -b master ${plugin_repo} ${plugin_dir}

exp_ui_url=""
if [ -f ${plugin_dir}/ui.json ]
then
  ip_address=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
  admin_portal=$(jq -r '.adminportal' ${plugin_dir}/ui.json | sed "s/%%IP%%/${ip_address}/")
  place_holders=$(jq -r '.adminportal_placeholders' ${plugin_dir}/ui.json)

  if [ "$place_holders" != "null" ]
  then
    print_info "Found admin portal placeholders: ${place_holders}"
    ph_keys=$(echo $place_holders | jq -r 'keys[]')

    for ph in ${ph_keys}
    do
      place_holder_value=$(jq -r '."adminportal_placeholders"."'${ph}'"' ${plugin_dir}/ui.json)
      resolved_default_value=$(jq -r '.options."'${place_holder_value}'".default' ${plugin_dir}/settings.json)

      print_info "Replacing ${ph} with ${resolved_default_value} in admin_portal UI ${admin_portal}"
      admin_portal=$(echo $admin_portal | sed "s/${ph}/${resolved_default_value}/")
    done
  fi

  if echo $admin_portal | grep -q "http\|localhost"
  then
    print_info "Found http or localhost in Admin Portal, will try to fetch it after post_install"
    exp_ui_url=$admin_portal
  else
    print_info "Admin Portal does not contain localhost or http. Will skip waiting for admin_portal"
  fi
fi

pkg_dir=/usr/local/test
repos_dir="${pkg_dir}/repos"
fingerprints_dir="${pkg_dir}/fingerprints"

print_info "Creating main repos dir: ${repos_dir}"
mkdir -p $repos_dir

pkg_conf_path="${repos_dir}/test.conf"
echo "iocage-plugins: {" > $pkg_conf_path
echo "url: $packagesite," >> $pkg_conf_path
echo "signature_type: \"fingerprints\"," >> $pkg_conf_path
echo "fingerprints \"${fingerprints_dir}\"," >> $pkg_conf_path
echo "enabled: true" >> $pkg_conf_path
echo "}" >> $pkg_conf_path
print_info "Created test pkg config file:"
cat $pkg_conf_path

trusted_fingerprints="$fingerprints_dir/trusted"
mkdir -p "${trusted_fingerprints}"

for repo_name in $fingerprints
do
  repo_fingerprints=$(jq -rc '."fingerprints"."'${repo_name}'"[]' $PLUGIN_FILE)

  repo_count=1
  echo $repo_fingerprints | while IFS='' read f
  do
    print_info "Creating fingerprint file for repo: ${f}"

    function=$(echo $f | jq -r '.function')
    fingerprint=$(echo $f | jq -r '.fingerprint')
    file_path=${trusted_fingerprints}/${repo_name}_${repo_count}

    print_info "Creating new fingerprint file: ${file_path}"

    echo "function: $function" > ${file_path}
    echo "fingerprint: $fingerprint" >> ${file_path}

    repo_count=$(expr $repo_count + 1)
  done
done

if [ "$kmods" != "null" ]
then
  print_info "Plugin kmods set"
  echo $kmods | jq -r  '.[]' | while IFS='' read kmod
  do
    print_info "Loading kmod: ${kmod}"
    kldload -nv ${kmod}
  done
fi

# Clean up all packages
print_info "Clean up packages before plugin installation"
pkg delete --all --yes
pkg autoremove --yes
pkg clean --yes

if echo ${packagesite} | grep -q "https"
then
  pkg install --yes ca_root_nss
fi

print_info "Start using plugin pkg repos"
export REPOS_DIR=$repos_dir

print_info "Fetching $name pkgs: $pkgs"
pkg fetch --dependencies --yes $pkgs

pkg delete --yes ca_root_nss || true

print_info "Installing $name pkgs: $pkgs"
pkg install --no-repo-update --yes $pkgs

if [ -d "${plugin_dir}/overlay" ]
then
  print_info "Found overlay folder. Will copy '${plugin_dir}/overlay' into root path '/'"
  cp -r ${plugin_dir}/overlay/ /
fi

services_before=$(service -e)

print_info "Executing post_install.sh script"
${plugin_dir}/post_install.sh
print_success "Post install complete"

services_after=$(service -e)
check_service_status "${services_before}" "${services_after}"

print_info "Disable plugins pkg repos"
unset REPOS_DIR

if [ "${exp_ui_url}" != "" ]
then
  wait_for_admin_portal ${exp_ui_url}
fi

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
