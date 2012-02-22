#! /bin/bash

yes | ./scripts/build.sh
yes | ./scripts/fetch.sh
yes | ./scripts/launch.sh

# TODO: ssh into the qemu instance to determine if launch was successful
# TODO: look for mesh config stanzas in /etc/config/wireless
