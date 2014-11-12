#! /bin/sh

## Legal
########

# Author:  Thomas DEBESSE <dev@illwieckz.net>
# License: ISC


## Constants
############

constants () {
	wolfet_name="Wolfenstein: Enemy Territory"
	etlegacy_name="Enemy Territory: Legacy"
	quake3_name="Quake Ⅲ Arena"
	ioquake3_name="ioquake3"

	cqbtest_name="TrueCombat:Close Quarters Battle"
	cqbtest_mod_name="cqbtest"
	cqbtest_version="alpha 0.22 patch 3"
	cqbtest_date="2011-04-30"

	tcetest_name="TrueCombat:Elite"
	tcetest_mod_name="tcetest"
	tcetest_version="beta 0.4 build 9 patch b"
	tcetest_date="2007-01-01"

	truecombat_name="TrueCombat"
	truecombat_mod_name="truecombat"
	truecombat_version="beta 1.3"
	truecombat_date="2006-01-18"

	q3tc045_name="TrueCombat"
	q3tc045_mod_name="q3tc045"
	q3tc045_version="beta 0.45 build 12"
	q3tc045_date="3001-12-28"

	wolfet_user_directory=".etwolf"
	etlegacy_user_directory=".etlegacy"
	ioquake3_user_directory=".q3a"
	quake3_user_directory=".q3a"

	default_download_directory="/tmp/truecombat_files"

	cqbtest_full_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1285&Itemid=17"
	cqbtest_full_zip_filename="cqbtest_alpha022_win_linux.zip"
	cqbtest_full_zip_sum="361b3e0ef8e35a5cb6550a9a8df06f85604d21f898b7c504d24119880add7b46b436f884f550930491f2a6ed071eae8b88678f61dc06e4fdb4efdd8959799aef"
	cqbtest_full_zip_size="309240933"
	cqbtest_full_zip_hsize="295M"

	cqbtest_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1287&Itemid=17"
	cqbtest_patch_zip_filename="cqbtest_alpha0223_win_linux_patch.zip"
	cqbtest_patch_zip_sum="5fa0c927c34fbffe19a2f7b05cdd361305c7d8b1b00076281e19087716c26e938d4d1e27bea25ba9d74f075ca6ea1766269a4b71f6f7db4764b43d4619804c91"
	cqbtest_patch_zip_size="10680693"
	cqbtest_patch_zip_hsize="11M"

	tcetest_full_run_gz_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=3&Itemid=17"
	tcetest_full_run_gz_filename="TrueCombatElite_v049_Linux.run.gz"
	tcetest_full_run_gz_sum="95df41b591db28dc4da33375428d9394651f73a3fa7c93f7d6738c3aadb05d42bac1bb0de93ab05cc5954f4338f3026e97b71bca44ca94cafa5cc139a546a336"
	tcetest_full_run_gz_size="475370745"
	tcetest_full_run_gz_hsize="453Mb"

	tcetest_full_run_filename="TrueCombatElite_v049_Linux.run"
	tcetest_full_run_sum="e3a0c0d4c65bed324b3f2f89ca77a51a162610a59333e58c621f651e42c97e7a180d04fe7f708530d97379d83d7a67f660c668ea3d93f7536fa390d91e9b49f4"
	tcetest_full_run_size="475304070"

	tcetest_full_tar_gz_filename="TrueCombatElite_v049_Linux.tar.gz"
	tcetest_full_tar_gz_sum="54233ee01a56e20cc1eeefd90b58ec40bb117f78011b2ac3b63a2b7cdcc2753223f2c343657dfe83585b6355c1bd9e68463580751bc5645ea157989240b51c3d"
	tcetest_full_tar_gz_size="475295240"
	tcetest_full_tar_gz_offset="8831"

	tcetest_full_tar_bz2_filename="tcetest_0.49.tar.bz2"
	tcetest_full_tar_bz2_sum="ff5cf836b5cedda75434678feac4d35ee8bae3ad6330e07d447f3d5c77e9c6c26ae073cf340fc277645b6ed1fc61326c02ffdbbcd2a30bd630acb7b0b46364e2"
	tcetest_full_tar_bz2_size="471775660"

	tcetest_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=2&Itemid=17"
	tcetest_patch_zip_filename="tce049b_all_os_fixed.zip"
	tcetest_patch_zip_sum="8814f193437551c29edf88087229ee813317df10e264c3a0200942ef7c1e876aacff4d985d28bd59d1b3bd9589c86ad034d59a8f434cb443a31e07db9b0562da"
	tcetest_patch_zip_size="6795533"
	tcetest_patch_zip_hsize="6.5Mb"

	truecombat_full_11_zip_url="http://tce.merlin1991.at/tc/TrueCombat11Full.zip"
	truecombat_full_11_zip_filename="TrueCombat11Full.zip"
	truecombat_full_11_zip_sum="a4b36cd444d7de277ee6be5e3af038bb4aa583a2ce4b4a554c19ac46af628dbe045b77c3474e1a29736bb0624b62ff776c48202207b8d86daafad514971a5392"
	truecombat_full_11_zip_size="147175482"
	truecombat_full_11_zip_hsize="141M"

	truecombat_patch_12_zip_url="http://tce.merlin1991.at/tc/tc1.2_patch.zip"
	truecombat_patch_12_zip_filename="tc1.2_patch.zip"
	truecombat_patch_12_zip_sum="5f6f147e9fb24bd0fff5f516a7a492c63ad853eb3bd3a76d17ec4496f7e6a6e8463e07ce53031455f6dce73bc14af647e6673a7b19391e179723a6f253316fcc"
	truecombat_patch_12_zip_size="99781509"
	truecombat_patch_12_zip_hsize="96M"

	truecombat_patch_13_zip_url="http://tce.merlin1991.at/tc/tc1.3_patch.zip"
	truecombat_patch_13_zip_filename="tc1.3_patch.zip"
	truecombat_patch_13_zip_sum="a828de3f99d62b1b2e6cfe4542a4bf651ce360f4b130bffb1607c5bf67dad0fa506ba2ff5ffc5cf3ab896f1ae16b4eca74f886192ff81b2d4c4461ffea61aeb3"
	truecombat_patch_13_zip_size="58386008"
	truecombat_patch_13_zip_hsize="56M"

	q3tc045_full_zip_url="http://tce.merlin1991.at/tc/q3tc0.45b12beta.zip"
	q3tc045_full_zip_filename="q3tc0.45b12beta.zip"
	q3tc045_full_zip_sum="13be817b709e89d86540c2b307bc5f71e210370dd1a1e26736409b0d6d6665a65c3ce1d41f63cf3c37c35779de3b923db361df03c3ba13a17cfdec5af2524eb6"
	q3tc045_full_zip_size="93394211"
	q3tc045_full_zip_hsize="90M"
}

configure () {
	cqbtest_directory="${etlegacy_directory}/${cqbtest_mod_name}"
	tcetest_directory="${etlegacy_directory}/${tcetest_mod_name}"
	truecombat_directory="${ioquake3_directory}/${truecombat_mod_name}"
	q3tc045_directory="${ioquake3_directory}/${q3tc045_mod_name}"

	cqbtest_full_zip_filepath="${download_directory}/${cqbtest_full_zip_filename}"
	cqbtest_patch_zip_filepath="${download_directory}/${cqbtest_patch_zip_filename}"

	tcetest_full_run_gz_filepath="${download_directory}/${tcetest_full_run_gz_filename}"
	tcetest_full_run_filepath="${download_directory}/${tcetest_full_run_filename}"
	tcetest_full_tar_gz_filepath="${download_directory}/${tcetest_full_tar_gz_filename}"
	tcetest_full_tar_bz2_filepath="${download_directory}/${tcetest_full_tar_bz2_filename}"
	tcetest_patch_zip_filepath="${download_directory}/${tcetest_patch_zip_filename}"

	truecombat_full_11_zip_filepath="${download_directory}/${truecombat_full_11_zip_filename}"
	truecombat_patch_12_zip_filepath="${download_directory}/${truecombat_patch_12_zip_filename}"
	truecombat_patch_13_zip_filepath="${download_directory}/${truecombat_patch_13_zip_filename}"

	q3tc045_full_zip_filepath="${download_directory}/${q3tc045_full_zip_filename}"
}

downloadable_filepath_list () {
	cat <<-EOF
	${cqbtest_full_zip_filepath}
	${cqbtest_patch_zip_filepath}
	${tcetest_full_run_gz_filepath}
	${tcetest_full_run_filepath}
	${tcetest_full_tar_gz_filepath}
	${tcetest_full_tar_bz2_filepath}
	${tcetest_patch_zip_filepath}
	${truecombat_full_11_zip_filepath}
	${truecombat_patch_12_zip_filepath}
	${truecombat_patch_13_zip_filepath}
	EOF
}

cqbtest_full_filename_list () {
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

cqbtest_patch_filename_list () {
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

tcetest_full_filename_list () {
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

tcetest_patch_filename_list () {
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

truecombat_full_11_zip_filename_list () {
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

truecombat_patch_12_zip_filename_list () {
	cat <<-EOF
	help/truecombat_indochine*mapinfo.txt
	pak3.pk3
	server.cfg
	EOF
}

truecombat_patch_13_zip_filename_list () {
	cat <<-EOF
	maps.cfg
	question.ico
	tceula*1.3.rtf
	TrueCombat*1.3*Readme.txt
	pak5.pk3
	website.url
	EOF
}

q3tc045_full_zip_filename_list () {
	cat <<-EOF
	q3tc045/Build8.txt
	q3tc045/Build9.txt
	q3tc045/Build10.txt
	q3tc045/build11.txt
	q3tc045/Build12.txt
	q3tc045/description.txt
	q3tc045/games.log
	q3tc045/Icon_045.ico
	q3tc045/MODELS/q3t_players/BOSSMAN/BOSSMAN.TXT
	q3tc045/pak0.PK3
	q3tc045/pak1.pk3
	q3tc045/pak2.pk3
	q3tc045/pak3.pk3
	q3tc045/pak4.pk3
	q3tc045/pak5.pk3
	q3tc045/pak6.pk3
	q3tc045/q3config.cfg
	q3tc045/q3tc_server.cfg
	q3tc045/README.TXT
	q3tc045/TCDED.PL
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

## Close Quarters Battle Stuff
##############################

check_cqbtest_directory () {
	check_directory "${cqbtest_directory}" "${cqbtest_name}"
}

download_cqbtest_full_zip () {
	if download "${cqbtest_full_zip_url}" "${cqbtest_full_zip_filepath}" "${cqbtest_name} zip archive (${cqbtest_full_zip_hsize})"
	then
		verify "${cqbtest_full_zip_filepath}" "${cqbtest_full_zip_sum}" "${cqbtest_name} zip archive"
	fi
}

extract_cqbtest_full_files () {
	echo "Extracting ${cqbtest_name} archive files"
	if 7z x -y -o"${cqbtest_directory}/../" "${cqbtest_full_zip_filepath}" $(cqbtest_full_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_cqbtest_patch_zip () {
	if download "${cqbtest_patch_zip_url}" "${cqbtest_patch_zip_filepath}" "${cqbtest_name} zip archive (${cqbtest_patch_zip_hsize})"
	then
		verify "${cqbtest_patch_zip_filepath}" "${cqbtest_patch_zip_sum}" "${cqbtest_name} zip archive"
	fi
}

extract_cqbtest_patch_files () {
	echo "Extracting ${cqbtest_name} archive files"
	if 7z x -y -o"${cqbtest_directory}/../" "${cqbtest_patch_zip_filepath}" $(cqbtest_patch_filename_list) >/dev/null
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

check_tcetest_directory () {
	check_directory "${tcetest_directory}" "${tcetest_name}"
}

download_tcetest_full_run_gz () {
	if download "${tcetest_full_run_gz_url}" "${tcetest_full_run_gz_filepath}" "${tcetest_name} installer archive (${tcetest_full_run_gz_hsize})"
	then
		verify "${tcetest_full_run_gz_filepath}" "${tcetest_full_run_gz_sum}" "${tcetest_name} installer archive"
	fi
}

extract_tcetest_full_run () {
	echo "Extracting ${tcetest_name} installer: ${tcetest_full_run_filepath}"
	if [ -f "${tcetest_full_run_filepath}" ]
	then
		echo "Already there"
		true
	else
		if gzip -d < "${tcetest_full_run_gz_filepath}" > "${tcetest_full_run_filepath}"
		then
			echo "Done"
			verify "${tcetest_full_run_filepath}"  "${tcetest_full_run_sum}" "${tcetest_name} installer"
		else
			echo "Failure"
			false
		fi
	fi

}

dump_tcetest_full_tar_gz () {
	echo "Dump ${tcetest_name} setup archive: ${tcetest_full_tar_gz_filepath}"
	if [ -f "${tcetest_full_tar_gz_filepath}" ]
	then
		echo "Already there"
		true
	else
		if dd if="${tcetest_full_run_filepath}" of="${tcetest_full_tar_gz_filepath}" ibs="${tcetest_full_tar_gz_offset}" skip=1 obs=1024 status=none
		then
			echo "Done"
			verify "${tcetest_full_tar_gz_filepath}" "${tcetest_full_tar_gz_sum}" "${tcetest_name} setup archive"
		else
			echo "Failure"
			false
		fi
	fi
}

pick_tcetest_full_tar_bz2 () {
	echo "Picking ${tcetest_name} archive: ${tcetest_full_tar_bz2_filepath}"
	if [ -f "${tcetest_full_tar_bz2_filepath}" ]
	then
		echo "Already there"
		true
	else
		if tar -xzf "${tcetest_full_tar_gz_filepath}" "./${tcetest_full_tar_bz2_filename}" -O > "${tcetest_full_tar_bz2_filepath}"
		then
			echo "Done"
			verify "${tcetest_full_tar_bz2_filepath}" "${tcetest_full_tar_bz2_sum}" "${tcetest_name} archive"
		else
			echo "Failure"
			false
		fi
	fi
}

extract_tcetest_full_files () {
	echo "Extracting ${tcetest_name} directory: ${tcetest_directory}"
	if tar -C "${tcetest_directory}/." --strip-components=1 -xjf "${tcetest_full_tar_bz2_filepath}" $(tcetest_full_filename_list)
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_tcetest_patch_zip () {
	if download "${tcetest_patch_zip_url}" "${tcetest_patch_zip_filepath}" "${tcetest_name} patch file (${tcetest_patch_zip_hsize})"
	then
		verify "${tcetest_patch_zip_filepath}" "${tcetest_patch_zip_sum}" "${tcetest_name} patch file"
	fi
}

extract_tcetest_patch_files () {
	echo "Extracting ${tcetest_name} patch files"
	if 7z x -y -o"${tcetest_directory}/./" "${tcetest_patch_zip_filepath}" $(tcetest_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}


## TrueCombat 1.3 Stuff
#######################

check_truecombat_directory () {
	check_directory "${truecombat_directory}" "${truecombat_name}"
}

download_truecombat_full_11_zip () {
	if download "${truecombat_full_11_zip_url}" "${truecombat_full_11_zip_filepath}" "${truecombat_name} patch file (${truecombat_full_11_zip_hsize})"
	then
		verify "${truecombat_full_11_zip_filepath}" "${truecombat_full_11_zip_sum}" "${truecombat_name} patch file"
	fi
}

extract_truecombat_full_11_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"${truecombat_directory}/../" "${truecombat_full_11_zip_filepath}" $(truecombat_full_11_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_truecombat_patch_12_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"${truecombat_directory}/./" "${truecombat_patch_12_zip_filepath}" $(truecombat_patch_12_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_truecombat_patch_13_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"${truecombat_directory}/./" "${truecombat_patch_13_zip_filepath}" $(truecombat_patch_13_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_truecombat_patch_12_zip () {
	if download "${truecombat_patch_12_zip_url}" "${truecombat_patch_12_zip_filepath}" "${truecombat_name} patch file (${truecombat_patch_12_zip_hsize})"
	then
		verify "${truecombat_patch_12_zip_filepath}" "${truecombat_patch_12_zip_sum}" "${truecombat_name} patch file"
	fi
}

download_truecombat_patch_13_zip () {
	if download "${truecombat_patch_13_zip_url}" "${truecombat_patch_13_zip_filepath}" "${truecombat_name} patch file (${truecombat_patch_13_zip_hsize})"
	then
		verify "${truecombat_patch_13_zip_filepath}" "${truecombat_patch_13_zip_sum}" "${truecombat_name} patch file"
	fi
}

## TrueCombat 0.45 Stuff
########################

check_q3tc045_directory () {
	check_directory "${q3tc045_directory}" "${q3tc045_name}"
}

download_q3tc045_full_zip () {
	if download "${q3tc045_full_zip_url}" "${q3tc045_full_zip_filepath}" "${q3tc045_name} patch file (${q3tc045_full_zip_hsize})"
	then
		verify "${q3tc045_full_zip_filepath}" "${q3tc045_full_zip_sum}" "${q3tc045_name} patch file"
	fi
}

extract_q3tc045_full_files () {
	echo "Extracting ${q3tc045_name} zip files"
	if 7z x -y -o"${q3tc045_directory}/../" "${q3tc045_full_zip_filepath}" $(q3tc045_full_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
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

install_cqbtest () {
	check_download_directory \
	&& check_etlegacy_directory \
	&& check_cqbtest_directory \
	&& download_cqbtest_full_zip \
	&& download_cqbtest_patch_zip \
	&& extract_cqbtest_full_files \
	&& extract_cqbtest_patch_files
}

install_tcetest () {
	check_download_directory \
	&& check_etlegacy_directory \
	&& check_tcetest_directory \
	&& download_tcetest_full_run_gz \
	&& download_tcetest_patch_zip \
	&& extract_tcetest_full_run \
	&& dump_tcetest_full_tar_gz \
	&& pick_tcetest_full_tar_bz2 \
	&& extract_tcetest_full_files \
	&& extract_tcetest_patch_files
}

install_truecombat () {
	check_download_directory \
	&& check_ioquake3_directory \
	&& check_truecombat_directory \
	&& download_truecombat_full_11_zip \
	&& download_truecombat_patch_12_zip \
	&& download_truecombat_patch_13_zip \
	&& extract_truecombat_full_11_files \
	&& extract_truecombat_patch_12_files \
	&& extract_truecombat_patch_13_files
}

install_q3tc045 () {
	check_download_directory \
	&& check_ioquake3_directory \
	&& check_q3tc045_directory \
	&& download_q3tc045_full_zip \
	&& extract_q3tc045_full_files
}

## Arguments
############

print_help () {
	tab="$(printf '\t')"
	cat <<-EOF
	Usage: ${0} [OPTION]... [MOD NAME]...
	
	${0} is a tool to install TrueCombat mods for
	${wolfet_name} and ${quake3_name} games.
	
	Without MOD NAME:
	- installs ${cqbtest_name} ${cqbtest_version} for
	  ${wolfet_name} in “\${HOME}/${etlegacy_user_directory}/${cqbtest_mod_name}”.

	Without OPTION:
	- installs mods in ${etlegacy_name} and ${ioquake3_name} user directories.
	- downloads temporary files to “${default_download_directory}” directory.
	- does not purge downloaded temporary files.
	- asks user before doing anything.

	OPTIONS
	${tab}-dl=PATH,  --download-directory=PATH    download files in PATH directory

	${tab}-etl=PATH, --etlegacy-directory=PATH    install ${wolfet_name} mods
	${tab}                                        in PATH directory
	${tab}-ioq=PATH, --ioquake3-directory=PATH    install ${quake3_name} mods
	${tab}                                        in PATH directory

	${tab}-ni, --not-interactive    do not ask before doing something
	${tab}-f,  --force-redownload   force to download again already downloaded files
	${tab}-p,  --purge-after        purge downloaded temporary files after installation
	${tab}-h,  --help               print this help

	MOD NAMES
	${tab}cqb, cqbtest   ${cqbtest_name} ${cqbtest_version}
	${tab}               for ${wolfet_name}
	${tab}tce, tcetest   ${tcetest_name} ${tcetest_version}
	${tab}               for ${wolfet_name}
	${tab}truecombat     ${truecombat_name} ${truecombat_version}
	${tab}               for ${quake3_name}
	${tab}q3tc045        ${q3tc045_name} ${q3tc045_version}
	${tab}               for ${quake3_name}

	${tab}default        an alias for “cqbtest”
	${tab}all            an alias for “cqbtest tcetest truecombat q3tc045”

	${tab}nothing        nothing

	EXAMPLES
	To install ${cqbtest_name} ${cqb_version}:
	$ ${0}

	To install both ${cqbtest_name} ${cqbtest_version}
	and ${tcetest_name} ${tcetest_version}:
	$ ${0} cqbtest tcetest

	To purge already downloaded files without installing anything more:
	$ ${0} --purge-after nothing

	To install ${truecombat_name} ${truecombat_version} mod using a random temporary directory, automatically
	deleting temporary files, in non interactive mode:
	$ ${0} -p -ni -dl="\$(mktemp -d)" ${truecombat_mod_name}

	To install ${tcetest_name} ${tcetest_version} mod inside
	${wolfet_name} user directory (not recommended at all):
	$ ${0} -etl="\${HOME}/${wolfet_user_directory}"

	To install all mods inside system directories:
	# ${0} -ioq="/usr/share/games/quake3" \\
	    -etl="/usr/share/games/etlegacy" all
	EOF
}

parse_args () {
	etlegacy_directory="${HOME}/${etlegacy_user_directory}"
	ioquake3_directory="${HOME}/${ioquake3_user_directory}"
	download_directory="${default_download_directory}"
	will_purge="false"
	force_redownload="false"
	install_nothing="false"
	is_interactive="true"
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
			truecombat)
				mod_list="${mod_list} truecombat"
				;;
			q3tc045)
				mod_list="${mod_list} q3tc045"
				;;
			all)
				mod_list="cqbtest tcetest truecombat q3tc045"
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
		mod_list="cqbtest"
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
					echo "- ${cqbtest_name} ${cqbtest_version} for ${wolfet_name}"
					echo "  ${mod_name} in ${cqbtest_directory}"
					;;
				tcetest)
					echo "- ${tcetest_name} ${tcetest_version} for ${wolfet_name}"
					echo "  ${mod_name} in ${tcetest_directory}"
					;;
				truecombat)
					echo "- ${truecombat_name} ${truecombat_version} for ${quake3_name}"
					echo "  ${mod_name} in ${truecombat_directory}"
					;;
				q3tc045)
					echo "- ${q3tc045_name} ${q3tc045_version} for ${quake3_name}"
					echo "  ${mod_name} in ${q3tc045_directory}"
					;;
			esac
		done
	fi

	if [ "x${will_purge}" = "xfalse" ]
	then
		echo "Will not purge temporary downloaded files"
	else
		echo "Will purge temporary downloaded files"
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
				cqbtest)
					install_cqbtest
					;;
				tcetest)
					install_tcetest
					;;
				truecombat)
					install_truecombat
					;;
				q3tc045)
					install_q3tc045
					;;
			esac
		done
	fi

	purge
}

main ${@}

#EOF
