ROOT = ../..
SRC = $(ROOT)/src
OBJ = $(ROOT)/obj
OUT = $(ROOT)/img
INC = $(ROOT)/include

OBJS = $(OBJ)/mythos.o $(OBJ)/konsole.o $(OBJ)/hal.o \
	$(OBJ)/cpuid.o $(OBJ)/ports.o $(OBJ)/pic.o \
	$(OBJ)/msr.o $(OBJ)/idt.o $(OBJ)/bugcheck.o \
	$(OBJ)/backtrace.o

PINC = $(ROOT)/include/x86_64 -I$(ROOT)/include/x86_cmn

ADAC = gcc
AS = as
LD = ld

ADAFLAGS = -I$(INC) -I$(PINC) -gnatec=$(SRC)/mythos.adc -O3 \
	-mno-sse -mno-sse2 -mno-red-zone -nostdlib -fno-stack-protector
LDFLAGS = -Ttext=0x10000 -eMythOS_main

all: .build_cmn .build

debug: .set_debug .build

.set_debug:
	$(MAKE) -C ../x86_cmn arch=x86_64 debug
	$(eval ADAFLAGS += -g)

.build_cmn:
	$(MAKE) -C ../x86_cmn arch=x86_64

.build: $(OUT)/kernel.elf

$(OBJ)/%.o: %.adb
	$(ADAC) -c $^ $(ADAFLAGS) -o $@

$(OBJ)/%.o: %.asm
	$(AS) $^ -o $@

$(OUT)/kernel.elf: $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

clean:
