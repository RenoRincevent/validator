RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump -D
RISCV_GCC_OPTS ?= -march=rv32imafd -mabi=ilp32d -nostartfiles -I../p -I../scalar -T../link.ld
MYDIR=./EXEC
MYDUMP=./DUMP



all: fcvt_w fcvt ldst fadd fmin fdiv fmadd fcmp fclass fmv

%: %.S
	[ -d $(MYDIR) ] || mkdir -p $(MYDIR)
	[ -d $(MYDUMP) ] || mkdir -p $(MYDUMP)
	$(RISCV_GCC) $(RISCV_GCC_OPTS) $< -o $(MYDIR)/$@
	$(RISCV_OBJDUMP) $(MYDIR)/$@ > $(MYDUMP)/$@.dump

.PHONY: all


clean:
	rm -r $(MYDIR)
	rm -r $(MYDUMP)
