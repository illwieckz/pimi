PIMI
====

Description
-----------

PIMI stands for “Popular IdTech Mod Installer”.

This tool helps users to install [Wolfenstein: Enemy Territory](http://www.splashdamage.com/wolfet) and [TrueCombat](http://truecombatelite.com/) mods on GNU/Linux systems.

Only [ET:Legacy](http://etlegacy.com/) and [ioquake3](http://ioquake3.org/) engines are supported since they are the only viable way to get a working setup in modern distributions. However it will not impede you to use deprecated engines.

Supported ET:Legacy mods:

* **Wolfenstein: Enemy Territory 2.60 patch b**
* **TrueCombat:Close Quarters Battle alpha 0.22 patch 3**
* **TrueCombat:Elite beta 0.4 build 9 patch b**

Supported ioquake3 mods:

* **TrueCombat beta 1.3**
* **TrueCombat beta 0.45 build 12**

Additionnal Mac OS X and Windows binaries and libraries are not extracted from official packages to provide a clean GNU/Linux installation.

Help
----

From `./pimi.sh --help`:

```
Usage: ./pimi.sh [OPTION]... MOD NAME [MOD NAME]...

./pimi.sh is a tool to install popular mods for Enemy Territory: Legacy and ioquake3 engines.

Without OPTION:
- installs mods in Enemy Territory: Legacy and ioquake3 user directories.
- downloads temporary files to “/tmp/pimi_files” directory.
- does not purge downloaded temporary files.
- asks user before doing anything.

OPTIONS
	-tmp=PATH, --temporary-directory=PATH
	    download files in PATH directory
	-etl=PATH, --etlegacy-directory=PATH
	    install Enemy Territory: Legacy mods in PATH directory
	-ioq=PATH, --ioquake3-directory=PATH
	    install Quake Ⅲ Arena mods in PATH directory

	-y, --yes
	    assume yes, do not ask before doing something
	-f,  --force-redownload
	    force to download again already downloaded files
	-p,  --purge-after
	    purge downloaded temporary files after installation
	-h,  --help
	    print this help

MOD NAMES
	etmain
	    Wolfenstein: Enemy Territory 2.60 patch b for Enemy Territory: Legacy
	cqb, cqbtest
	    TrueCombat:Close Quarters Battle alpha 0.22 patch 3 for Enemy Territory: Legacy
	tce, tcetest
	    TrueCombat:Elite beta 0.4 build 9 patch b for Enemy Territory: Legacy
	truecombat
	    TrueCombat beta 1.3 for ioquake3
	q3tc045
	    TrueCombat beta 0.45 build 12 for ioquake3

	all
	    an alias for “etmain cqbtest tcetest truecombat q3tc045”

	nothing
	    nothing

EXAMPLES
To install Wolfenstein: Enemy Territory 2.60 patch b for Enemy Territory: Legacy:
$ ./pimi.sh etmain

To install both TrueCombat:Close Quarters Battle alpha 0.22 patch 3
and TrueCombat:Elite beta 0.4 build 9 patch b:
$ ./pimi.sh cqbtest tcetest

To purge already downloaded files without installing anything more:
$ ./pimi.sh --purge-after nothing

To install TrueCombat beta 1.3 mod using a random temporary directory, automatically
deleting temporary files, in non interactive mode:
$ ./pimi.sh -p -ni -dl="$(mktemp -d)" truecombat

To install TrueCombat:Elite beta 0.4 build 9 patch b mod inside
Wolfenstein: Enemy Territory user directory (not recommended at all):
$ ./pimi.sh -etl="${HOME}/.etwolf"

To install all mods inside system directories:
# ./pimi.sh -ioq="/usr/share/games/quake3" -etl="/usr/share/games/etlegacy" all

```

Warning
-------

TrueCombat:Elite and TrueCombat:Close Quarters Battle mods run on 32bit i386 platform only.

TrueCombat:Elite is distributed as a bzip2 tarball inside a gzip tarball embeddeded in a gzipped shell script plus a zip patch archive.
Extracting this mod will perform all these steps backwards, and will fill some gigabytes in your temporary directory.

Beware, PIMI will overwrite existing installation.

No warranty is given, use this at your own risk.

Author
------

Thomas Debesse <dev@illwieckz.net>

Copyright
---------

This script is distributed under the highly permissive and laconic [ISC License](COPYING.md).
