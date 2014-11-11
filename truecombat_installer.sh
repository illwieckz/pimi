#! /bin/sh

# Author:  Thomas DEBESSE <dev@illwieckz.net>
# License: ISC

## Constants
############

constants () {
	wolfet_name="Wolfenstein: Enemy Territory"
	etlegacy_name="Enemy Territory: Legacy"
	quake3_name="Quake Ⅲ Arena"
	ioquake3_name="ioquake3"

	cqb_name="TrueCombat:Close Quarter Battle"
	cqb_mod_name="cqbtest"
	cqb_version="alpha 0.223"

	tce_name="TrueCombat:Elite"
	tce_mod_name="tcetest"
	tce_version="beta 0.4 build 9b"

	tc_name="TrueCombat"
	tc_mod_name="truecombat"
	tc_version="1.3"

	wolfet_user_directory=".etwolf"
	etlegacy_user_directory=".etlegacy"
	ioquake3_user_directory=".q3a"
	quake3_user_directory=".q3a"

	default_download_directory="/tmp/truecombat_files"

	cqb_full_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1285&Itemid=17"
	cqb_full_zip_filename="cqb_alpha022_win_linux.zip"
	cqb_full_zip_sum="361b3e0ef8e35a5cb6550a9a8df06f85604d21f898b7c504d24119880add7b46b436f884f550930491f2a6ed071eae8b88678f61dc06e4fdb4efdd8959799aef"
	cqb_full_zip_size="309240933"
	cqb_full_zip_hsize="295M"

	cqb_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1287&Itemid=17"
	cqb_patch_zip_filename="cqb_alpha0223_win_linux_patch.zip"
	cqb_patch_zip_sum="5fa0c927c34fbffe19a2f7b05cdd361305c7d8b1b00076281e19087716c26e938d4d1e27bea25ba9d74f075ca6ea1766269a4b71f6f7db4764b43d4619804c91"
	cqb_patch_zip_size="10680693"
	cqb_patch_zip_hsize="11M"

	tce_full_run_gz_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=3&Itemid=17"
	tce_full_run_gz_filename="TrueCombatElite_v049_Linux.run.gz"
	tce_full_run_gz_sum="95df41b591db28dc4da33375428d9394651f73a3fa7c93f7d6738c3aadb05d42bac1bb0de93ab05cc5954f4338f3026e97b71bca44ca94cafa5cc139a546a336"
	tce_full_run_gz_size="475370745"
	tce_full_run_gz_hsize="453Mb"

	tce_full_run_filename="TrueCombatElite_v049_Linux.run"
	tce_full_run_sum="e3a0c0d4c65bed324b3f2f89ca77a51a162610a59333e58c621f651e42c97e7a180d04fe7f708530d97379d83d7a67f660c668ea3d93f7536fa390d91e9b49f4"
	tce_full_run_size="475304070"

	tce_full_tar_gz_filename="TrueCombatElite_v049_Linux.tar.gz"
	tce_full_tar_gz_sum="54233ee01a56e20cc1eeefd90b58ec40bb117f78011b2ac3b63a2b7cdcc2753223f2c343657dfe83585b6355c1bd9e68463580751bc5645ea157989240b51c3d"
	tce_full_tar_gz_size="475295240"
	tce_full_tar_gz_offset="8831"

	tce_full_tar_bz2_filename="tce_0.49.tar.bz2"
	tce_full_tar_bz2_sum="ff5cf836b5cedda75434678feac4d35ee8bae3ad6330e07d447f3d5c77e9c6c26ae073cf340fc277645b6ed1fc61326c02ffdbbcd2a30bd630acb7b0b46364e2"
	tce_full_tar_bz2_size="471775660"

	tce_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=2&Itemid=17"
	tce_patch_zip_filename="tce049b_all_os_fixed.zip"
	tce_patch_zip_sum="8814f193437551c29edf88087229ee813317df10e264c3a0200942ef7c1e876aacff4d985d28bd59d1b3bd9589c86ad034d59a8f434cb443a31e07db9b0562da"
	tce_patch_zip_size="6795533"
	tce_patch_zip_hsize="6.5Mb"

	tc_full_11_zip_url="http://tce.merlin1991.at/tc/TrueCombat11Full.zip"
	tc_full_11_zip_filename="TrueCombat11Full.zip"
	tc_full_11_zip_sum="a4b36cd444d7de277ee6be5e3af038bb4aa583a2ce4b4a554c19ac46af628dbe045b77c3474e1a29736bb0624b62ff776c48202207b8d86daafad514971a5392"
	tc_full_11_zip_size="147175482"
	tc_full_11_zip_hsize="141M"

	tc_patch_12_zip_url="http://tce.merlin1991.at/tc/tc1.2_patch.zip"
	tc_patch_12_zip_filename="tc1.2_patch.zip"
	tc_patch_12_zip_sum="5f6f147e9fb24bd0fff5f516a7a492c63ad853eb3bd3a76d17ec4496f7e6a6e8463e07ce53031455f6dce73bc14af647e6673a7b19391e179723a6f253316fcc"
	tc_patch_12_zip_size="99781509"
	tc_patch_12_zip_hsize="96M"

	tc_patch_13_zip_url="http://tce.merlin1991.at/tc/tc1.3_patch.zip"
	tc_patch_13_zip_filename="tc1.3_patch.zip"
	tc_patch_13_zip_sum="a828de3f99d62b1b2e6cfe4542a4bf651ce360f4b130bffb1607c5bf67dad0fa506ba2ff5ffc5cf3ab896f1ae16b4eca74f886192ff81b2d4c4461ffea61aeb3"
	tc_patch_13_zip_size="58386008"
	tc_patch_13_zip_hsize="56M"
}

configure () {
	etlegacy_directory="${HOME}/${etlegacy_user_directory}"
	ioquake3_directory="${HOME}/${ioquake3_user_directory}"

	cqb_directory="${etlegacy_directory}/${cqb_mod_name}"
	tce_directory="${etlegacy_directory}/${tce_mod_name}"
	tc_directory="${ioquake3_directory}/${tc_mod_name}"

	cqb_full_zip_filepath="${download_directory}/${cqb_full_zip_filename}"
	cqb_patch_zip_filepath="${download_directory}/${cqb_patch_zip_filename}"

	tce_full_run_gz_filepath="${download_directory}/${tce_full_run_gz_filename}"
	tce_full_run_filepath="${download_directory}/${tce_full_run_filename}"
	tce_full_tar_gz_filepath="${download_directory}/${tce_full_tar_gz_filename}"
	tce_full_tar_bz2_filepath="${download_directory}/${tce_full_tar_bz2_filename}"
	tce_patch_zip_filepath="${download_directory}/${tce_patch_zip_filename}"

	tc_full_11_zip_filepath="${download_directory}/${tc_full_11_zip_filename}"
	tc_patch_12_zip_filepath="${download_directory}/${tc_patch_12_zip_filename}"
	tc_patch_13_zip_filepath="${download_directory}/${tc_patch_13_zip_filename}"
}

downloadable_filepath_list () {
	cat <<-EOF
	${cqb_full_zip_filepath}
	${cqb_patch_zip_filepath}
	${tce_full_run_gz_filepath}
	${tce_full_run_filepath}
	${tce_full_tar_gz_filepath}
	${tce_full_tar_bz2_filepath}
	${tce_patch_zip_filepath}
	${tc_full_11_zip_filepath}
	${tc_patch_12_zip_filepath}
	${tc_patch_13_zip_filepath}
	EOF
}

cqb_full_filename_list () {
	cat <<-EOF
	cqbtest/autoexec.cfg
	cqbtest/EULA_TrueCombat_CQB.txt
	cqbtest/pak0.pk3
	cqbtest/pak1.pk3
	cqbtest/pak2.pk3
	cqbtest/pak3.pk3
	cqbtest/pak4.pk3
	cqbtest/readme.txt
	EOF
}

cqb_patch_filename_list () {
	cat <<-EOF
	cqbtest/cgame.mp.i386.so
	cqbtest/changelog.txt
	cqbtest/mp_bin.pk3
	cqbtest/official.dat
	cqbtest/pak5.pk3
	cqbtest/qagame.mp.i386.so
	cqbtest/ui.mp.i386.so
	EOF
}

tce_full_filename_list () {
	cat <<-EOF
	tcetest/autoexec.cfg
	tcetest/cgame.mp.i386.so
	tcetest/changelog.rtf
	tcetest/official.dat
	tcetest/pak0.pk3
	tcetest/pak1.pk3
	tcetest/pak2.pk3
	tcetest/pak3.pk3
	tcetest/ReadMe.rtf
	EOF
}

tce_patch_filename_list () {
	cat <<-EOF
	mp_bin.pk3
	official.dat
	pak4.pk3
	qagame.mp.i386.so
	readme_tce0490b.txt
	ui.mp.i386.so
	cgame.mp.i386.so
	EOF
}

tc_full_11_zip_filename_list () {
	cat <<-EOF
	truecombat/1life.cfg
	truecombat/1lifecycle.cfg
	truecombat/3life.cfg
	truecombat/3lifecycle.cfg
	truecombat/5th*Readmes/5th.zip
	truecombat/ctf.cfg
	truecombat/ctfcycle.cfg
	truecombat/inflife.cfg
	truecombat/inflifecycle.cfg
	truecombat/description.txt
	truecombat/games.log
	truecombat/mapfiles
	truecombat/maplist.cfg
	truecombat/map_pak0.pk3
	truecombat/map_pak1.pk3
	truecombat/pak0.pk3
	truecombat/pak1.pk3
	truecombat/pak2.pk3
	truecombat/rotlist.cfg
	truecombat/tc.ico
	EOF
}

tc_patch_12_zip_filename_list () {
	cat <<-EOF
	help/tc_indochine*mapinfo.txt
	pak3.pk3
	server.cfg
	EOF
}

tc_patch_13_zip_filename_list () {
	cat <<-EOF
	maps.cfg
	question.ico
	tceula*1.3.rtf
	TrueCombat*1.3*Readme.txt
	pak5.pk3
	website.url
	EOF
}

## Common Stuff
###############

create_directory () {
	# $1: path
	# $2: description
	echo "Creating ${2} directory: ${1}"
	if mkdir "${1}"
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

check_directory () {
	# $1: path
	# $2: description
	echo "Verifying ${2} directory: ${1}"
	if [ -e "${1}" ]
	then
		if [ -d "${1}" ]
		then
			echo "Already there"
			true
		else
			echo "Error, not a directory"
			false
		fi
	else
		echo "Not here, must be created before"
		create_directory "${1}" "${2}"
	fi
}

verify () {
	# $1: path
	# $2: sum
	# $3: description
	echo "Verifying ${3}: ${1}"
	if [ "$(sha512sum "${1}" | cut -f1 -d' ')" = "${2}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

download () {
	# $1: url
	# $2: path
	# $3: description
	echo "Downloading ${3}: ${2}"
	if [ -f "${2}" ]
	then
		if [ "x${force_redownload}" != "xtrue" ]
		then
			echo "Already there"
			true
			return
		else
			echo "Already there, but redownloading"
		fi
	fi

	if wget --quiet "${1}" -O "${2}"
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
		fi
}

check_download_directory () {
	check_directory "${download_directory}" "download"
}

## Engine stuff
###############

check_etlegacy_directory () {
	check_directory "${etlegacy_directory}" "${etlegacy_name}"
}

check_ioquake3_directory () {
	check_directory "${ioquake3_directory}" "${ioquake3_name}"
}

## Close Quarter Battle Stuff
#############################

check_cqb_directory () {
	check_directory "${cqb_directory}" "${cqb_name}"
}

download_cqb_full_zip () {
	if download "${cqb_full_zip_url}" "${cqb_full_zip_filepath}" "${cqb_name} zip archive (${cqb_full_zip_hsize})"
	then
		verify "${cqb_full_zip_filepath}" "${cqb_full_zip_sum}" "${cqb_name} zip archive"
	fi
}

extract_cqb_full_files () {
	echo "Extracting ${cqb_name} archive files"
	if 7z x -y -o"${cqb_directory}/../" "${cqb_full_zip_filepath}" $(cqb_full_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_cqb_patch_zip () {
	if download "${cqb_patch_zip_url}" "${cqb_patch_zip_filepath}" "${cqb_name} zip archive (${cqb_patch_zip_hsize})"
	then
		verify "${cqb_patch_zip_filepath}" "${cqb_patch_zip_sum}" "${cqb_name} zip archive"
	fi
}

extract_cqb_patch_files () {
	echo "Extracting ${cqb_name} archive files"
	if 7z x -y -o"${cqb_directory}/../" "${cqb_patch_zip_filepath}" $(cqb_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

## TrueCombat:Elite Stuff
#########################

check_tce_directory () {
	check_directory "${tce_directory}" "${tce_name}"
}

download_tce_full_run_gz () {
	if download "${tce_full_run_gz_url}" "${tce_full_run_gz_filepath}" "${tce_name} installer archive (${tce_full_run_gz_hsize})"
	then
		verify "${tce_full_run_gz_filepath}" "${tce_full_run_gz_sum}" "${tce_name} installer archive"
	fi
}

extract_tce_full_run () {
	echo "Extracting ${tce_name} installer: ${tce_full_run_filepath}"
	if [ -f "${tce_full_run_filepath}" ]
	then
		echo "Already there"
		true
	else
		if gzip -d < "${tce_full_run_gz_filepath}" > "${tce_full_run_filepath}"
		then
			echo "Done"
			verify "${tce_full_run_filepath}"  "${tce_full_run_sum}" "${tce_name} installer"
		else
			echo "Failure"
			false
		fi
	fi

}

dump_tce_full_tar_gz () {
	echo "Dump ${tce_name} setup archive: ${tce_full_tar_gz_filepath}"
	if [ -f "${tce_full_tar_gz_filepath}" ]
	then
		echo "Already there"
		true
	else
		if dd if="${tce_full_run_filepath}" of="${tce_full_tar_gz_filepath}" ibs="${tce_full_tar_gz_offset}" skip=1 obs=1024 status=none
		then
			echo "Done"
			verify "${tce_full_tar_gz_filepath}" "${tce_full_tar_gz_sum}" "${tce_name} setup archive"
		else
			echo "Failure"
			false
		fi
	fi
}

pick_tce_full_tar_bz2 () {
	echo "Picking ${tce_name} archive: ${tce_full_tar_bz2_filepath}"
	if [ -f "${tce_full_tar_bz2_filepath}" ]
	then
		echo "Already there"
		true
	else
		if tar -xzf "${tce_full_tar_gz_filepath}" "./${tce_full_tar_bz2_filename}" -O > "${tce_full_tar_bz2_filepath}"
		then
			echo "Done"
			verify "${tce_full_tar_bz2_filepath}" "${tce_full_tar_bz2_sum}" "${tce_name} archive"
		else
			echo "Failure"
			false
		fi
	fi
}

extract_tce_full_files () {
	echo "Extracting ${tce_name} directory: ${tce_directory}"
	if tar -C "${tce_directory}/." --strip-components=1 -xjf "${tce_full_tar_bz2_filepath}" $(tce_full_filename_list)
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_tce_patch_zip () {
	if download "${tce_patch_zip_url}" "${tce_patch_zip_filepath}" "${tce_name} patch file (${tce_patch_zip_hsize})"
	then
		verify "${tce_patch_zip_filepath}" "${tce_patch_zip_sum}" "${tce_name} patch file"
	fi
}

extract_tce_patch_files () {
	echo "Extracting ${tce_name} patch files"
	if 7z x -y -o"${tce_directory}/./" "${tce_patch_zip_filepath}" $(tce_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

## TrueCombat Stuff
###################

check_tc_directory () {
	check_directory "${tc_directory}" "${tc_name}"
}

download_tc_full_11_zip () {
	if download "${tc_full_11_zip_url}" "${tc_full_11_zip_filepath}" "${tc_name} patch file (${tc_full_11_zip_hsize})"
	then
		verify "${tc_full_11_zip_filepath}" "${tc_full_11_zip_sum}" "${tc_name} patch file"
	fi
}

extract_tc_full_11_files () {
	echo "Extracting ${tc_name} zip files"
	if 7z x -y -o"${tc_directory}/../" "${tc_full_11_zip_filepath}" $(tc_full_11_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_tc_patch_12_files () {
	echo "Extracting ${tc_name} zip files"
	if 7z x -y -o"${tc_directory}/./" "${tc_patch_12_zip_filepath}" $(tc_patch_12_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_tc_patch_13_files () {
	echo "Extracting ${tc_name} zip files"
	if 7z x -y -o"${tc_directory}/./" "${tc_patch_13_zip_filepath}" $(tc_patch_13_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_tc_patch_12_zip () {
	if download "${tc_patch_12_zip_url}" "${tc_patch_12_zip_filepath}" "${tc_name} patch file (${tc_patch_12_zip_hsize})"
	then
		verify "${tc_patch_12_zip_filepath}" "${tc_patch_12_zip_sum}" "${tc_name} patch file"
	fi
}

download_tc_patch_13_zip () {
	if download "${tc_patch_13_zip_url}" "${tc_patch_13_zip_filepath}" "${tc_name} patch file (${tc_patch_13_zip_hsize})"
	then
		verify "${tc_patch_13_zip_filepath}" "${tc_patch_13_zip_sum}" "${tc_name} patch file"
	fi
}

## Purge
########

purge () {
	if [ "x${will_purge}" = "xtrue" ]
	then
		for downloadable_filepath in $(downloadable_filepath_list)
		do
			if [ -f "${downloadable_filepath}" ]
			then
				echo "Deleting ${downloadable_filepath} file"
				if rm "${downloadable_filepath}"
				then
					echo "Success"
					true
				else
					echo "Failure"
					false
					return
				fi
			fi
		done
		if [ -d "${downloadable_directory}" ]
		then
			echo "Deleting ${download_directory} directory"
			if rmdir "${downloadable_directory}"
			then
				echo "Success"
				true
			else
				echo "Failure"
				false
				return
			fi
		fi
	fi
}

## Installation
###############

install_cqb () {
	check_download_directory \
	&& check_etlegacy_directory \
	&& check_cqb_directory \
	&& download_cqb_full_zip \
	&& download_cqb_patch_zip \
	&& extract_cqb_full_files \
	&& extract_cqb_patch_files
}

install_tce () {
	check_download_directory \
	&& check_etlegacy_directory \
	&& check_tce_directory \
	&& download_tce_full_run_gz \
	&& download_tce_patch_zip \
	&& extract_tce_full_run \
	&& dump_tce_full_tar_gz \
	&& pick_tce_full_tar_bz2 \
	&& extract_tce_full_files \
	&& extract_tce_patch_files
}

install_tc () {
	check_download_directory \
	&& check_ioquake3_directory \
	&& check_tc_directory \
	&& download_tc_full_11_zip \
	&& download_tc_patch_12_zip \
	&& download_tc_patch_13_zip \
	&& extract_tc_full_11_files \
	&& extract_tc_patch_12_files \
	&& extract_tc_patch_13_files
}

## Arguments
############

print_help () {
	tab="$(printf '\t')"
	cat <<-EOF
	Usage: ${0} [OPTION]... [MOD NAME]...
	
	${0} is a tool to install TrueCombat mods for ${wolfet_name} and ${quake3_name} games.
	
	Without MOD NAME:
	- installs ${cqb_name} ${cqb_version} for ${wolfet_name} in “\${HOME}/${etlegacy_user_directory}/${cqb_mod_name}”.

	Without OPTION:
	- installs mods in ${etlegacy_name} and ${ioquake3_name} user directories.
	- download temporary files to “${default_download_directory}” directory.
	- does not purge downloaded temporary files.
	- asks user before doing anything.

	OPTIONS
	${tab}-dl=PATH,  --download-directory=PATH    download files in this directory
	${tab}-etl=PATH, --etlegacy-directory=PATH    install ${wolfet_name} mods in this directory
	${tab}-ioq=PATH, --ioquake3-directory=PATH    install ${quake3_name} mods in this directory

	${tab}-ni, --not-interactive    do not ask before doing anything
	${tab}-f,  --force-redownload   force to download again already downloaded files
	${tab}-p,  --purge-after        purge downloaded temporary files after installation
	${tab}-h,  --help               print this help

	MOD NAMES
	${tab}cqb, cqbtest   ${cqb_name} ${cqb_version} for ${wolfet_name}
	${tab}tce, tcetest   ${tce_name} ${tce_version} for ${wolfet_name}
	${tab}truecombat     ${tc_name} ${tc_version} for ${quake3_name}

	${tab}default        an alias for “cqbtest”
	${tab}all            an alias for “cqbtest tcetest truecombat”

	${tab}nothing        nothing

	EXAMPLES
	To install ${cqb_name}:
	$ ${0}

	To purge already downloaded files without installing anything more:
	$ ${0} --purge-after nothing

	To install ${truecombat_name} mod using a random temporary directory,
	  automatically delete temporary files, in non interactive mode:
	$ ${0} -p -dl="\$(mktemp -d)" ${tc_mod_name}

	To install ${tce_name} mod in ${wolfet_name} user directory (not recommended at all):
	$ ${0} -etl="\${HOME}/${wolfet_user_directory}"

	To install ${cqb_name}, ${tce_name} and ${tc_name} mods
	  inside ${etlegacy_name} and ${ioquake3_name} system directories (not recommended):
	# ${0} -ioq="/usr/share/games/quake3" -etl="/usr/share/games/etlegacy" all
	EOF
}

parse_args () {
	will_purge="false"
	force_redownload="false"
	install_nothing="false"
	is_interactive="true"
	download_directory="${default_download_directory}"
	mod_list=""

	for arg in ${@}
	do
		case "${arg}" in
			default|cqbtest|cqb)
				mod_list="${mod_list} cqbtest"
				;;
			tcetest|tce)
				mod_list="${mod_list} tcetest"
				;;
			truecombat|tc)
				mod_list="${mod_list} truecombat"
				;;
			all)
				mod_list="cqbtest tcetest truecombat"
				;;
			nothing)
				install_nothing="true"
				;;
			--purge-after|-p)
				will_purge="true"
				;;
			--force-redownload|-f)
				force_redownload="true";
				;;
			--download-directory=*|-dl=*)
				download_directory="$(echo "${arg}" | cut -d'=' -f2)"
				;;
			--etlegacy-directory=*|-etl=*)
				etlegacy_directory="$(echo "${arg}" | cut -d'=' -f2)"
				;;
			--ioquake3-directory=*|-ioq=*)
				ioquake3_directory="$(echo "${arg}" | cut -d'=' -f2)"
				;;
			--not-interactive|-ni)
				is_interactive="true"
				;;
			--help|-h)
				print_help
				exit 1
				;;
			*)
				echo "bad arg: ${arg}"
				exit 0
				;;
		esac
	done

	if [ "x${mod_list}" = "x" ]
	then
		if [ "x${will_purge}" = "xtrue" ]
		then
			install_nothing="true"
		else
			mod_list="default"
		fi
	fi

	if [ "x${install_nothing}" = "xtrue" ]
	then
		mod_list="nothing"
	fi

	mod_list="$(echo "${mod_list}" | tr ' ' '\n' | sort | uniq | tr '\n' ' ')"
}

print_configuration () {
	echo "Configuration:"
	echo "- download directory: ${download_directory}"
	echo "- etlegacy directory: ${etlegacy_directory}"
	echo "- ioquake3 directory: ${ioquake3_directory}"

	if [ "x${install_nothing}" = "xtrue" ]
	then
		echo "Will install ${mod_list}"
	else
		echo "Will install:"
		for mod_name in ${mod_list}
		do
			case "${mod_name}" in
				cqbtest)
					echo "- ${cqb_name} ${cqb_version} for ${wolfet_name}"
					echo "  ${mod_name} in ${etlegacy_directory}/${mod_name}"
					;;
				tcetest)
					echo "- ${tce_name} ${tce_version} for ${wolfet_name}"
					echo "  ${mod_name} in ${etlegacy_directory}/${mod_name}"
					;;
				truecombat)
					echo "- ${tc_name} ${tc_version} for ${quake3_name}"
					echo "  ${mod_name} in ${etlegacy_directory}/${mod_name}"
					;;
			esac
		done
	fi

	if [ "x${will_purge}" = "xtrue" ]
	then
		echo "Will purge downloaded files"
	fi
}

ask_continue () {
	if [ "x${is_interactive}" = "xtrue" ]
	then
		printf "Continue (Y/n)?"
		read answer
		if ! [ "x${answer}" = "x" -o "x${answer}" = "xY" -o  "x${answer}" = "xy" -o "x${answer}" = "xyes" ]
		then
			echo "Nothing was done"
			exit
		fi
	fi
}

## Main
#######

main () {
	constants
	parse_args ${@}
	configure
	print_configuration

	ask_continue

	if [ "x${install_nothing}" = "xfalse" ]
	then
		for mod_name in ${mod_list}
		do
			case "${mod_name}" in
				test)
					install_cqb
					;;
				tcetest)
					install_tce
					;;
				truecombat)
					install_tc
					;;
			esac
		done
	fi

	purge
}

main ${@}

#EOF
