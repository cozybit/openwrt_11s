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


svn co svn://svn.openwrt.org/openwrt/trunk openwrt

mkdir -p openwrt/files/etc/config

cp config_files/wireless openwrt/files/etc/config/
cp config_files/network openwrt/files/etc/config/

root_check "This script needs permission to add a qemu-ifup file to your /etc directory"


sudo cp config_files/qemu-ifup /etc/qemu-ifup

#TODO: configure build for this host here (e.g. x86? x86_64?).  You can do this by parsing the .config.
