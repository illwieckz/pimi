TrueCombat Installer
====================

Description
-----------

This tool helps user to install TrueCombat mods on GNU/Linux systems.

Only [ET:Legacy](http://etlegacy.com/) and [ioquake3](http://ioquake3.org/) engines are supported since they are the only way to get a working setup in modern distributions.

Current mods supported:

* **TrueCombat:Close Quarter Battle alpha 0.223** for Wolfenstein: Ennemy Territory
* **TrueCombat:Elite beta 0.49b** for Wolfenstein: Ennemy Territory
* **TrueCombat 1.3** for Quake Ⅲ Arena

This tool can help users to install these mods or to help packagers to build a package or write an installer around this downloader.

HOW TO
------

By default `./truecombat_installer.sh`

* installs _True Combat:Close Quarter Battle_.
* installs Wold:ET mods in `${HOME}/.etlegacy/` user directory
* installs Quake3 mod in `${HOME}/.q3a/` user directory
* download stuff in `/tmp/truecombat_files`

All this things can be changed, for example this command:

```
./truecombat_installer.sh -dl="$(mktemp -d)" \
    -ioq=/usr/share/games/quake3/ -etl=/usr/share/games/etlegacy/ all
```

will install _True Combat:Close Quarter Battle_, _TrueCombat:Elite_ and _TrueCombat 1.3_ inside _Enemy Territory: Legacy_ and _ioquake3_ system directories.

See `./truecombat_installer.sh --help` for detailed information.

WARNING
-------

TrueCombat:Elite is distributed as a bzip2 tarball inside a gzip tarball embeddeded in a gzipped shell script plus a zip patch archive.
Extracting this mod will perform all these steps backwards, and will fill some gigabytes in your temporary directory.

It's a good idea to install mods in a temporary directory and to check if all is fine before writing inside an existing ET:Legacy or ioquake3 installation.

No warranty is given, use this at your own risk.

AUTHOR
------

Thomas Debesse <dev@illwieckz.net>

COPYRIGHT
---------

This script is distributed under the highly permissive and laconic [ISC License](COPYING.md).
