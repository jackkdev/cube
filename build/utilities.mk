# Contains various utility commands for debugging the build system.

# Prints the currently active toolchain.
.PHONY: toolchain
toolchain:
	@echo [+] Executables:
	@echo [+] CC: $(CC)
	@echo [+] AS: $(AS)
	@echo [+] LD: $(LD)
	@echo [+] AR: $(AR)
	@echo [+] OBJCOPY: $(OBJCOPY)
	@echo
	@echo [+] Flags:
	@echo [+] CFLAGS:  $(subst \n,,$(strip $(CFLAGS)))
	@echo [+] ASFLAGS: $(subst \n,,$(strip $(ASFLAGS)))
	@echo [+] LDFLAGS: $(subst \n,,$(strip $(LDFLAGS)))

.PHONY: targets
targets:
	@echo [+] Targets: $(TARGETS)

.PHONY: clean
clean:
	@echo [+] Cleaning..
	@rm -rf $(CLEAN)
