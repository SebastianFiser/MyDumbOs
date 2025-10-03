# Toolchain
AS = nasm
CC = x86_64-elf-gcc
LD = x86_64-elf-ld
GRUBMK = grub-mkrescue
CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -nostdlib -Ttext 0x100000

# Soubory
BOOT = boot.S
KERNEL = kernel.c
OBJ = boot.o kernel.o
ISO = MyDumbOS.iso

# Vše
all: $(ISO)

# Překlad bootloaderu
boot.o: boot.S
	$(AS) -f elf64 boot.S -o boot.o

# Překlad kernelu
kernel.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

# Linkování kernelu a bootloaderu
kernel.elf: $(OBJ)
	$(LD) $(LDFLAGS) -o kernel.elf $(OBJ)

# Vytvoření ISO
$(ISO): kernel.elf
	mkdir -p isodir/boot/grub
	cp kernel.elf isodir/boot/
	cp grub.cfg isodir/boot/grub/
	$(GRUBMK) -o $(ISO) isodir

# Vyčištění
clean:
	rm -f *.o *.elf
	rm -rf isodir
	rm -f $(ISO)

run: $(ISO)
	qemu-system-x86_64 -cdrom $(ISO) -m 512M