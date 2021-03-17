The cirrus `install_script.sh` is the installation test script run for every plugin included in the `.cirrus.yml` file.

# Plugin block
The following `.cirrus.yml` task shows an example of needed values to enable automatic installation test for a plugin.

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

## Block variables
*  `<PLUGIN_NAME>` should equal the plugin JSON file name (without the `.json` file suffix)
* The `freebsd_instance` `image_family` should match the plugin manifest FreeBSD version (or be a list of all supported/tested versions)
* **required** `env` variables:
  * `PLUGIN_FILE`: is the file parsed inside the `isntall_script`
* **optional** `env` variables:  
  * `ADMIN_UI_USER`: should be used if there is a username/password required to reach the admin UI. Value should have the format: `<username>:<password>`
  * `FOLLOW_REDIRECTS`: if set to `"false"` will not follow redirects to admin UI and threat a 3XX code as success for the admin UI check
  * `SKIP_UI_CHECK`: if set to `"true"` will skip the admin portal control entirely
  * `SKIP_SERVICE_CHECK`: if set to `"true"` will skip checking if the services started in `post_install` are running 


