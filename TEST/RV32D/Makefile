RISCV_PREFIX ?= riscv64-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump -D
RISCV_GCC_OPTS ?= -march=rv32imafd -mabi=ilp32d -nostartfiles -I../p -I../scalar -T../link.ld
MYDIR=./EXEC
MYDUMP=./DUMP



all: fadd_d fclass_d ldst_d fcmp_d fcvt fcvt_w fmin_d fmadd_d fdiv_d

%: %.S
	[ -d $(MYDIR) ] || mkdir -p $(MYDIR)
	[ -d $(MYDUMP) ] || mkdir -p $(MYDUMP)
	$(RISCV_GCC) $(RISCV_GCC_OPTS) $< -o $(MYDIR)/$@
	$(RISCV_OBJDUMP) $(MYDIR)/$@ > $(MYDUMP)/$@.dump

.PHONY: all
	

clean:
	rm -r $(MYDIR)
	rm -r $(MYDUMP)
