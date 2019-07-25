# base directory containing the GLISS2 description for the given processor
GLISS_ARCH=/home/manu/Stage/riscv-nmp-gliss3-master
# irg file for processor description, usually in $(GLISS_ARCH) directory
ARCH_IRG=$(GLISS_ARCH)/RV32G.irg
# file with description of GLISS2 registers and corresponding gdb ones
CFG=./validator.cfg

# GNU target corresponding to the given processor,
# should be the prefix of a gdb command suitable for the processor
GNU_TARGET=riscv64-unknown-elf
# processor specific gdb command
GDB_NAME=/opt/riscv/bin/$(GNU_TARGET)-gdb

# name of the emulated processor
PROC_NAME=RV32G
# processor specific files, contain register access functions and structures initialization.
PROC_SRC= /home/manu/Stage/riscv-nmp-gliss3-master/src/api.c
PROC_INCL= /home/manu/Stage/riscv-nmp-gliss3-master/include/RV32G/api.h
# processor specific initialization, usually needed because some regs
# are not initialized the same way in GLISS as in GDB.
# macro with same name called in init_gliss() from main.c
#PROC_INIT_CODE={ \
#	/* set gliss stack pointer with same value as gdb */ \
#	/* sp is o6, also r14, fp is i6, also r30, fsr is 0 */ \
#	/* TODO, see if tsim put something in stack */ \
#	/* only zeroes are in the stack up to the fp addr, then garbage (looks like undefined) */ \
#	/* temp debug, set psr to the same value as gdb */ \
#	real_state->PSR = 0xF30010E0; \
#	set_reg(real_state, 14, sp); \
#	set_reg(real_state, 30, fp); \
#	real_state->WIM = 2; \
#	real_state->FSR = 0; \
#	real_state->R[5] = real_state->PC; \
#	}
PROC_CFLAGS=  -DGLISS_REG_H=\"$(PROC_INCL)\" -DPROC_INIT_CODE='$(PROC_INIT_CODE)'

#do not modify below this line
SRCS = main.c io_module.c gdb_interface.c interface_code_dump_regs.c \
	interface_code_compare_regs.c log.c interface_code_read_vars.c interface_code.c register.c $(PROC_SRC) /home/manu/Stage/riscv-nmp-gliss3-master/src/loader.c /home/manu/Stage/riscv-nmp-gliss3-master/src/mem.c
INCL = io_module.h all_inc.h  interface_code.h internal.h register.h $(PROC_INCL) /home/manu/Stage/riscv-nmp-gliss3-master/include/RV32G/loader.h /home/manu/Stage/riscv-nmp-gliss3-master/include/RV32G/mem.h

OBJS = $(SRCS:.c=.o)
CC = gcc
CFLAGS = -W -Wall -g -I$(GLISS_ARCH)/include -DGNU_TARGET=\"$(GNU_TARGET)\" -DGDB_NAME=\"$(GDB_NAME)\" -DGLISS_API_H=\<$(PROC_NAME)/api.h\> -DPROC'(x)'=$(PROC_NAME)\#\#x $(PROC_CFLAGS) -DGLISS_MEM_H=\<$(PROC_NAME)/mem.h\> -DRV32G_MEM_SPY
LDFLAGS = -L$(GLISS_ARCH)/src
LINK = libtool --mode=link $(CC) $(LINKFLAGS) -o $@

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

all : validator3-$(PROC_NAME)

validator3-$(PROC_NAME) : interface_code.h $(INCL) $(CFG) $(OBJS)
	$(LINK) $(OBJS)  -l$(PROC_NAME) $(LDFLAGS) -lm

clean:
	rm -f $(OBJS)

distclean: clean
	rm -f validator3-$(PROC_NAME) interface_code.h interface_code.c


interface_code.o: interface_code.c
interface_code.c: interface_code.h
interface_code.h: generate_interface_code.py $(CFG)
	 python generate_interface_code.py -i $(CFG) -p $(PROC_NAME)
