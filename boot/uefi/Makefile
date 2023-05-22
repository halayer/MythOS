ROOT = ../..
GNUEFI = ../../gnu-efi
OBJ = $(ROOT)/obj
IMG = $(ROOT)/img

CC = gcc
LD = ld

CFLAGS = -c -fno-stack-protector -fpic -fshort-wchar -mno-red-zone \
	-I/usr/include/efi -I/usr/include/efi/$(arch) -DEFI_FUNCTION_WRAPPER

LDFLAGS = $(GNUEFI)/$(arch)/gnuefi/crt0-efi-$(arch).o -nostdlib -znocombreloc \
		  -T /usr/lib/elf_$(arch)_efi.lds -shared -Bsymbolic -L /usr/lib \
		  -l:libgnuefi.a -l:libefi.a

all: .get_arch .boot_arch $(IMG)/EFI/Boot/boot$(boot_arch).efi

$(IMG)/EFI/Boot/boot$(boot_arch).efi: main.c
	$(CC) $< $(CFLAGS) -o $(OBJ)/uefi_main.o
	$(LD) $(OBJ)/uefi_main.o $(LDFLAGS) -o $(OBJ)/uefi_main.elf
	objcopy -j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .rel \
		-j .rela -j .reloc --target=efi-app-$(arch) $(OBJ)/uefi_main.elf \
		$(addsuffix .efi,$(join $(basename $@), $(boot_arch)))

.get_arch:
ifndef arch
	$(eval arch = x86_64)
endif

.boot_arch:
ifeq ($(arch),x86_64)
	$(eval boot_arch = x64)
else
	$(eval boot_arch = $(arch))
endif
