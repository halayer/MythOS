all: .get_arch
	@$(MAKE) -C src arch=$(arch)
	@$(MAKE) -C boot arch=$(arch)

debug: .get_arch
	@$(MAKE) -C src arch=$(arch) debug
	@$(MAKE) -C boot arch=$(arch)

clean:
	@$(MAKE) -C src clean
	@$(MAKE) -C boot clean

.get_arch:
ifndef arch
	$(eval arch = x86_64)
endif
