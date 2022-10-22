# Project: "cube-iso"
# Builds the ISO for cube.

R = packages/cube-iso

CUBE_ISO_BIN := $(R)/cube.iso
CUBE_ISO_ROOT := $(R)/root

LIMINE := $(R)/limine

$(LIMINE):
	@git clone https://github.com/limine-bootloader/limine.git --branch=v4.x-branch-binary --depth=1 $(LIMINE)
	@echo [+] Cloning limine into '$(R)'
	@make -C $(LIMINE)

LIMINE_FILES := $(LIMINE)/limine.sys $(LIMINE)/limine-cd.bin

$(CUBE_ISO_BIN): $(CUBE_KERNEL_BIN) $(LIMINE)
	@rm -rf $(CUBE_ISO_ROOT)
	@mkdir -p $(CUBE_ISO_ROOT)
	@echo [+] Creating ISO-root @ '$(CUBE_ISO_ROOT)'
	
	cp $(CUBE_KERNEL_BIN) $(R)/limine.cfg $(LIMINE_FILES) $(CUBE_ISO_ROOT)
	@echo [+] Moved limine and kernel into root.

	@xorriso -as mkisofs -b limine-cd.bin \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		--protective-msdos-label \
		$(CUBE_ISO_ROOT) -o $(CUBE_ISO_BIN)

	@$(LIMINE)/limine-deploy $(CUBE_ISO_BIN)

CLEAN += $(CUBE_ISO_ROOT) $(CUBE_ISO_BIN)

.PHONY: cube-qemu
cube-qemu: R = packages/cube-iso
cube-qemu: $(CUBE_ISO_BIN) $(R)/limine.cfg
	qemu-system-x86_64 -M q35 -m 2G -cdrom $(CUBE_ISO_BIN) -boot d
