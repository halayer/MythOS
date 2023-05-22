ROOT = ..
OBJ = $(ROOT)/obj
INC = $(ROOT)/include

OBJS = $(OBJ)/bugcheck.o

ADAC = gcc

ADAFLAGS = -I$(INC) -gnatec=mythos.adc -O3 -mno-sse -mno-sse2 -mno-red-zone \
	-nostdlib -fno-stack-protector

DIR = x86

all: .build .get_dir
	@$(MAKE) -C $(DIR)

debug: .get_dir
	@$(MAKE) -C $(DIR) debug

clean: .get_dir
	@$(MAKE) -C $(DIR) clean

.build: $(OBJS)

$(OBJ)/%.o: %.adb
	$(ADAC) -c $^ $(ADAFLAGS) -o $@

.get_dir:
ifeq ($(arch), x86_64)
	$(eval DIR = x86_64)
else ifeq ($(arch), x64)
	$(eval DIR = x86_64)
endif
