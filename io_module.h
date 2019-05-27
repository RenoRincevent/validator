#ifndef IO_MODULE_H
#define IO_MODULE_H

#define RV32G_MEM_SPY

#include GLISS_API_H
#include GLISS_MEM_H


void gdb_callback(RV32G_address_t addr, int size, void *data, unsigned int type_access);

void debug_callback(RV32G_address_t addr, int size, void *data, unsigned int type_access);

#endif /* IO_MODULE_H */
