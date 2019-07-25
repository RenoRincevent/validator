#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32UF

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_FP_OP2_D
    #define TEST_FP_OP2_D TEST_FP_OP2_D32
#endif

init:
	lui	a0,0x2
	csrs	mstatus,a0
	csrwi	fcsr,0

  la s0, tdat
  TEST_CASE_D32(2, a0, a1, 0x40000000bf800000, fld f2, 0(s0); fsd f2, 16(s0); lw a0, 16(s0); lw a1, 20(s0))
  TEST_CASE_D32(3, a0, a1, 0x40000000bf800000, fld f2, 0(s0); fsw f2, 16(s0); lw a0, 16(s0); lw a1, 20(s0))
  TEST_CASE_D32(4, a0, a1, 0x40000000bf800000, flw f2, 0(s0); fsw f2, 16(s0); lw a0, 16(s0); lw a1, 20(s0))
  TEST_CASE_D32(5, a0, a1, 0xc080000040400000, fld f2, 8(s0); fsd f2, 16(s0); lw a0, 16(s0); lw a1, 20(s0))
  TEST_CASE_D32(6, a0, a1, 0xffffffff40400000, flw f2, 8(s0); fsd f2, 16(s0); lw a0, 16(s0); lw a1, 20(s0))

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

tdat:
.word 0xbf800000
.word 0x40000000
.word 0x40400000
.word 0xc0800000
.word 0xdeadbeef
.word 0xcafebabe
.word 0xabad1dea
.word 0x1337d00d

RVTEST_DATA_END
