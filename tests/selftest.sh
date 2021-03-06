#! /bin/bash
function fail
{
	echo FAIL
	killall qemu-system-i386
	exit -1
}

./scripts/fetch.sh
yes | ./scripts/configure.sh
yes | ./scripts/build.sh
./scripts/build-modules.sh
./scripts/launch.sh &> /dev/null &
sleep 10
ping 192.168.55.2 -c 5 || fail
killall qemu-system-i386
echo PASS
