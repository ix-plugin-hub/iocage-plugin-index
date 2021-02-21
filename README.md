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

## Plugin build status
[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_backuppc&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_backuppc&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_bazarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_bazarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_bind&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_bind&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_calibre-web&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_calibre-web&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_channels-dvr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_channels-dvr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_clamav&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_clamav&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_deluge-pip&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_deluge-pip&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_dnsmasq&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_dnsmasq&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_drupal8&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_drupal8&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_duplicati&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_duplicati&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_emby&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_emby&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_emby-server-stable&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_emby-server-stable&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_esphome&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_esphome&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_famp&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_famp&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gitea&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gitea&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gitlab&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gitlab&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gogs&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_gogs&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_grafana&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_grafana&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_heimdall-dashboard&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_heimdall-dashboard&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_homeassistant&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_homeassistant&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_homebridge&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_homebridge&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_hoobs&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_hoobs&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_i2p&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_i2p&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_irssi&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_irssi&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jackett&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jackett&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jenkins&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jenkins&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jenkins-lts&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_jenkins-lts&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_lidarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_lidarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_madsonic&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_madsonic&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_mineos&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_mineos&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_monica&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_monica&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_mosquitto&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_mosquitto&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_motioneye&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_motioneye&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_netdata&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_netdata&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_node-red&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_node-red&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_nzbget&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_nzbget&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_openspeedtest-server&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_openspeedtest-server&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_openvpn&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_openvpn&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_privatebin&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_privatebin&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_qbittorrent&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_qbittorrent&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_quasselcore&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_quasselcore&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_radarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_radarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_rslsync&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_rslsync&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_rtorrent-flood&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_rtorrent-flood&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sabnzbd&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sabnzbd&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sickchill&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sickchill&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sonarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_sonarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_tasmoadmin&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_tasmoadmin&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_tautulli&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_tautulli&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_transmission&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_transmission&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_unificontroller&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_unificontroller&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_unificontroller-lts&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_unificontroller-lts&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_vault&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_vault&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_weechat&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_weechat&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_xmrig&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_xmrig&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zoneminder&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zoneminder&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zrepl&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zrepl&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zwavejs2mqtt&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=install_zwavejs2mqtt&branch=test-install-plugins>)