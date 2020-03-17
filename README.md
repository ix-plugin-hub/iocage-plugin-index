![Validate JSONs](https://github.com/ix-plugin-hub/iocage-plugin-index/workflows/Validate%20JSONs/badge.svg)

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
