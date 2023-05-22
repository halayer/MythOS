all: .get_arch
	@$(MAKE) -C mbr arch=$(arch)
	@$(MAKE) -C uefi arch=$(arch)

.get_arch:
ifndef arch
	$(eval arch = x86_64)
endif
