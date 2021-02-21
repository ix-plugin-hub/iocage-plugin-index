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
[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=backuppc&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=backuppc&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=bazarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=bazarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=bind&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=bind&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=calibre-web&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=calibre-web&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=channels-dvr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=channels-dvr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=clamav&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=clamav&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=deluge-pip&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=deluge-pip&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=dnsmasq&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=dnsmasq&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=drupal8&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=drupal8&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=duplicati&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=duplicati&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=emby&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=emby&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=emby-server-stable&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=emby-server-stable&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=esphome&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=esphome&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=famp&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=famp&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gitea&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gitea&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gitlab&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gitlab&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gogs&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=gogs&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=grafana&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=grafana&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=heimdall-dashboard&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=heimdall-dashboard&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=homeassistant&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=homeassistant&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=homebridge&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=homebridge&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=hoobs&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=hoobs&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=i2p&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=i2p&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=irssi&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=irssi&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jackett&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jackett&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jenkins&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jenkins&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jenkins-lts&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=jenkins-lts&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=lidarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=lidarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=madsonic&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=madsonic&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=mineos&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=mineos&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=monica&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=monica&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=mosquitto&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=mosquitto&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=motioneye&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=motioneye&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=netdata&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=netdata&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=node-red&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=node-red&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=nzbget&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=nzbget&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=openspeedtest-server&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=openspeedtest-server&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=openvpn&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=openvpn&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=privatebin&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=privatebin&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=qbittorrent&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=qbittorrent&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=quasselcore&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=quasselcore&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=radarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=radarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=rslsync&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=rslsync&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=rtorrent-flood&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=rtorrent-flood&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sabnzbd&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sabnzbd&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sickchill&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sickchill&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sonarr&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=sonarr&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=tasmoadmin&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=tasmoadmin&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=tautulli&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=tautulli&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=transmission&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=transmission&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=unificontroller&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=unificontroller&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=unificontroller-lts&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=unificontroller-lts&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=vault&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=vault&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=weechat&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=weechat&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=xmrig&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=xmrig&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zoneminder&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zoneminder&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zrepl&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zrepl&branch=test-install-plugins>)

[![Build Status](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zwavejs2mqtt&branch=test-install-plugins)](https://api.cirrus-ci.com/github/fulder/iocage-plugin-index.svg?task=zwavejs2mqtt&branch=test-install-plugins>)
