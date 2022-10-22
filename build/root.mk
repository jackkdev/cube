# Load the core files.
include build/toolchain.mk
include build/flags.mk
include build/rules.mk

# Load the configuration and the configured toolchain.
include build/config.mk
include build/toolchains/$(TOOLCHAIN).mk

# Setup the targets variable.
TARGETS :=

all: $(TARGETS)

# Include the utility commands.
include build/utilities.mk
