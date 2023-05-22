ROOT = ../..
IMG = $(ROOT)/img
OBJ = $(ROOT)/obj

AS = fasm

all: .get_arch
	@$(MAKE) -C x86_cmn
	@$(MAKE) -C $(arch)

.get_arch:
ifndef arch
	$(eval arch=x86_64)
endif
