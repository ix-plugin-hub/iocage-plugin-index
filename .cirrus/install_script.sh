#!/bin/sh
set -e

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
git clone -b ${release_branch} ${plugin_repo} ${plugin_dir} || git clone -b master ${plugin_repo} ${plugin_dir}

pkg_dir=/usr/local/test
repos_dir="${pkg_dir}/repos"
fingerprints_dir="${pkg_dir}/fingerprints"

echo "Creating main repos dir: ${repos_dir}"
mkdir -p $repos_dir

pkg_conf_path="${repos_dir}/test.conf"
echo "iocage-plugins: {" > $pkg_conf_path
echo "url: $packagesite," >> $pkg_conf_path
echo "signature_type: \"fingerprints\"," >> $pkg_conf_path
echo "fingerprints \"${fingerprints_dir}\"," >> $pkg_conf_path
echo "enabled: true" >> $pkg_conf_path
echo } >> $pkg_conf_path
echo "Created test pkg config file:"
cat $pkg_conf_path

trusted_fingerprints="$fingerprints_dir/trusted"
mkdir -p "${trusted_fingerprints}"

for repo_name in $fingerprints
do
  repo_fingerprints=$(jq -rc '."fingerprints"."'${repo_name}'"[]' $PLUGIN_FILE)

  repo_count=1
  echo $repo_fingerprints | while IFS='' read f
  do
    echo "Creating fingerprint file for repo:"
    echo $f

    function=$(echo $f | jq -r '.function')
    fingerprint=$(echo $f | jq -r '.fingerprint')
    file_path=${trusted_fingerprints}/${repo_name}_${repo_count}

    echo "Creating new fingerprint file: ${file_path}"

    echo "function: $function" > ${file_path}
    echo "fingerprint: $fingerprint" >> ${file_path}

    repo_count=$(expr $repo_count + 1)
  done
done

if [ "$kmods" != "null" ]
then
  echo $kmods | jq -r  '.[]' | while IFS='' read kmod
  do
    echo "Loading kmod: ${kmod}"
    kldload -nv ${kmod}
  done
fi

# Clean up all packages
pkg delete --all --yes
pkg autoremove --yes
pkg clean --yes

if echo ${packagesite} | grep -q "https"
then
  pkg install --yes ca_root_nss
fi

# Start using plugin repos
export REPOS_DIR=$repos_dir

echo "Fetching $name pkgs: $pkgs"
pkg fetch --dependencies --yes $pkgs

pkg delete --yes ca_root_nss || true

echo "Installing $name pkgs: $pkgs"
pkg install --no-repo-update --yes $pkgs

if [ -d "${plugin_dir}/overlay" ]
then
  echo "Found overlay folder"
  cp -r ${plugin_dir}/overlay/ /
fi

${plugin_dir}/post_install.sh

if [ -f ${plugin_dir}/pre_update.sh ] && ! [ -x ${plugin_dir}/pre_update.sh ]
then
  echo "pre_update.sh script not executable"
  exit 1
fi

if [ -f ${plugin_dir}/post_update.sh ] && ! [ -x ${plugin_dir}/post_update.sh ]
then
  echo "post_update.sh script not executable"
  exit 1
fi
