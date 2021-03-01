[plugins-shield]:https://img.shields.io/badge/TrueNAS%20CORE-Community%20Plugins-blue?logo=TrueNAS&style=for-the-badge
[plugins-link]:https://www.truenas.com/plugins/
[release-shield]:https://img.shields.io/badge/Default%20Branch-12.2--RELEASE-blue?logo=FreeBSD&logoColor=red&style=for-the-badge
[release-link]:https://www.freebsd.org/releases/12.2R/relnotes/

[![x][plugins-shield]][plugins-link] [![x][release-shield]][release-link]

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
[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=backuppc&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=backuppc&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=bazarr&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=bazarr&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=bind&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=bind&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=calibre-web&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=calibre-web&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=channels-dvr&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=channels-dvr&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=clamav&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=clamav&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=deluge-pip&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=deluge-pip&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=dnsmasq&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=dnsmasq&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=drupal8&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=drupal8&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=duplicati&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=duplicati&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=emby&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=emby&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=emby-server-stable&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=emby-server-stable&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=esphome&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=esphome&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=famp&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=famp&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gitea&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gitea&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gitlab&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gitlab&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gogs&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=gogs&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=grafana&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=grafana&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=heimdall-dashboard&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=heimdall-dashboard&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=homeassistant&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=homeassistant&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=homebridge&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=homebridge&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=hoobs&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=hoobs&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=i2p&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=i2p&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=irssi&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=irssi&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jackett&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jackett&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jenkins&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jenkins&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jenkins-lts&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=jenkins-lts&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=lidarr&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=lidarr&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=madsonic&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=madsonic&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=mineos&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=mineos&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=monica&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=monica&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=mosquitto&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=mosquitto&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=motioneye&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=motioneye&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=netdata&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=netdata&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=node-red&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=node-red&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=nzbget&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=nzbget&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=openspeedtest-server&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=openspeedtest-server&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=openvpn&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=openvpn&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=privatebin&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=privatebin&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=qbittorrent&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=qbittorrent&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=quasselcore&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=quasselcore&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=radarr&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=radarr&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=rslsync&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=rslsync&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=rtorrent-flood&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=rtorrent-flood&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sabnzbd&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sabnzbd&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sickchill&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sickchill&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sonarr&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=sonarr&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=tasmoadmin&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=tasmoadmin&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=tautulli&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=tautulli&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=transmission&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=transmission&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=unificontroller&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=unificontroller&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=unificontroller-lts&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=unificontroller-lts&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=vault&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=vault&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=weechat&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=weechat&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=xmrig&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=xmrig&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zoneminder&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zoneminder&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zrepl&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zrepl&branch=master)

[![Build Status](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zwavejs2mqtt&branch=master)](https://api.cirrus-ci.com/github/ix-plugin-hub/iocage-plugin-index.svg?task=zwavejs2mqtt&branch=master)
