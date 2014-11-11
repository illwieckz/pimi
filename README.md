TrueCombat Installer
====================

Description
-----------

This tool helps users to install [TrueCombat](http://truecombatelite.com/) mods on GNU/Linux systems.

Only [ET:Legacy](http://etlegacy.com/) and [ioquake3](http://ioquake3.org/) engines are supported since they are the only viable way to get a working setup in modern distributions. However it will not impede you to use deprecated engines.

Current mods supported:

* **TrueCombat:Close Quarter Battle alpha 0.223** for Wolfenstein: Enemy Territory
* **TrueCombat:Elite beta 0.4 build 9b** for Wolfenstein: Enemy Territory
* **TrueCombat 1.3** for Quake Ⅲ Arena

This tool can help users to install these mods or to help packagers to build a package or write an installer around this downloader.

Help
----

From `./truecombat_installer.sh --help`:

```
Usage: ./truecombat_installer.sh [OPTION]... [MOD NAME]...

./truecombat_installer.sh is a tool to install TrueCombat mods for Wolfenstein: Enemy Territory and Quake Ⅲ Arena games.

Without MOD NAME:
- installs TrueCombat:Close Quarter Battle alpha 0.223 for Wolfenstein: Enemy Territory in “${HOME}/.etlegacy/cqbtest”.

Without OPTION:
- installs mods in Enemy Territory: Legacy and ioquake3 user directories.
- download temporary files to “/tmp/truecombat_files” directory.
- does not purge downloaded temporary files.
- asks user before doing anything.

OPTIONS
	-dl=PATH,  --download-directory=PATH    download files in this directory
	-etl=PATH, --etlegacy-directory=PATH    install Wolfenstein: Enemy Territory mods in this directory
	-ioq=PATH, --ioquake3-directory=PATH    install Quake Ⅲ Arena mods in this directory

	-ni, --not-interactive    do not ask before doing anything
	-f,  --force-redownload   force to download again already downloaded files
	-p,  --purge-after        purge downloaded temporary files after installation
	-h,  --help               print this help

MOD NAMES
	cqb, cqbtest   TrueCombat:Close Quarter Battle alpha 0.223 for Wolfenstein: Enemy Territory
	tce, tcetest   TrueCombat:Elite beta 0.4 build 9b for Wolfenstein: Enemy Territory
	truecombat     TrueCombat 1.3 for Quake Ⅲ Arena

	default        an alias for “cqbtest”
	all            an alias for “cqbtest tcetest truecombat”

	nothing        nothing

EXAMPLES
To install TrueCombat:Close Quarter Battle:
$ ./truecombat_installer.sh

To purge already downloaded files without installing anything more:
$ ./truecombat_installer.sh --purge-after nothing

To install  mod using a random temporary directory,
  automatically delete temporary files, in non interactive mode:
$ ./truecombat_installer.sh -p -dl="$(mktemp -d)" truecombat

To install TrueCombat:Elite mod in Wolfenstein: Enemy Territory user directory (not recommended at all):
$ ./truecombat_installer.sh -etl="${HOME}/.etwolf"

To install TrueCombat:Close Quarter Battle, TrueCombat:Elite and TrueCombat mods
  inside Enemy Territory: Legacy and ioquake3 system directories (not recommended):
# ./truecombat_installer.sh -ioq="/usr/share/games/quake3" -etl="/usr/share/games/etlegacy" all

```

Warning
-------

TrueCombat mods run on 32bit i386 platform only.

TrueCombat:Elite is distributed as a bzip2 tarball inside a gzip tarball embeddeded in a gzipped shell script plus a zip patch archive.
Extracting this mod will perform all these steps backwards, and will fill some gigabytes in your temporary directory.

It's a good idea to install mods in a temporary directory and to check if all is fine before writing inside an existing ET:Legacy or ioquake3 installation.

No warranty is given, use this at your own risk.

Author
------

Thomas Debesse <dev@illwieckz.net>

Copyright
---------

This script is distributed under the highly permissive and laconic [ISC License](COPYING.md).
