#!/bin/bash

echo "Press \"Ctrl + a, c \" to Stop virtual app"
echo "Press \"Ctrl + a, x \" to Close QEMU"
pushd ./
qemu-system-aarch64 \
  -M raspi3b \
  -kernel ./../bin/boot.bin \
  -serial mon:stdio \
  -nographic
popd
