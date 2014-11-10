#! /bin/sh

download_dir="/tmp/truecombat_files"

etlegacy_name="Enemy Territory: Legacy"
tce_name="TrueCombat:Elite"
tce_mod_name="tcetest"

etlegacy_install_dir="${HOME}/.etlegacy"
tce_install_dir="${etlegacy_install_dir}/${tce_mod_name}"

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
tce_full_tar_bz2_size="471775660"
tce_full_tar_bz2_sum="ff5cf836b5cedda75434678feac4d35ee8bae3ad6330e07d447f3d5c77e9c6c26ae073cf340fc277645b6ed1fc61326c02ffdbbcd2a30bd630acb7b0b46364e2"

tce_patch_zip_url="http://stealthzone.net/index.php?option=com_docman&task=doc_download&gid=2&Itemid=17"
tce_patch_zip_filename="tce049b_all_os_fixed.zip"
tce_patch_zip_filepath="${download_dir}/${tce_patch_zip_filename}"
tce_patch_zip_sum="8814f193437551c29edf88087229ee813317df10e264c3a0200942ef7c1e876aacff4d985d28bd59d1b3bd9589c86ad034d59a8f434cb443a31e07db9b0562da"
tce_patch_zip_size="6795533"
tce_patch_zip_hsize="6.5Mb"

tce_patch_files="mp_bin.pk3 official.dat pak4.pk3 qagame.mp.i386.so readme_tce0490b.txt ui.mp.i386.so cgame.mp.i386.so"


create_download_dir () {
	echo "Creating download directory: ${download_dir}"
	if mkdir "${download_dir}"
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

check_download_dir () {
	echo "Verifying ${download_dir} directory: ${download_dir}"
	if [ -e "${download_dir}" ]
	then
		if [ -d "${download_dir}" ]
		then
			echo "Already there"
			true
		else
			echo "Error, not a directory"
			false
		fi
	else
		echo "Not here, must be created before"
		create_download_dir
	fi
}

create_etlegacy_dir () {
	echo "Creating ${etlegacy_name} directory: ${etlegacy_install_dir}"
	if mkdir "${etlegacy_install_dir}"
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

check_etlegacy_dir () {
	echo "Verifying ${etlegacy_name} directory: ${etlegacy_install_dir}"
	if [ -e "${etlegacy_install_dir}" ]
	then
		if [ -d "${etlegacy_install_dir}" ]
		then
			echo "Already there"
			true
		else
			echo "Error, not a directory"
			false
		fi
	else
		echo "Not here, must be created before"
		create_etlegacy_dir
	fi
}

create_tce_dir () {
	echo "Creating ${tce_name} directory: ${tce_install_dir}"
	if mkdir "${tce_install_dir}"
	then
		echo "Success"
		true
	else
		false
	fi
}

check_tce_dir () {
	echo "Verifying ${tce_name} directory: ${tce_install_dir}"
	if [ -e "${tce_install_dir}" ]
	then
		if [ -d "${tce_install_dir}" ]
		then
			echo "Already there"
			true
		else
			echo "Error, not a directory"
			false
		fi
	else
		echo "Not here, must be created before"
		create_tce_dir
	fi
}

verify_tce_full_run_gz () {
	echo "Verifying ${tce_name} installer archive: ${tce_full_run_gz_filepath}"
	if [ "$(sha512sum "${tce_full_run_gz_filepath}" | cut -f1 -d' ')" = "${tce_full_run_gz_sum}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

download_tce_full_run_gz () {
	echo "Downloading ${tce_name} installer archive: ${tce_full_run_gz_filepath} (${tce_full_run_gz_hsize})"
	if [ -f "${tce_full_run_gz_filepath}" ]
	then
		echo "Already there"
		true
	else
		if wget --quiet "${tce_full_run_gz_url}" -O "${tce_full_run_gz_filepath}"
		then
			echo "Done"
			verify_tce_full_run_gz
		else
			echo "Failure"
			false
		fi
	fi
}

verify_tce_full_run () {
	echo "Verifying ${tce_name} installer: ${tce_full_run_filepath}"
	if [ "$(sha512sum "${tce_full_run_filepath}" | cut -f1 -d' ')" = "${tce_full_run_sum}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
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
			verify_tce_full_run
		else
			echo "Failure"
			false
		fi
	fi

}

verify_tce_full_tar_gz () {
	echo "Verifying ${tce_name} setup archive: ${tce_full_tar_gz_filepath}"
	if [ "$(sha512sum "${tce_full_tar_gz_filepath}" | cut -f1 -d' ')" = "${tce_full_tar_gz_sum}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
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
			verify_tce_full_tar_gz
		else
			echo "Failure"
			false
		fi
	fi
}

verify_tce_full_tar_bz2 () {
	echo "Verifying ${tce_name} archive: ${tce_full_tar_bz2_filepath}"
	if [ "$(sha512sum "${tce_full_tar_bz2_filepath}" | cut -f1 -d' ')" = "${tce_full_tar_bz2_sum}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

pick_tce_full_tar_bz2_archive () {
	echo "Picking ${tce_name} archive: ${tce_full_tar_bz2_filepath}"
	if [ -f "${tce_full_tar_bz2_filepath}" ]
	then
		echo "Already there"
		true
	else
		if tar -xzf "${tce_full_tar_gz_filepath}" "./${tce_full_tar_bz2_filename}" -O > "${tce_full_tar_bz2_filepath}"
		then
			echo "Done"
			verify_tce_full_tar_bz2
		else
			echo "Failure"
			false
		fi
	fi
}

extract_tce_full_dir () {
	echo "Extracting ${tce_name} directory: ${tce_install_dir}"
	if tar -C "${tce_install_dir}/." --strip-components=1 -xjf "${tce_full_tar_bz2_filepath}" "${tce_mod_name}/"
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

verify_tce_patch_zip () {
	echo "Verifying ${tce_name} patch archive: ${tce_patch_zip_filepath}"
	if [ "$(sha512sum "${tce_patch_zip_filepath}" | cut -f1 -d' ')" = "${tce_patch_zip_sum}" ]
	then
		echo "Success"
		true
	else
		echo "Failure"
		false
	fi
}

download_tce_patch_zip () {
	echo "Downloading ${tce_name} patch archive: ${tce_patch_zip_filepath} (${tce_patch_zip_hsize})"
	if [ -f "${tce_patch_zip_filepath}" ]
	then
		echo "Already there"
		true
	else
		if wget --quiet "${tce_patch_zip_url}" -O "${tce_patch_zip_filepath}"
		then
			echo "Done"
			verify_tce_patch_zip
		else
			echo "Failure"
			false
		fi
	fi
}

extract_tce_patch_files () {
	echo "Extracting ${tce_name} patch files: ${tce_patch_files}"
	if 7z e -y -o"${tce_install_dir}/." "${tce_patch_zip_filepath}" ${tce_patch_files} >/dev/null
	then
		echo "Done"
		true
	else
		echo "Failure"
		false
	fi
}

main () {

	check_download_dir \
	&& check_etlegacy_dir \
	&& check_tce_dir \
	&& download_tce_full_run_gz \
	&& download_tce_patch_zip \
	&& extract_tce_full_run \
	&& dump_tce_full_tar_gz \
	&& pick_tce_full_tar_bz2_archive \
	&& extract_tce_full_dir \
	&& extract_tce_patch_files

}

main

#EOF
