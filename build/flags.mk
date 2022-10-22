# Contains the default flags for the compiler, linker, etc.
# These should be the absolute minimal things required for all packages.

CFLAGS  := \
					 -ffreestanding \
					 -MMD \
					 -std=gnu11 \
					 -mcmodel=kernel

ASFLAGS :=

LDFLAGS := \
					 -ffreestanding \
					 -nostdlib

ifeq ($(MODE),"DEBUG")
	CLFAGS += \
						-Wall -Wextra \
						-O0 \
						-ggdb

	ASFLAGS += \
						-Wall -Wextra \
						-O0 \
						-ggdb
endif

ifeq ($(MODE),"RELEASE")
	CLFAGS += \
						-Wall -Wextra \
						-O3

	ASFLAGS += \
						-Wall -Wextra \
						-O3
endif
