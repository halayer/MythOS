SRCS = $(shell find ! -name "kernel.c" -and -name "*.c")
OBJS = $(addsuffix .o,$(basename $(SRCS)))

CC = gcc
LD = ld

CFLAGS = -m32 -Wall -fno-stack-protector -ffreestanding -nostdinc -I../../include
LDFLAGS = -melf_i386 -Ttext=0x10000

CRT = ../../runtimes/C/include

%.o: %.c
	$(CC) $(CFLAGS) -I$(CRT) -c $^ -o $@

all: kernel.o $(OBJS)
	$(LD) $(LDFLAGS) $^ ../../lib/compat.lib ../../lib/HAL.lib ../../lib/x86/HAL/* -o ../../content/kernel.elf
