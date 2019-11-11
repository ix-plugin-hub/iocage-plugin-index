# iocage-ix-plugins
Official iXsystems iocage plugins for [FreeNAS](http://www.freenas.org), [TrueOS](https://www.trueos.org) and [FreeBSD](http://www.freebsd.org)

Plugin Json files are added to this repo, along with a respective icon in icons/

When a plugin is made 'official' it should be added to the INDEX json and
it will appear in iocage's plugin listing

# Installing Plugins

## Using Local File
```
iocage fetch -P /path/to/local/file.json
```

## Pulling from Internet
```
iocage fetch -unificontroller -g https://github.com/ix-plugin-hub/iocage-plugin-index
```
