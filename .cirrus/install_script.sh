#!/bin/sh
set -e

wait_for_admin_portal()
{
  exp_ui_url=$1

  max_retries=5
  retry=0
  fetch_success=false
  sleep_time=5

  echo -e "\033[0;32Starting to wait for Admin Portal at: ${exp_ui_url}"
  while [ $retry -lt $max_retries ]
  do
    retry=$(expr $retry + 1)
    if fetch --no-verify-hostname ${exp_ui_url} 2> /dev/null
    then
      fetch_success=true
      break
    fi

    echo -e "\033[0;32Admin Portal fetch failed, sleeping ${sleep_time} seconds, and retrying (${retry}/${max_retries})\033[0m"
    sleep ${sleep_time}
  done

  if ${fetch_success}
  then
    echo -e "\033[0;32Admin Portal reachable\033[0m"
  else
    echo -e "\033[0;32Could not fetch Admin Portal\033[0m"
    exit 1
  fi
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
echo -e "\033[0;32Trying to clone ${plugin_repo}, to ${plugin_dir}, using branch: ${release_branch} (with fallback to 'master')\033[0m"
git clone -b ${release_branch} ${plugin_repo} ${plugin_dir} || git clone -b master ${plugin_repo} ${plugin_dir}

exp_ui_url=""
if [ -f ${plugin_dir}/ui.json ]
then
  admin_portal=$(jq -r '.adminportal' ${plugin_dir}/ui.json | sed 's/%%IP%%/localhost/')
  if echo $admin_portal | grep -q "http\|localhost"
  then
    echo -e "\033[0;32Found http or localhost in Admin Portal, will try to fetch it after post_install\033[0m"
    exp_ui_url=$admin_portal
  else
    echo -e "\033[0;32Admin Portal does not contain localhost or http. Will skip waiting for admin_portal\033[0m"
  fi
fi

pkg_dir=/usr/local/test
repos_dir="${pkg_dir}/repos"
fingerprints_dir="${pkg_dir}/fingerprints"

echo -e "\033[0;32Creating main repos dir: ${repos_dir}\033[0m"
mkdir -p $repos_dir

pkg_conf_path="${repos_dir}/test.conf"
echo "iocage-plugins: {" > $pkg_conf_path
echo "url: $packagesite," >> $pkg_conf_path
echo "signature_type: \"fingerprints\"," >> $pkg_conf_path
echo "fingerprints \"${fingerprints_dir}\"," >> $pkg_conf_path
echo "enabled: true" >> $pkg_conf_path
echo "}" >> $pkg_conf_path
echo -e "\033[0;32Created test pkg config file:"
cat $pkg_conf_path

trusted_fingerprints="$fingerprints_dir/trusted"
mkdir -p "${trusted_fingerprints}"

for repo_name in $fingerprints
do
  repo_fingerprints=$(jq -rc '."fingerprints"."'${repo_name}'"[]' $PLUGIN_FILE)

  repo_count=1
  echo $repo_fingerprints | while IFS='' read f
  do
    echo -e "\033[0;32Creating fingerprint file for repo:\033[0m"
    echo $f

    function=$(echo $f | jq -r '.function')
    fingerprint=$(echo $f | jq -r '.fingerprint')
    file_path=${trusted_fingerprints}/${repo_name}_${repo_count}

    echo -e "\033[0;32Creating new fingerprint file: ${file_path}\033[0m"

    echo "function: $function" > ${file_path}
    echo "fingerprint: $fingerprint" >> ${file_path}

    repo_count=$(expr $repo_count + 1)
  done
done

if [ "$kmods" != "null" ]
then
  echo -e "\033[0;32Found kmods\033[0m"
  echo $kmods | jq -r  '.[]' | while IFS='' read kmod
  do
    echo -e "\033[0;32Loading kmod: ${kmod}\033[0m"
    kldload -nv ${kmod}
  done
fi

# Clean up all packages
echo -e "\033[0;32Clean up packages before plugin installation\033[0m"
pkg delete --all --yes
pkg autoremove --yes
pkg clean --yes

if echo ${packagesite} | grep -q "https"
then
  pkg install --yes ca_root_nss
fi

echo -e "\033[0;32Start using plugin pkg repos\033[0m"
export REPOS_DIR=$repos_dir

echo -e "\033[0;32Fetching $name pkgs: $pkgs\033[0m"
pkg fetch --dependencies --yes $pkgs

pkg delete --yes ca_root_nss || true

echo -e "\033[0;32Installing $name pkgs: $pkgs\033[0m"
pkg install --no-repo-update --yes $pkgs

if [ -d "${plugin_dir}/overlay" ]
then
  echo -e "\033[0;32Found overlay folder\033[0m"
  cp -r ${plugin_dir}/overlay/ /
fi

echo -e "\033[0;32Executing post_install.sh script\033[0m"
${plugin_dir}/post_install.sh

if [ "${exp_ui_url}" != "" ]
then
  wait_for_admin_portal ${exp_ui_url}
fi

if [ -f ${plugin_dir}/pre_update.sh ] && ! [ -x ${plugin_dir}/pre_update.sh ]
then
  echo -e "\033[0;32pre_update.sh script not executable\033[0m"
  exit 1
fi

if [ -f ${plugin_dir}/post_update.sh ] && ! [ -x ${plugin_dir}/post_update.sh ]
then
  echo -e "\033[0;32post_update.sh script not executable\033[0m"
  exit 1
fi
