#! /bin/sh

## Args
#######

mod_name="${1}"

## Vars
#######

download_dir="/tmp/truecombat_files"

etlegacy_name="Enemy Territory: Legacy"
etlegacy_install_dir="${HOME}/.etlegacy"

ioquake3_name="ioquake3"
ioquake3_install_dir="${HOME}/.q3a"

cqb_name="TrueCombat:Close Quarter Battle"
cqb_mod_name="cqbtest"
cqb_install_dir="${etlegacy_install_dir}/${cqb_mod_name}"
cqb_version="alpha 0.223"

tce_name="TrueCombat:Elite"
tce_mod_name="tcetest"
tce_install_dir="${etlegacy_install_dir}/${tce_mod_name}"
tce_version="beta 0.4 build 9"

tc_name="TrueCombat"
tc_mod_name="truecombat"
tc_install_dir="${ioquake3_install_dir}/${tc_mod_name}"
tc_version="1.3"

cqb_full_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1285&Itemid=17"
cqb_full_zip_filename="cqb_alpha022_win_linux.zip"
cqb_full_zip_filepath="${download_dir}/${cqb_full_zip_filename}"
cqb_full_zip_sum="361b3e0ef8e35a5cb6550a9a8df06f85604d21f898b7c504d24119880add7b46b436f884f550930491f2a6ed071eae8b88678f61dc06e4fdb4efdd8959799aef"
cqb_full_zip_size="309240933"
cqb_full_zip_hsize="295M"

cqb_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1287&Itemid=17"
cqb_patch_zip_filename="cqb_alpha0223_win_linux_patch.zip"
cqb_patch_zip_filepath="${download_dir}/${cqb_patch_zip_filename}"
cqb_patch_zip_sum="5fa0c927c34fbffe19a2f7b05cdd361305c7d8b1b00076281e19087716c26e938d4d1e27bea25ba9d74f075ca6ea1766269a4b71f6f7db4764b43d4619804c91"
cqb_patch_zip_size="10680693"
cqb_patch_zip_hsize="11M"

tce_full_run_gz_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=3&Itemid=17"
tce_full_run_gz_filename="TrueCombatElite_v049_Linux.run.gz"
tce_full_run_gz_filepath="${download_dir}/${tce_full_run_gz_filename}"
tce_full_run_gz_sum="95df41b591db28dc4da33375428d9394651f73a3fa7c93f7d6738c3aadb05d42bac1bb0de93ab05cc5954f4338f3026e97b71bca44ca94cafa5cc139a546a336"
tce_full_run_gz_size="475370745"
tce_full_run_gz_hsize="453Mb"

tce_full_run_filename="TrueCombatElite_v049_Linux.run"
tce_full_run_filepath="${download_dir}/${tce_full_run_filename}"
tce_full_run_sum="e3a0c0d4c65bed324b3f2f89ca77a51a162610a59333e58c621f651e42c97e7a180d04fe7f708530d97379d83d7a67f660c668ea3d93f7536fa390d91e9b49f4"
tce_full_run_size="475304070"

tce_full_tar_gz_filename="TrueCombatElite_v049_Linux.tar.gz"
tce_full_tar_gz_filepath="${download_dir}/${tce_full_tar_gz_filename}"
tce_full_tar_gz_sum="54233ee01a56e20cc1eeefd90b58ec40bb117f78011b2ac3b63a2b7cdcc2753223f2c343657dfe83585b6355c1bd9e68463580751bc5645ea157989240b51c3d"
tce_full_tar_gz_size="475295240"
tce_full_tar_gz_offset="8831"

tce_full_tar_bz2_filename="tce_0.49.tar.bz2"
tce_full_tar_bz2_filepath="${download_dir}/${tce_full_tar_bz2_filename}"
tce_full_tar_bz2_sum="ff5cf836b5cedda75434678feac4d35ee8bae3ad6330e07d447f3d5c77e9c6c26ae073cf340fc277645b6ed1fc61326c02ffdbbcd2a30bd630acb7b0b46364e2"
tce_full_tar_bz2_size="471775660"

tce_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=2&Itemid=17"
tce_patch_zip_filename="tce049b_all_os_fixed.zip"
tce_patch_zip_filepath="${download_dir}/${tce_patch_zip_filename}"
tce_patch_zip_sum="8814f193437551c29edf88087229ee813317df10e264c3a0200942ef7c1e876aacff4d985d28bd59d1b3bd9589c86ad034d59a8f434cb443a31e07db9b0562da"
tce_patch_zip_size="6795533"
tce_patch_zip_hsize="6.5Mb"

tc_full_11_zip_url="http://tce.merlin1991.at/tc/TrueCombat11Full.zip"
tc_full_11_zip_filename="TrueCombat11Full.zip"
tc_full_11_zip_filepath="${download_dir}/${tc_full_11_zip_filename}"
tc_full_11_zip_sum="a4b36cd444d7de277ee6be5e3af038bb4aa583a2ce4b4a554c19ac46af628dbe045b77c3474e1a29736bb0624b62ff776c48202207b8d86daafad514971a5392"
tc_full_11_zip_size="147175482"
tc_full_11_zip_hsize="141M"

tc_patch_12_zip_url="http://tce.merlin1991.at/tc/tc1.2_patch.zip"
tc_patch_12_zip_filename="tc1.2_patch.zip"
tc_patch_12_zip_filepath="${download_dir}/${tc_patch_12_zip_filename}"
tc_patch_12_zip_sum="5f6f147e9fb24bd0fff5f516a7a492c63ad853eb3bd3a76d17ec4496f7e6a6e8463e07ce53031455f6dce73bc14af647e6673a7b19391e179723a6f253316fcc"
tc_patch_12_zip_size="99781509"
tc_patch_12_zip_hsize="96M"

tc_patch_13_zip_url="http://tce.merlin1991.at/tc/tc1.3_patch.zip"
tc_patch_13_zip_filename="tc1.3_patch.zip"
tc_patch_13_zip_filepath="${download_dir}/${tc_patch_13_zip_filename}"
tc_patch_13_zip_sum="a828de3f99d62b1b2e6cfe4542a4bf651ce360f4b130bffb1607c5bf67dad0fa506ba2ff5ffc5cf3ab896f1ae16b4eca74f886192ff81b2d4c4461ffea61aeb3"
tc_patch_13_zip_size="58386008"
tc_patch_13_zip_hsize="56M"

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

create_dir () {
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

check_dir () {
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
		create_dir "${1}" "${2}"
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
		echo "Already there"
		true
	else
		if wget --quiet "${1}" -O "${2}"
		then
			echo "Done"
			true
		else
			echo "Failure"
			false
		fi
	fi
}

check_download_dir () {
	check_dir "${download_dir}" "download"
}

## Engine stuff
###############

check_etlegacy_dir () {
	check_dir "${etlegacy_install_dir}" "${etlegacy_name}"
}

check_ioquake3_dir () {
	check_dir "${ioquake3_install_dir}" "${ioquake3_name}"
}

## CQB Stuff
############

check_cqb_dir () {
	check_dir "${cqb_install_dir}" "${cqb_name}"
}

download_cqb_full_zip () {
	if download "${cqb_full_zip_url}" "${cqb_full_zip_filepath}" "${cqb_name} zip archive (${cqb_full_zip_hsize})"
	then
		verify "${cqb_full_zip_filepath}" "${cqb_full_zip_sum}" "${cqb_name} zip archive (${cqb_full_zip_hsize})"
	fi
}

extract_cqb_full_files () {
	echo "Extracting ${cqb_name} archive files"
	if 7z x -y -o"${cqb_install_dir}/../" "${cqb_full_zip_filepath}" $(cqb_full_filename_list) >/dev/null
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
		verify "${cqb_patch_zip_filepath}" "${cqb_patch_zip_sum}" "${cqb_name} zip archive (${cqb_patch_zip_hsize})"
	fi
}

extract_cqb_patch_files () {
	echo "Extracting ${cqb_name} archive files"
	if 7z x -y -o"${cqb_install_dir}/../" "${cqb_patch_zip_filepath}" $(cqb_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

## TCE Stuff
############

check_tce_dir () {
	check_dir "${tce_install_dir}" "${tce_name}"
}

download_tce_full_run_gz () {
	if download "${tce_full_run_gz_url}" "${tce_full_run_gz_filepath}" "${tce_name} installer archive (${tce_full_run_gz_hsize})"
	then
		verify "${tce_full_run_gz_filepath}" "${tce_full_run_gz_sum}" "${tce_name} installer archive (${tce_full_run_gz_hsize})"
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

extract_tce_full_dir () {
	echo "Extracting ${tce_name} directory: ${tce_install_dir}"
	if tar -C "${tce_install_dir}/." --strip-components=1 -xjf "${tce_full_tar_bz2_filepath}" $(tce_full_filename_list)
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
		verify "${tce_patch_zip_filepath}" "${tce_patch_zip_sum}" "${tce_name} patch file (${tce_patch_zip_hsize})"
	fi
}

extract_tce_patch_files () {
	echo "Extracting ${tce_name} patch files"
	if 7z x -y -o"${tce_install_dir}/./" "${tce_patch_zip_filepath}" $(tce_patch_filename_list) >/dev/null
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

check_tc_dir () {
	check_dir "${tc_install_dir}" "${tc_name}"
}

download_tc_full_11_zip () {
	if download "${tc_full_11_zip_url}" "${tc_full_11_zip_filepath}" "${tc_name} patch file (${tc_full_11_zip_hsize})"
	then
		verify "${tc_full_11_zip_filepath}" "${tc_full_11_zip_sum}" "${tc_name} patch file (${tc_full_11_zip_hsize})"
	fi
}

extract_tc_full_11_files () {
	echo "Extracting ${tc_name} zip files: ${tc_full_11_zip_filename_list}"
	if 7z x -y -o"${tc_install_dir}/../" "${tc_full_11_zip_filepath}" $(tc_full_11_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_tc_patch_12_files () {
	echo "Extracting ${tc_name} zip files: ${tc_patch_12_zip_filename_list}"
	if 7z x -y -o"${tc_install_dir}/../" "${tc_patch_12_zip_filepath}" $(tc_patch_12_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_tc_patch_13_files () {
	echo "Extracting ${tc_name} zip files: ${tc_patch_13_zip_filename_list}"
	if 7z x -y -o"${tc_install_dir}/../" "${tc_patch_13_zip_filepath}" $(tc_patch_13_zip_filename_list) >/dev/null
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
		verify "${tc_patch_12_zip_filepath}" "${tc_patch_12_zip_sum}" "${tc_name} patch file (${tc_patch_12_zip_hsize})"
	fi
}

download_tc_patch_13_zip () {
	if download "${tc_patch_13_zip_url}" "${tc_patch_13_zip_filepath}" "${tc_name} patch file (${tc_patch_13_zip_hsize})"
	then
		verify "${tc_patch_13_zip_filepath}" "${tc_patch_13_zip_sum}" "${tc_name} patch file (${tc_patch_13_zip_hsize})"
	fi
}

## Installation
###############

install_cqb () {
	check_download_dir \
	&& check_etlegacy_dir \
	&& check_cqb_dir \
	&& download_cqb_full_zip \
	&& download_cqb_patch_zip \
	&& extract_cqb_full_files \
	&& extract_cqb_patch_files
}

install_tce () {
	check_download_dir \
	&& check_etlegacy_dir \
	&& check_tce_dir \
	&& download_tce_full_run_gz \
	&& download_tce_patch_zip \
	&& extract_tce_full_run \
	&& dump_tce_full_tar_gz \
	&& pick_tce_full_tar_bz2 \
	&& extract_tce_full_dir \
	&& extract_tce_patch_files
}

install_tc () {
	check_download_dir \
	&& check_ioquake3_dir \
	&& check_tc_dir \
	&& download_tc_full_11_zip \
	&& download_tc_patch_12_zip \
	&& download_tc_patch_13_zip \
	&& extract_tc_full_11_files \
	&& extract_tc_patch_12_files \
	&& extract_tc_patch_12_files
}

main () {
	case "${mod_name}" in
		"cqb")
			echo "Will install ${cqb_name} ${cqb_version}."
			install_cqb
			;;
		"tce")
			echo "Will install ${tce_name} ${tce_version}."
			install_tce
			;;
		"tc")
			echo "Will install ${tc_name} ${tc_version}."
			install_tc
			;;
		"all")
			echo "Will install ${cqb_name} ${cqb_version}, ${tce_name} ${tce_version} and ${tc_name} ${tc_version}."
			install_cqb
			install_tce
			install_tc
			;;
		""|"default")
			echo "Will install ${cqb_name} ${cqb_version} by default."
			install_cqb
			;;
		*)
			echo "Bad argument"
			false
			;;
	esac

}

main

#EOF
