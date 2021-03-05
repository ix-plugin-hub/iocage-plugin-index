[plugins-shield]:https://img.shields.io/badge/TrueNAS%20CORE-Community%20Plugins-blue?logo=TrueNAS&style=for-the-badge
[plugins-link]:https://www.truenas.com/plugins/
[release-shield]:https://img.shields.io/badge/Default%20Branch-12.2--RELEASE-blue?logo=FreeBSD&logoColor=red&style=for-the-badge
[release-link]:https://www.freebsd.org/releases/12.2R/relnotes/

[![x][plugins-shield]][plugins-link] [![x][release-shield]][release-link]

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ix-plugin-hub/iocage-plugin-index/Validate%20JSONs?label=Validate%20JSONs&logo=github&style=for-the-badge)
[![Cirrus CI - Task and Script Build Status](https://img.shields.io/cirrus/github/ix-plugin-hub/iocage-plugin-index?label=Install%20test&logo=cirrus-ci&logoColor=green&style=for-the-badge)](https://cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index/master)

# iocage-ix-plugins
Official community created plugins for [FreeNAS](http://www.freenas.org) and [FreeBSD](http://www.freebsd.org)

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
