ROOT = ../../..
OBJ = $(ROOT)/obj

AS = fasm

all: $(OBJ)/MBR.bin $(OBJ)/VBR.bin

$(OBJ)/%.bin: %.asm
	$(AS) $< $@
