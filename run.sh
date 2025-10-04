#!/bin/bash
set -xue
QEMU=qemu-system-riscv32

CC="/usr/bin/clang"
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -fuse-ld=lld -fno-stack-protector -ffreestanding -nostdlib"

$CC $CFLAGS -W1,-Tkernel.ld -W1,-Map=kernel.map -o kernel.elf \kernel.c


$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot \-kernel kernel.elf
