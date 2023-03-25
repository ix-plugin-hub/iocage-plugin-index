[plugins-shield]:https://img.shields.io/badge/TrueNAS%20CORE-Community%20Plugins-blue?logo=TrueNAS&style=for-the-badge
[plugins-link]:https://www.truenas.com/plugins/
[release-shield]:https://img.shields.io/badge/Default%20Branch-13.1--RELEASE-blue?logo=FreeBSD&logoColor=red&style=for-the-badge
[release-link]:https://www.freebsd.org/releases/12.2R/relnotes/

[![x][plugins-shield]][plugins-link] [![x][release-shield]][release-link]

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ix-plugin-hub/iocage-plugin-index/Validate%20JSONs?label=Validate%20JSONs&logo=github&style=for-the-badge)
[![Cirrus CI - Task and Script Build Status](https://img.shields.io/cirrus/github/ix-plugin-hub/iocage-plugin-index?label=Install%20test&logo=cirrus-ci&logoColor=green&style=for-the-badge)](https://cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index/master)

# iocage-ix-plugins
Community created plugins for [TrueNAS](https://www.truenas.com/) and [FreeBSD](http://www.freebsd.org)

# Creating Plugins
Add a plugin JSON file to this repo along with an appropriate icon in the [icons directory](icons/).

After creating the JSON file and adding an icon, add the plugin to the [INDEX file](INDEX).
If the plugin is approved, it appears in the list of iocage plugins.

For more detailed information on creating a plugin, see [Create a Plugin](https://www.ixsystems.com/documentation/freenas/11.2-U6/plugins.html#create-a-plugin).

# Installing Plugins

## Using Local File
Install a plugin using a local file:
<pre>
iocage fetch -P /path/to/local/file.json ip4_addr="<i>interface</i>|<i>IPaddress</i>"
</pre>
where *interface* is the name of the active network interface and *IP address* is the desired IP address for the plugin.
For example, `ip4_addr="em0|10.238.4.196"`.

## Pulling from Internet
Install a plugin from the internet:
<pre>
iocage fetch -P jenkins -g https://github.com/ix-plugin-hub/iocage-plugin-index ip4_addr="<i>interface</i>|<i>IPaddress</i>"
</pre>
where *interface* is the name of the active network interface and *IP address* is the desired IP address for the plugin.
For example, `ip4_addr="igb0|192.168.0.91"`

# Plugin installation tests
This repository contains cirrus-ci tasks for automated plugin installation tests executed as a part of the PR checks and on the `master` branch.

[.cirrus/install_script.sh](.cirrus/install_script.sh) is the installation test script run for every plugin included in the [.cirrus.yml](.cirrus.yml) file.

## Plugin block
The following `.cirrus.yml` task shows an example of needed YAML section to enable automatic installation test for a plugin.

```yaml
<PLUGIN_NAME>_task:
  <<: *INSTALL_PLUGIN
  only_if: "changesInclude('<PLUGIN_NAME>.json', '.cirrus/install_script.sh')"
  matrix:
    - freebsd_instance:
        image_family: freebsd-12-2
  env:
    PLUGIN_FILE: "<PLUGIN_NAME>.json"
```

### Block variables
*  `<PLUGIN_NAME>` should equal (and be replaced with) the plugin JSON file name (without the `.json` file suffix)
* The `matrix` -> `freebsd_instance` -> `image_family` should match the plugin manifest FreeBSD version. Alternatively this `matrix` can be a list of `freebsd_instances` with different versions if multiple FreeBSD versions are supported or needed to be tested
* **required** `env` variables:
  * `PLUGIN_FILE` should equal the plugin manifest file and is the one parsed inside the `install_script`
* **optional** `env` variables:
  * `ADMIN_UI_USER` should be used if there is a username/password required to reach the admin UI. Value should have the format: `<username>:<password>`
  * `FOLLOW_REDIRECTS` if set to `"false"` will not follow redirects to admin UI and treat a 3XX code as success for the admin portal UI check
  * `SKIP_UI_CHECK` if set to `"true"` will skip the admin portal UI check entirely
  * `SKIP_SERVICE_CHECK` if set to `"true"` will skip checking if the services started in `post_install` are running
  * `OVERRIDE_ADMIN_UI` check this UI URL after plugin installation instead of the URL specified in plugin `ui.json`
