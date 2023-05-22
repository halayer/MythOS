ROOT = ../..
SRC = $(ROOT)/src
OBJ = $(ROOT)/obj
OUT = $(ROOT)/img
INC = $(ROOT)/include

OBJS = $(OBJ)/mythos.o $(OBJ)/konsole.o $(OBJ)/cpuid.o \
	$(OBJ)/ports.o $(OBJ)/pic.o $(OBJ)/msr.o

PINC = $(ROOT)/include/x86_cmn

ADAC = gcc
LD = ld

ADAFLAGS = -I$(INC) -I$(PINC) -gnatec=$(SRC)/mythos.adc -O3 \
	-mno-sse -mno-sse2 -mno-red-zone -nostdlib -fno-stack-protector
LDFLAGS = -Ttext=0x10000 -eMythOS_main

all: .set_arch .build

debug: .set_debug .set_arch .build

.set_debug:
	$(eval ADAFLAGS += -g)
.set_arch:
ifeq ($(arch), x86)
	$(eval LDFLAGS += -melf_i386)
	$(eval ADAFLAGS += -m32)
endif

.build: $(OBJS)

$(OBJ)/%.o: %.adb
	$(ADAC) -c $^ $(ADAFLAGS) -o $@

clean:
