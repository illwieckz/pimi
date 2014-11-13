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
	quake3arena_name="Quake Ⅲ Arena"
	openarena_name="OpenArena"

	etlegacy_engine_name="ET:Legacy"
	ioquake3_engine_name="ioquake3"

	etmain_name="Wolfenstein: Enemy Territory"
	etmain_mod_name="etmain"
	etmain_version="2.60 patch b"
	etmain_date="2006-05-08"

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
	quake3arena_user_directory=".q3a"
	openarena_user_directory=".openarena"

	default_temporary_directory="/tmp/pimi_files"

	etmain_full_zip_url="http://filebase.trackbase.net/et/full/et260b.x86_full.zip"
	etmain_full_zip_filename="et260b.x86_full.zip"
	etmain_full_zip_sum="7a9639c7a67c6c058ae1c85ca1e04e74526194a8a676eaccffa1984869251cc058f0cb79b96604ec087492003d14f7f3e96c8ebe7e527959ae47d4d25645d3e1"
	etmain_full_zip_size="275647724"
	etmain_full_zip_hsize="263Mb"

	etmain_full_run_filename="et260b.x86_keygen_V03.run"
	etmain_full_run_sum="e60c48ac64669c7b2f12683d65d041a676375f60f4091819b8db01105157fc31fdb0249072a2744dcce8aad7c239cc68180d86a71b8864be65fd451e9cda270b"
	etmain_full_run_size="275644494"

	etmain_full_tar_gz_filename="et260b.x86_keygen_V03.tar.gz"
	etmain_full_tar_gz_sum="7342079ae1c0a94a06011e487fb3f22d95dca5709e47e399ae671e7e79d16989cc1267b643ed49a5a487e8970284dd5bdf57787680bcca4c4aa076d2aa4fe459"
	etmain_full_tar_gz_size="275635039"
	etmain_full_tar_gz_offset="9455"

	cqbtest_full_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1285&Itemid=17"
	cqbtest_full_zip_filename="cqb_alpha022_win_linux.zip"
	cqbtest_full_zip_sum="361b3e0ef8e35a5cb6550a9a8df06f85604d21f898b7c504d24119880add7b46b436f884f550930491f2a6ed071eae8b88678f61dc06e4fdb4efdd8959799aef"
	cqbtest_full_zip_size="309240933"
	cqbtest_full_zip_hsize="295Mb"

	cqbtest_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=1287&Itemid=17"
	cqbtest_patch_zip_filename="cqb_alpha0223_win_linux_patch.zip"
	cqbtest_patch_zip_sum="5fa0c927c34fbffe19a2f7b05cdd361305c7d8b1b00076281e19087716c26e938d4d1e27bea25ba9d74f075ca6ea1766269a4b71f6f7db4764b43d4619804c91"
	cqbtest_patch_zip_size="10680693"
	cqbtest_patch_zip_hsize="11Mb"

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

	tcetest_full_tar_bz2_filename="tce_0.49.tar.bz2"
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
	truecombat_full_11_zip_hsize="141Mb"

	truecombat_patch_12_zip_url="http://tce.merlin1991.at/tc/tc1.2_patch.zip"
	truecombat_patch_12_zip_filename="tc1.2_patch.zip"
	truecombat_patch_12_zip_sum="5f6f147e9fb24bd0fff5f516a7a492c63ad853eb3bd3a76d17ec4496f7e6a6e8463e07ce53031455f6dce73bc14af647e6673a7b19391e179723a6f253316fcc"
	truecombat_patch_12_zip_size="99781509"
	truecombat_patch_12_zip_hsize="96Mb"

	truecombat_patch_13_zip_url="http://tce.merlin1991.at/tc/tc1.3_patch.zip"
	truecombat_patch_13_zip_filename="tc1.3_patch.zip"
	truecombat_patch_13_zip_sum="a828de3f99d62b1b2e6cfe4542a4bf651ce360f4b130bffb1607c5bf67dad0fa506ba2ff5ffc5cf3ab896f1ae16b4eca74f886192ff81b2d4c4461ffea61aeb3"
	truecombat_patch_13_zip_size="58386008"
	truecombat_patch_13_zip_hsize="56Mb"

	q3tc045_full_zip_url="http://tce.merlin1991.at/tc/q3tc0.45b12beta.zip"
	q3tc045_full_zip_filename="q3tc0.45b12beta.zip"
	q3tc045_full_zip_sum="13be817b709e89d86540c2b307bc5f71e210370dd1a1e26736409b0d6d6665a65c3ce1d41f63cf3c37c35779de3b923db361df03c3ba13a17cfdec5af2524eb6"
	q3tc045_full_zip_size="93394211"
	q3tc045_full_zip_hsize="90Mb"
}

get_etmain_description () {
	echo "${etmain_name} ${etmain_version}"
}

get_cqbtest_description () {
	echo "${cqbtest_name} ${cqbtest_version}"
}

get_tcetest_description () {
	echo "${tcetest_name} ${tcetest_version}"
}

get_truecombat_description () {
	echo "${truecombat_name} ${truecombat_version}"
}

get_q3tc045_description () {
	echo "${q3tc045_name} ${q3tc045_version}"
}

get_etmain_full_description () {
	echo "$(get_etmain_description) for ${etlegacy_engine_name}"
}

get_cqbtest_full_description () {
	echo "$(get_cqbtest_description) for ${etlegacy_engine_name}"
}

get_tcetest_full_description () {
	echo "$(get_tcetest_description) for ${etlegacy_engine_name}"
}

get_truecombat_full_description () {
	echo "$(get_truecombat_description) for ${ioquake3_engine_name}"
}

get_q3tc045_full_description () {
	echo "$(get_q3tc045_description) for ${ioquake3_engine_name}"
}

get_etmain_directory () {
	echo "${etlegacy_directory}/${etmain_mod_name}"
}

get_cqbtest_directory () {
	echo "${etlegacy_directory}/${cqbtest_mod_name}"
}

get_tcetest_directory () {
	echo "${etlegacy_directory}/${tcetest_mod_name}"
}

get_truecombat_directory() {
	echo "${ioquake3_engine_directory}/${truecombat_mod_name}"
}

get_q3tc045_directory () {
	echo "${ioquake3_engine_directory}/${q3tc045_mod_name}"
}

get_etmain_downloadable_filename_list () {
	cat <<-EOF
	${etmain_full_zip_filename}
	${etmain_full_run_filename}
	EOF
}

get_etmain_temporary_filename_list () {
	get_etmain_downloadable_filename_list
}

get_cqbtest_downloadable_filename_list () {
	cat <<-EOF
	${cqbtest_full_zip_filename}
	${cqbtest_patch_zip_filename}
	EOF
}

get_cqbtest_temporary_filename_list () {
	get_cqbtest_downloadable_filename_list
}

get_tcetest_downloadable_filename_list () {
	cat <<-EOF
	${tcetest_full_run_gz_filename}
	${tcetest_patch_zip_filename}
	EOF
}

get_tcetest_temporary_filename_list () {
	get_tcetest_downloadable_filename_list
	cat <<-EOF
	${tcetest_full_run_filename}
	${tcetest_full_tar_gz_filename}
	${tcetest_full_tar_bz2_filename}
	EOF
}

get_truecombat_downloadable_filename_list () {
	cat <<-EOF
	${truecombat_full_11_zip_filename}
	${truecombat_patch_12_zip_filename}
	${truecombat_patch_13_zip_filename}
	EOF
}

get_truecombat_temporary_filename_list () {
	get_truecombat_downloadable_filename_list
}

get_q3tc045_downloadable_filename_list () {
	cat <<-EOF
	${q3tc045_full_zip_filename}
	EOF
}

get_q3tc045_temporary_filename_list () {
	get_q3tc045_downloadable_filename_list
}

get_temporary_filename_list () {
	get_cqbtest_temporary_filename_list
	get_tcetest_temporary_filename_list
	get_truecombat_temporary_filename_list
	get_q3tc045_temporary_filename_list
}

get_etmain_full_filename_list () {
	cat <<-EOF
	./etmain/pak0.pk3
	./etmain/pak1.pk3
	./etmain/pak2.pk3
	./etmain/video/etintro.roq
	EOF

	<<-NOT_NECESSARY
	./etmain/campaigncycle.cfg
	./etmain/cgame.mp.i386.so
	./etmain/description.txt
	./etmain/hunkusage.dat
	./etmain/lmscycle.cfg
	./etmain/mp_bin.pk3
	./etmain/objectivecycle.cfg
	./etmain/qagame.mp.i386.so
	./etmain/server.cfg
	./etmain/stopwatchcycle.cfg
	./etmain/ui.mp.i386.so
	NOT_NECESSARY
}

get_etmain_full_docs_filename_list () {
	cat <<-EOF
	./Docs/EULA_Wolfenstein_Enemy_Territory.txt
	./Docs/License.rtf
	./ET.xpm
	EOF

	<<-NOT_NECESSARY
	./Docs/MSR.rtf
	./Docs/Help/
	NOT_NECESSARY
}

get_cqbtest_full_filename_list () {
	cat <<-EOF
	cqbtest/EULA_TrueCombat_CQB.txt
	cqbtest/pak0.pk3
	cqbtest/pak1.pk3
	cqbtest/pak2.pk3
	cqbtest/pak3.pk3
	cqbtest/pak4.pk3
	cqbtest/readme.txt
	EOF

	<<-NOT_NECESSARY
	cqbtest/autoexec.cfg
	NOT_NECESSARY
}

get_cqbtest_patch_filename_list () {
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

get_tcetest_full_filename_list () {
	cat <<-EOF
	tcetest/cgame.mp.i386.so
	tcetest/changelog.rtf
	tcetest/official.dat
	tcetest/pak0.pk3
	tcetest/pak1.pk3
	tcetest/pak2.pk3
	tcetest/pak3.pk3
	tcetest/ReadMe.rtf
	EOF

	<<-NOT_NECESSARY
	tcetest/autoexec.cfg
	NOT_NECESSARY
}

get_tcetest_patch_filename_list () {
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

get_truecombat_full_11_zip_filename_list () {
	cat <<-EOF
	truecombat/1life.cfg
	truecombat/1lifecycle.cfg
	truecombat/3life.cfg
	truecombat/3lifecycle.cfg
	truecombat/ctf.cfg
	truecombat/ctfcycle.cfg
	truecombat/inflife.cfg
	truecombat/inflifecycle.cfg
	truecombat/description.txt
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

	<<-NOT_NECESSARY
	truecombat/5th*Readmes/5th.zip
	NOT_NECESSARY
}

get_truecombat_patch_12_zip_filename_list () {
	cat <<-EOF
	pak3.pk3
	EOF

	<<-NOT_NECESSARY
	truecombat/1.0a?readme.txt
	truecombat/1.1?readme.txt
	help/truecombat_indochine*mapinfo.txt
	server.cfg
	NOT_NECESSARY
}

get_truecombat_patch_13_zip_filename_list () {
	cat <<-EOF
	maps.cfg
	question.ico
	tceula*1.3.rtf
	TrueCombat*1.3*Readme.txt
	pak5.pk3
	EOF

	<<-NOT_NECESSARY
	website.url
	NOT_NECESSARY
}

get_q3tc045_full_zip_filename_list () {
	cat <<-EOF
	q3tc045/Build12.txt
	q3tc045/description.txt
	q3tc045/Icon_045.ico
	q3tc045/pak0.PK3
	q3tc045/pak1.pk3
	q3tc045/pak2.pk3
	q3tc045/pak3.pk3
	q3tc045/pak4.pk3
	q3tc045/pak5.pk3
	q3tc045/pak6.pk3
	q3tc045/q3tc_server.cfg
	q3tc045/README.TXT
	q3tc045/TCDED.PL
	EOF

	<<-NOT_NECESSARY
	q3tc045/Build8.txt
	q3tc045/Build9.txt
	q3tc045/Build10.txt
	q3tc045/build11.txt
	q3tc045/MODELS/q3t_players/BOSSMAN/BOSSMAN.TXT
	NOT_NECESSARY
}


## Common stuff
###############

get_temporary_filepath () {
	# $1: filename
	echo "${temporary_directory}/${1}"
}

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

check_temporary_directory () {
	check_directory "${temporary_directory}" "download"
}

## Engine stuff
###############

check_etlegacy_directory () {
	check_directory "${etlegacy_directory}" "${etlegacy_name}"
}

check_ioquake3_engine_directory () {
	check_directory "${ioquake3_engine_directory}" "${quake3arena_name}"
}


## Wolfenstein: Enemy Territory stuff
#####################################

check_etmain_directory () {
	check_directory "$(get_etmain_directory)" "${etmain_name}"
}

download_etmain_full_zip () {
	if download "${etmain_full_zip_url}" "$(get_temporary_filepath "${etmain_full_zip_filename}")" "${etmain_name} installer archive (${etmain_full_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${etmain_full_zip_filename}")" "${etmain_full_zip_sum}" "${etmain_name} installer archive"
	fi
}

extract_etmain_full_run () {
	echo "Extracting $(get_temporary_filepath "${etmain_name} installer: ${etmain_full_run_filename}")"
	if [ -f "$(get_temporary_filepath "${etmain_full_run_filename}")" ]
	then
		echo "Already there"
		true
	else
		if 7z x -y -o"${temporary_directory}" "$(get_temporary_filepath "${etmain_full_zip_filename}")" "${etmain_full_run_filename}" >/dev/null
		then
			echo "Done"
			verify "$(get_temporary_filepath "${etmain_full_run_filename}")"  "${etmain_full_run_sum}" "${etmain_name} installer"
		else
			echo "Failure"
			false
		fi
	fi

}

dump_etmain_full_tar_gz () {
	echo "Dumping $(get_temporary_filepath "${etmain_name} setup archive: ${etmain_full_tar_gz_filename}")"
	if [ -f "$(get_temporary_filepath "${etmain_full_tar_gz_filename}")" ]
	then
		echo "Already there"
		true
	else
		if dd if="$(get_temporary_filepath "${etmain_full_run_filename}")" \
		      of="$(get_temporary_filepath "${etmain_full_tar_gz_filename}")" \
			  ibs="${etmain_full_tar_gz_offset}" skip=1 obs=1024 status=none
		then
			echo "Done"
			verify "$(get_temporary_filepath "${etmain_full_tar_gz_filename}")" "${etmain_full_tar_gz_sum}" "${etmain_name} setup archive"
		else
			echo "Failure"
			false
		fi
	fi
}

extract_etmain_full_files () {
	echo "Extracting ${etmain_name} files"
	if tar -C "$(get_etmain_directory)/." --strip-components=2 -xzf \
	   "$(get_temporary_filepath "${etmain_full_tar_gz_filename}")" $(get_etmain_full_filename_list)
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

extract_etmain_full_docs () {
	echo "Extracting ${etmain_name} docs"
	if tar -C "$(get_etmain_directory)/." --strip-components=1 -xzf \
	   "$(get_temporary_filepath "${etmain_full_tar_gz_filename}")" $(get_etmain_full_docs_filename_list)
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}


## Close Quarters Battle stuff
##############################

check_cqbtest_directory () {
	check_directory "$(get_cqbtest_directory)" "${cqbtest_name}"
}

download_cqbtest_full_zip () {
	if download "${cqbtest_full_zip_url}" "$(get_temporary_filepath "${cqbtest_full_zip_filename}")" "${cqbtest_name} zip archive (${cqbtest_full_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${cqbtest_full_zip_filename}")" "${cqbtest_full_zip_sum}" "${cqbtest_name} zip archive"
	fi
}

extract_cqbtest_full_files () {
	echo "Extracting ${cqbtest_name} archive files"
	if 7z x -y -o"$(get_cqbtest_directory)/../" "$(get_temporary_filepath "${cqbtest_full_zip_filename}")" $(get_cqbtest_full_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_cqbtest_patch_zip () {
	if download "${cqbtest_patch_zip_url}" "$(get_temporary_filepath "${cqbtest_patch_zip_filename}")" "${cqbtest_name} zip archive (${cqbtest_patch_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${cqbtest_patch_zip_filename}")" "${cqbtest_patch_zip_sum}" "${cqbtest_name} zip archive"
	fi
}

extract_cqbtest_patch_files () {
	echo "Extracting ${cqbtest_name} archive files"
	if 7z x -y -o"$(get_cqbtest_directory)/../" "$(get_temporary_filepath "${cqbtest_patch_zip_filename}")" $(get_cqbtest_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}


## TrueCombat:Elite stuff
#########################

check_tcetest_directory () {
	check_directory "$(get_tcetest_directory)" "${tcetest_name}"
}

download_tcetest_full_run_gz () {
	if download "${tcetest_full_run_gz_url}" "$(get_temporary_filepath "${tcetest_full_run_gz_filename}")" "${tcetest_name} installer archive (${tcetest_full_run_gz_hsize})"
	then
		verify "$(get_temporary_filepath "${tcetest_full_run_gz_filename}")" "${tcetest_full_run_gz_sum}" "${tcetest_name} installer archive"
	fi
}

extract_tcetest_full_run () {
	echo "Extracting $(get_temporary_filepath "${tcetest_name} installer: ${tcetest_full_run_filename}")"
	if [ -f "$(get_temporary_filepath "${tcetest_full_run_filename}")" ]
	then
		echo "Already there"
		true
	else
		if gzip -d < "$(get_temporary_filepath "${tcetest_full_run_gz_filename}")" \
		   > "$(get_temporary_filepath "${tcetest_full_run_filename}")"
		then
			echo "Done"
			verify "$(get_temporary_filepath "${tcetest_full_run_filename}")"  "${tcetest_full_run_sum}" "${tcetest_name} installer"
		else
			echo "Failure"
			false
		fi
	fi

}

dump_tcetest_full_tar_gz () {
	echo "Dumping $(get_temporary_filepath "${tcetest_name} setup archive: ${tcetest_full_tar_gz_filename}")"
	if [ -f "$(get_temporary_filepath "${tcetest_full_tar_gz_filename}")" ]
	then
		echo "Already there"
		true
	else
		if dd if="$(get_temporary_filepath "${tcetest_full_run_filename}")" \
		      of="$(get_temporary_filepath "${tcetest_full_tar_gz_filename}")" \
			  ibs="${tcetest_full_tar_gz_offset}" skip=1 obs=1024 status=none
		then
			echo "Done"
			verify "$(get_temporary_filepath "${tcetest_full_tar_gz_filename}")" "${tcetest_full_tar_gz_sum}" "${tcetest_name} setup archive"
		else
			echo "Failure"
			false
		fi
	fi
}

pick_tcetest_full_tar_bz2 () {
	echo "Picking $(get_temporary_filepath "${tcetest_name} archive: ${tcetest_full_tar_bz2_filename}")"
	if [ -f "$(get_temporary_filepath "${tcetest_full_tar_bz2_filename}")" ]
	then
		echo "Already there"
		true
	else
		if tar -xzf "$(get_temporary_filepath "${tcetest_full_tar_gz_filename}")" \
		   "./${tcetest_full_tar_bz2_filename}" -O > "$(get_temporary_filepath "${tcetest_full_tar_bz2_filename}")"
		then
			echo "Done"
			verify "$(get_temporary_filepath "${tcetest_full_tar_bz2_filename}")" "${tcetest_full_tar_bz2_sum}" "${tcetest_name} archive"
		else
			echo "Failure"
			false
		fi
	fi
}

extract_tcetest_full_files () {
	echo "Extracting ${tcetest_name} files"
	if tar -C "$(get_tcetest_directory)/." --strip-components=1 -xjf \
	   "$(get_temporary_filepath "${tcetest_full_tar_bz2_filename}")" $(get_tcetest_full_filename_list)
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_tcetest_patch_zip () {
	if download "${tcetest_patch_zip_url}" "$(get_temporary_filepath "${tcetest_patch_zip_filename}")" "${tcetest_name} patch file (${tcetest_patch_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${tcetest_patch_zip_filename}")" "${tcetest_patch_zip_sum}" "${tcetest_name} patch file"
	fi
}

extract_tcetest_patch_files () {
	echo "Extracting ${tcetest_name} patch files"
	if 7z x -y -o"$(get_tcetest_directory)/./" "$(get_temporary_filepath "${tcetest_patch_zip_filename}")" $(get_tcetest_patch_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}


## TrueCombat 1.3 stuff
#######################

check_truecombat_directory () {
	check_directory "$(get_truecombat_directory)" "${truecombat_name}"
}

download_truecombat_full_11_zip () {
	if download "${truecombat_full_11_zip_url}" "$(get_temporary_filepath "${truecombat_full_11_zip_filename}")" "${truecombat_name} patch file (${truecombat_full_11_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${truecombat_full_11_zip_filename}")" "${truecombat_full_11_zip_sum}" "${truecombat_name} patch file"
	fi
}

extract_truecombat_full_11_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"$(get_truecombat_directory)/../" "$(get_temporary_filepath "${truecombat_full_11_zip_filename}")" $(get_truecombat_full_11_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_truecombat_patch_12_zip () {
	if download "${truecombat_patch_12_zip_url}" "$(get_temporary_filepath "${truecombat_patch_12_zip_filename}")" "${truecombat_name} patch file (${truecombat_patch_12_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${truecombat_patch_12_zip_filename}")" "${truecombat_patch_12_zip_sum}" "${truecombat_name} patch file"
	fi
}

extract_truecombat_patch_12_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"$(get_truecombat_directory)/./" "$(get_temporary_filepath "${truecombat_patch_12_zip_filename}")" $(get_truecombat_patch_12_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

download_truecombat_patch_13_zip () {
	if download "${truecombat_patch_13_zip_url}" "$(get_temporary_filepath "${truecombat_patch_13_zip_filename}")" "${truecombat_name} patch file (${truecombat_patch_13_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${truecombat_patch_13_zip_filename}")" "${truecombat_patch_13_zip_sum}" "${truecombat_name} patch file"
	fi
}

extract_truecombat_patch_13_files () {
	echo "Extracting ${truecombat_name} zip files"
	if 7z x -y -o"$(get_truecombat_directory)/./" "$(get_temporary_filepath "${truecombat_patch_13_zip_filename}")" $(get_truecombat_patch_13_zip_filename_list) >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}


## TrueCombat 0.45 stuff
########################

check_q3tc045_directory () {
	check_directory "$(get_q3tc045_directory)" "${q3tc045_name}"
}

download_q3tc045_full_zip () {
	if download "${q3tc045_full_zip_url}" "$(get_temporary_filepath "${q3tc045_full_zip_filename}")" "${q3tc045_name} patch file (${q3tc045_full_zip_hsize})"
	then
		verify "$(get_temporary_filepath "${q3tc045_full_zip_filename}")" "${q3tc045_full_zip_sum}" "${q3tc045_name} patch file"
	fi
}

extract_q3tc045_full_files () {
	echo "Extracting ${q3tc045_name} zip files"
	if 7z x -y -o"$(get_q3tc045_directory)/../" "$(get_temporary_filepath "${q3tc045_full_zip_filename}")" $(get_q3tc045_full_zip_filename_list) >/dev/null
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
	if [ "x${purge_after}" = "xtrue" ]
	then
		for temporary_filename in $(get_temporary_filename_list)
		do
			if [ -f "$(get_temporary_filepath "${temporary_filename}")" ]
			then
				echo "Deleting $(get_temporary_filepath "${temporary_filename}") file"
				if rm "$(get_temporary_filepath "${temporary_filename}")"
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
		if [ -d "${temporary_directory}" ]
		then
			echo "Deleting ${temporary_directory} directory"
			if rmdir "${temporary_directory}"
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

download_etmain () {
	check_temporary_directory \
	&& download_etmain_full_zip
}

download_and_install_etmain () {
	check_etlegacy_directory \
	&& check_etmain_directory \
	&& download_etmain \
	&& extract_etmain_full_run \
	&& dump_etmain_full_tar_gz \
	&& extract_etmain_full_files \
	&& extract_etmain_full_docs
}

download_cqbtest () {
	check_temporary_directory \
	&& download_cqbtest_full_zip \
	&& download_cqbtest_patch_zip
}

download_and_install_cqbtest () {
	check_etlegacy_directory \
	&& check_cqbtest_directory \
	&& download_cqbtest \
	&& extract_cqbtest_full_files \
	&& extract_cqbtest_patch_files
}

download_tcetest () {
	check_temporary_directory \
	&& download_tcetest_full_run_gz \
	&& download_tcetest_patch_zip
}

download_and_install_tcetest () {
	check_etlegacy_directory \
	&& check_tcetest_directory \
	&& download_tcetest \
	&& extract_tcetest_full_run \
	&& dump_tcetest_full_tar_gz \
	&& pick_tcetest_full_tar_bz2 \
	&& extract_tcetest_full_files \
	&& extract_tcetest_patch_files
}

download_truecombat () {
	check_temporary_directory \
	&& download_truecombat_full_11_zip \
	&& download_truecombat_patch_12_zip \
	&& download_truecombat_patch_13_zip
}

download_and_install_truecombat () {
	check_ioquake3_engine_directory \
	&& check_truecombat_directory \
	&& download_truecombat \
	&& extract_truecombat_full_11_files \
	&& extract_truecombat_patch_12_files \
	&& extract_truecombat_patch_13_files
}

download_q3tc045 () {
	check_temporary_directory \
	&& download_q3tc045_full_zip
}

download_and_install_q3tc045 () {
	check_ioquake3_engine_directory \
	&& check_q3tc045_directory \
	&& download_q3tc045 \
	&& extract_q3tc045_full_files
}

## Arguments
############

print_help () {
	tab="$(printf '\t')"
	cat <<-EOF
	Usage: ${0} [OPTION]... MOD NAME [MOD NAME]...
	
	${0} is a tool to install popular mods for ${etlegacy_engine_name} and ${ioquake3_engine_name} engines.
	
	Without OPTION:
	- installs mods in ${etlegacy_name} and ${quake3arena_name} user directories.
	- downloads temporary files to “${default_temporary_directory}” directory.
	- does not purge downloaded temporary files.
	- asks user before doing anything.

	OPTIONS
	${tab}-tmp=PATH, --temporary-directory=PATH
	${tab}    download files in PATH directory
	${tab}-etl=PATH, --etlegacy-directory=PATH
	${tab}    install ${etlegacy_name} mods in PATH directory
	${tab}-ioq=PATH, --ioquake3-directory=PATH
	${tab}    install ${quake3arena_name} mods in PATH directory

	${tab}-oa, --openarena
	${tab}    install ${quake3arena_name} mods in ${openarena_name} directory

	${tab}-y, --yes
	${tab}    assume yes, do not ask before doing something
	${tab}-f,  --force-redownload
	${tab}    force to download again already downloaded files
	${tab}-p,  --purge-after
	${tab}    purge downloaded temporary files after installation
	${tab}-h,  --help
	${tab}    print this help

	MOD NAMES
	${tab}etmain
	${tab}    $(get_etmain_full_description)
	${tab}cqb, cqbtest
	${tab}    $(get_cqbtest_full_description)
	${tab}tce, tcetest
	${tab}    $(get_tcetest_full_description)
	${tab}truecombat
	${tab}    $(get_truecombat_full_description)
	${tab}q3tc045
	${tab}    $(get_q3tc045_full_description)

	${tab}all
	${tab}    an alias for “etmain cqbtest tcetest truecombat q3tc045”

	${tab}nothing
	${tab}    nothing

	EXAMPLES
	To install ${etmain_name} as an ${etlegacy_name} mod:
	$ ${0} ${etmain_mod_name}

	To install both ${cqbtest_name} and ${tcetest_name}:
	$ ${0} ${cqbtest_mod_name} ${tcetest_mod_name}

	To install $(get_q3tc045_description) as an ${openarena_name} mod:
	$ ${0} -oa ${q3tc045_mod_name}

	To purge already downloaded files without installing anything more:
	$ ${0} --purge-after nothing

	To install $(get_truecombat_description) using a random temporary directory, automatically
	deleting temporary files, in non interactive mode:
	$ ${0} -p -ni -dl="\$(mktemp -d)" ${truecombat_mod_name}

	To install ${tcetest_name} inside ${wolfet_name} user directory
	which is not recommended at all:
	$ ${0} -etl="\${HOME}/${wolfet_user_directory}" ${tcetest_mod_name}

	To install all mods inside system directories:
	# ${0} -ioq="/usr/share/games/quake3" -etl="/usr/share/games/etlegacy" all
	EOF
}

parse_args () {
	etlegacy_directory="${HOME}/${etlegacy_user_directory}"
	ioquake3_engine_directory="${HOME}/${quake3arena_user_directory}"
	temporary_directory="${default_temporary_directory}"
	purge_after="false"
	force_redownload="false"
	download_only="false"
	install_nothing="false"
	assume_yes="true"
	mod_list=""

	for arg in ${@}
	do
		case "${arg}" in
			etmain|et)
				mod_list="${mod_list} etmain"
				;;
			cqbtest|cqb)
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
				mod_list="etmain cqbtest tcetest truecombat q3tc045"
				;;
			nothing)
				install_nothing="true"
				;;
			--temporary-directory=*|-tmp=*)
				temporary_directory="$(echo "${arg}" | sed -e "s/[^=.]*=//")"
				;;
			--etlegacy-directory=*|-etl=*)
				etlegacy_directory="$(echo "${arg}" | sed -e "s/[^=.]*=//")"
				;;
			--ioquake3-directory=*|-ioq=*)
				ioquake3_engine_directory="$(echo "${arg}" | sed -e "s/[^=.]*=//")"
				;;
			--openarena|-oa)
				ioquake3_engine_directory="${HOME}/${openarena_user_directory}"
				;;
			--purge-after|-p)
				purge_after="true"
				;;
			--force-redownload|-f)
				force_redownload="true"
				;;
			--download-only|-dl)
				download_only="true"
				;;
			--yes|-y)
				assume_yes="false"
				;;
			--help|-h)
				print_help
				exit 1
				;;
			*)
				echo "Bad argument: ${arg}"
				exit 0
				;;
		esac
	done

	if [ "x${mod_list}" = "x" ]
	then
		install_nothing="true"
		mod_list="nothing"
	fi

	if [ "x${install_nothing}" = "xtrue" ]
	then
		mod_list="nothing"
	fi

	mod_list="$(echo "${mod_list}" | tr ' ' '\n' | sort | uniq | tr '\n' ' ')"
}

print_configuration () {
	echo "Configuration:"
	echo "- Temporary directory: ${temporary_directory}"
	echo "- ${etlegacy_engine_name} directory: ${etlegacy_directory}"
	echo "- ${ioquake3_engine_name} directory: ${ioquake3_engine_directory}"

	if [ "x${install_nothing}" = "xtrue" ]
	then
		echo "No mod selected"
	else
		echo "Selected mods:"
		for mod_name in ${mod_list}
		do
			echo "- $("get_${mod_name}_full_description")"
			echo "  Will download $("get_${mod_name}_downloadable_filename_list" | tr '\n' ' ')in ${temporary_directory}"
			if [ "x${download_only}" = "xfalse" ]
			then
				echo "  Will install ${mod_name} as $("get_${mod_name}_directory")"
			fi
		done
	fi

	if [ "x${purge_after}" = "xfalse" ]
	then
		echo "Will not purge temporary files"
	else
		echo "Will purge temporary files"
	fi
}

ask_continue () {
	if [ "x${assume_yes}" = "xtrue" ]
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
	print_configuration

	ask_continue

	if [ "x${install_nothing}" = "xfalse" ]
	then
		for mod_name in ${mod_list}
		do
			if [ "x${download_only}" = "xtrue" ]
			then
				"download_${mod_name}"
			else
				"download_and_install_${mod_name}"
			fi
		done
	fi

	purge
}

main ${@}

#EOF
