# Contains the rules for compiling various files.

%.o: %.c
	@echo [+] Compiling '$<' -> '$@'
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	@echo [+] Compiling '$<' -> '$@'
	@$(AS) $(ASFLAGS) -c $< -o $@
