#! /bin/bash

function warn_user 
{
        if [ "${MSG}" = "" ]; then
                MSG="Proceed? [Yn]"
        fi
        echo ${*}
        while true; do
                read -p "${MSG}" yn
                case ${yn} in
                        [Yy]* )
                                break;;
                        "" )
                                break;;
                        [Nn]* )
                                exit 1;;
                        * )
                                echo "Please answer yes or no."
                                ;;
                esac
        done
}

function root_check 
{
        if [ ${USER} != root ]; then
                MSG="Use sudo? [Yn]"
                warn_user ${*}
                MSG=""
        fi
}

[ `basename $PWD` == openwrt_11s ] || { echo This script must be executed from openwrt_11s root directory; exit -1; }


mkdir -p openwrt/files/etc/config

# remove iptables
mv openwrt/package/iptables/Makefile{,.gone}

# and remove this until we fix it
mv openwrt/package/kernel/Makefile{,.gone}

cp config_files/wireless openwrt/files/etc/config/
cp config_files/network openwrt/files/etc/config/

root_check "This script needs permission to add a qemu-ifup file to your /etc directory"


sudo cp config_files/qemu-ifup /etc/qemu-ifup


# copy openwrt .config file
cp config_files/dot.config openwrt/.config
#cd openwrt && yes '' | make oldconfig && cd ..
sed -i -e "s@CONFIG_EXTERNAL_KERNEL_TREE.*@CONFIG_EXTERNAL_KERNEL_TREE=\"${PWD}/kernel\"@" openwrt/.config

# copy kernel .config file
cp config_files/kernel.dot.config kernel/.config
cd openwrt && yes '' | make kernel_oldconfig && cd ..

# This is for aesthetics only:  it only affects the directory name of intermediate build files.
sed -i -e "s/LINUX_VERSION:=.*/LINUX_VERSION:=3.2.0/" openwrt/target/linux/x86/Makefile

