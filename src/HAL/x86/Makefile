VPATH = ../../../lib/x86/HAL
SRCS = $(shell find -name "*.c")
OBJS = $(addsuffix .lib,$(basename $(SRCS)))

CC = gcc

CFLAGS = -m32 -Wall -fno-stack-protector -ffreestanding -nostdinc -I../../../include

CRT = ../../../runtimes/C/include

all: $(OBJS)

%.lib: %.c
	$(CC) $(CFLAGS) -I$(CRT) -c $^ -o ../../../lib/x86/HAL/$(notdir $@)
