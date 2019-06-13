/*** This file was generated automatically by generate_interface_code.py. ***/
#ifndef INTERFACE_CODE_H
#define INTERFACE_CODE_H

#include GLISS_API_H
#include "internal.h"

typedef union
{
	float f;
	uint32_t u;
} f32_t;

typedef union
{
	double f;
	uint64_t u;
} f64_t;

typedef struct
{
	char *name;
	int gdb_idx;
	int size;
	/* can deal with register up to 32 bits, extends to uint64_t if you want 64 bits */
	uint32_t gliss, gdb, gliss_last, gdb_last;
	/* description of corresponding gliss register and its index in bank */
	int gliss_reg;
	int gliss_idx;
	int relative;
} reg_t;

typedef struct
{
	char *name;
	int size;
	char *gliss_reg;
	int relative;
} reg_data_t;


void read_vars_this_instruction(char *);
void compare_regs_this_instruction(char *, RV32G_state_t *, RV32G_inst_t *, int);	
void dump_regs();
void init_gdb_regs(char *);


#define	NUM_REG	68

extern reg_data_t size_data[NUM_REG + 1];
extern reg_t reg_infos[NUM_REG + 1];

#endif /* INTERFACE_CODE_H */

