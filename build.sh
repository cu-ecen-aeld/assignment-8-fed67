#!/bin/bash
#Script to build buildroot configuration
#Author: Siddhant Jajoo


function enable_build_ssh {
	modules=("BR2_PACKAGE_OPENSSH"
			"BR2_PACKAGE_OPENSSH_CLIENT"
			"BR2_PACKAGE_OPENSSH_SERVER"
			"BR2_PACKAGE_OPENSSH_KEY_UTILS"
			"BR2_PACKAGE_OPENSSH_SANDBOX"

		)
	for i in "${modules[@]}"; do
		sed -i "s/^[#]${i}=./${i}=y/" buildroot/.config
	done

	sed -i 's/^[#]BR2_TARGET_GENERIC_ROOT_PASSWD=.*/BR2_TARGET_GENERIC_ROOT_PASSWD="root"/' buildroot/.config
}


source shared.sh

EXTERNAL_REL_BUILDROOT=../base_external
git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

if [ ! -e buildroot/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"

	if [ -e ${AESD_MODIFIED_DEFCONFIG} ]
	then
		echo "USING ${AESD_MODIFIED_DEFCONFIG}"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}

		enable_build_ssh
	else
		echo "Run ./save_config.sh to save this as the default configuration in ${AESD_MODIFIED_DEFCONFIG}"
		echo "Then add packages as needed to complete the installation, re-running ./save_config.sh as needed"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} BR2_DEFCONFIG=${AESD_DEFAULT_DEFCONFIG}
	fi
else
	enable_build_ssh

	echo "USING EXISTING BUILDROOT CONFIG"
	echo "To force update, delete .config or make changes using make menuconfig and build again."
	make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT}

fi
