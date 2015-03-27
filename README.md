PIMI
====

Description
-----------

PIMI stands for “Popular IdTech Mod Installer”.

This tool helps users to install [Wolfenstein: Enemy Territory](http://www.splashdamage.com/wolfet) and [TrueCombat](http://truecombatelite.com/) on GNU/Linux systems.

Only [ET:Legacy](http://etlegacy.com/) and [ioquake3](http://ioquake3.org/) engines are supported since they are the only viable way to get a working setup in modern distributions. However it will not impede you to use deprecated engines.

Because Quake Ⅲ Arena is not free, PIMI offers an option to install Quake Ⅲ Arena mods as [OpenArena](http://openarena.ws) mods.

Supported ET:Legacy mods:

* **Wolfenstein: Enemy Territory 2.60 patch b**
* **TrueCombat:Close Quarters Battle alpha 0.22 patch 3**
* **TrueCombat:Elite beta 0.4 build 9 patch b**
* **ETNam 0.1.0**

Supported ioquake3 mods:

* **TrueCombat beta 1.3**
* **TrueCombat beta 0.45 build 12**

Additionnal Mac OS X and Windows binaries and libraries are not extracted from official packages to provide a clean GNU/Linux installation.

PIMI uses `wget` to download stuff, `tar` (with gzip and bzip2 support), `gzip` and `7zip` binaries to extract archives.

Help
----

From `./pimi.sh --help`:

```
Usage: ./pimi.sh [OPTION]... MOD NAME [MOD NAME]...

./pimi.sh is a tool to install popular mods for ET:Legacy and ioquake3 engines.

Without OPTION:
- installs mods in Enemy Territory: Legacy and Quake Ⅲ Arena user directories.
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

	-oa, --openarena
	    install Quake Ⅲ Arena mods in OpenArena directory

	-y, --yes
	    assume yes, do not ask before doing something
	-v,  --verbose
		    print download progression information
	-f,  --force-redownload
	    force to download again already downloaded files
	-p,  --purge-after
	    purge downloaded temporary files after installation
	-h,  --help
	    print this help

MOD NAMES
	etmain
	    Wolfenstein: Enemy Territory 2.60 patch b for ET:Legacy
	etnam
		    ETNam 0.1.0 for ET:Legacy
	cqb, cqbtest
	    TrueCombat:Close Quarters Battle alpha 0.22 patch 3 for ET:Legacy
	tce, tcetest
	    TrueCombat:Elite beta 0.4 build 9 patch b for ET:Legacy
	truecombat
	    TrueCombat beta 1.3 for ioquake3
	q3tc045
	    TrueCombat beta 0.45 build 12 for ioquake3

	all
	    an alias for “etmain etnam cqbtest tcetest truecombat q3tc045”

	nothing
	    nothing

EXAMPLES
To install Wolfenstein: Enemy Territory as an Enemy Territory: Legacy mod:
$ ./pimi.sh etmain

To install both TrueCombat:Close Quarters Battle and TrueCombat:Elite:
$ ./pimi.sh cqbtest tcetest

To install TrueCombat beta 0.45 build 12 as an OpenArena mod:
$ ./pimi.sh -oa q3tc045

To purge already downloaded files without installing anything more:
$ ./pimi.sh --purge-after nothing

To install TrueCombat beta 1.3 using a random temporary directory, automatically
deleting temporary files, in non interactive mode:
$ ./pimi.sh -p -ni -dl="$(mktemp -d)" truecombat

To install TrueCombat:Elite inside Wolfenstein: Enemy Territory user directory
which is not recommended at all:
$ ./pimi.sh -etl="${HOME}/.etwolf" tcetest

To install all mods inside system directories:
# ./pimi.sh -ioq="/usr/share/games/quake3" -etl="/usr/share/games/etlegacy" all
```

Warning
-------

TrueCombat:Elite and TrueCombat:Close Quarters Battle mods run on 32bit i386 platform only.

TrueCombat:Elite is distributed as a bzip2 tarball inside a gzip tarball embeddeded in a gzipped shell script plus a zip patch archive.
Extracting this mod will perform all these steps backwards, and will fill some gigabytes in your temporary directory.

Beware, PIMI will overwrite existing installations.

No warranty is given, use this at your own risk.

Author
------

Thomas Debesse <dev@illwieckz.net>

Copyright
---------

This script is distributed under the highly permissive and laconic [ISC License](COPYING.md).
