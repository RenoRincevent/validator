RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump -d
RISCV_GCC_OPTS ?= -march=rv32imaf -mabi=ilp32f -nostartfiles -I./p -I./scalar -T./link.ld

%.dump: %
	$(RISCV_OBJDUMP) $< > $@

all: add addi sub lui
.PHONY: all

%: %.S
	$(RISCV_GCC) $(RISCV_GCC_OPTS) $< -o $@
	$(RISCV_OBJDUMP) $@ > $@.dump
	

clean:
	rm add addi sub lui *.dump
