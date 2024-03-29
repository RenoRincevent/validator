#ifndef INTERFACE_CODE_DUMP_REGS_C
#define INTERFACE_CODE_DUMP_REGS_C

#include "interface_code.h"
#include <stdio.h>
	

void dump_regs()
{
	int i;

	for (i = 0; i < NUM_REG; i++)
	{
		/* let's display 32 or 64 bits */
		//if (reg_infos[i].size == 64)
		//	printf(" %s\t%016lX|%016lX  ||  %016lX|%016lX\n", reg_infos[i].name, reg_infos[i].gliss_last, reg_infos[i].gliss, reg_infos[i].gdb_last, reg_infos[i].gdb);
		//else
			printf(" %s\t%08lX|%08lX  ||  %08lX|%08lX\n", reg_infos[i].name, reg_infos[i].gliss_last, reg_infos[i].gliss, reg_infos[i].gdb_last, reg_infos[i].gdb);
	}
}

#endif /* INTERFACE_CODE_DUMP_REGS */

