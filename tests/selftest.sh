#! /bin/bash

yes | ./scripts/fetch.sh
yes | ./scripts/build.sh
yes | ./scripts/launch.sh
sleep 5
ping 192.168.55.2 -c 5 || { echo FAIL; exit -1; }
echo PASS
