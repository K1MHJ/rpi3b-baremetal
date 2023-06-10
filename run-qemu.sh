#!/bin/bash

echo "Press \"Ctrl + a, c \" to Stop virtual app"
echo "Press \"Ctrl + a, x \" to Close QEMU"
pushd ./../
qemu-system-aarch64 \
  -M raspi3b \
  -kernel ./bin/boot.bin \
  -serial null \
  -serial mon:stdio \
  -nographic
popd

#qemu-system-arm \
#  -m 1G -M raspi2b\
#  -serial stdio\
#  -kernel ./bin/boot.elf\
#  -serial mon:stdio\

#qemu-system-aarch64 \
#  -M raspi3b \
#  -serial mon:stdio \
#  -kernel ./bin/boot.bin \
#  -d in_asm \
#  -nographic
