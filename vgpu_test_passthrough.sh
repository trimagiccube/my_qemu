#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Using this script with sudo password, like:"
	echo "$0 my_passwd"
	exit -1
fi

readonly def_ava_vgpu=2

sudo_passwd=$1


#echo $sudo_passwd | sudo -S bash -c "/usr/bin/qemu-system-x86_64 -name ubuntu_test -s -m 16384 -smp 2 -cpu max -name debug-threads=on -enable-kvm -drive format=qcow2,index=3,file=./ubuntu_docker.qcow2 -net user,hostfwd=tcp::10022-:22 -net nic -nographic -vnc :1 -device vfio-pci,host=01:00.0,addr=0x5,id=host1,rombar=0"

#echo $sudo_passwd | sudo -S bash -c "/usr/bin/qemu-system-x86_64 -name ubuntu_test -s -m 16384 -smp 2 -cpu max -name debug-threads=on -enable-kvm -drive format=qcow2,index=3,file=./ubuntu_docker.qcow2 -net user,hostfwd=tcp::10022-:22 -net nic -nographic -vnc :1 -device vfio-pci,host=01:00.0,addr=0x5,id=host1,rombar=0 -device vfio-pci,host=03:00.0,addr=0x6,id=host2,rombar=0"
echo $sudo_passwd | sudo -S bash -c "/home/yanxw/qemu/qemu_new/qemu/build/qemu-system-x86_64 -name ubuntu_test -s -m 16384 -smp 2 -cpu max -name debug-threads=on -enable-kvm -drive format=qcow2,index=3,file=./ubuntu_docker.qcow2 -net user,hostfwd=tcp::10022-:22 -net nic -nographic -vnc :1 \
	-device pci-levdev
	"

#	-device edu \
#	-device pci-levdev
#echo $sudo_passwd | sudo -S bash -c "strace /usr/bin/qemu-system-x86_64 -name ubuntu_test -s -m 16384 -smp 2 -cpu max -name debug-threads=on -enable-kvm -drive format=qcow2,index=3,file=./ubuntu_docker.qcow2 -net user,hostfwd=tcp::10022-:22 -net nic -nographic -vnc :1 -device vfio-pci,host=06:00.0,addr=0x5,id=host1,rombar=0 -device vfio-pci,host=09:00.0,addr=0x6,id=host2,rombar=0 2>&1 | tee log"
