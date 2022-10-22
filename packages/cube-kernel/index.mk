# Project: "cube-kernel"
# The actual bootable kernel for cube.

R = packages/cube-kernel

CUBE_KERNEL_BIN := $(R)/cube-kernel.elf
TARGETS += $(CUBE_KERNEL_BIN)

CUBE_KERNEL_SRC := $(R)/src/main.c

CUBE_KERNEL_X86_64_SRC :=
									 
ifeq ($(TARGET),x86_64)
	CUBE_KERNEL_SRC += $(CUBE_KERNEL_X86_64_SRC)
endif

CUBE_KERNEL_OBJ := $(CUBE_KERNEL_SRC:.c=.o)
CUBE_KERNEL_OBJ := $(CUBE_KERNEL_OBJ:.S=.o)

CLEAN += $(CUBE_KERNEL_OBJ) $(CUBE_KERNEL_BIN) $(CUBE_KERNEL_OBJ:.o=.d)

$(CUBE_KERNEL_BIN): R = packages/cube-kernel
$(CUBE_KERNEL_BIN): CFLAGS += -I$(R)/include
$(CUBE_KERNEL_BIN): ASFLAGS += -I$(R)/include
$(CUBE_KERNEL_BIN): $(CUBE_KERNEL_OBJ)
	$(LD) $(LDFLAGS) -T$(R)/cube-kernel.ld $^ -o $@
