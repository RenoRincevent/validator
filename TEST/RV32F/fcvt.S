#include "riscv_test.h"
#include "test_macros.h"

#
# Test fcvt.s.{wu|w|lu|l}, fcvt.s.d, and fcvt.d.s instructions.
#

RVTEST_RV32UF

init:
	lui	a0,0x2
	csrs	mstatus,a0
	csrwi	fcsr,0


  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_INT_FP_OP_S( 2,  fcvt.s.w,                   2.0,  2);
  TEST_INT_FP_OP_S( 3,  fcvt.s.w,                  -2.0, -2);

  TEST_INT_FP_OP_S( 4, fcvt.s.wu,                   2.0,  2);
  TEST_INT_FP_OP_S( 5, fcvt.s.wu,           4.2949673e9, -2);

#if __riscv_xlen >= 64
  TEST_INT_FP_OP_S( 6,  fcvt.s.l,                   2.0,  2);
  TEST_INT_FP_OP_S( 7,  fcvt.s.l,                  -2.0, -2);

  TEST_INT_FP_OP_S( 8, fcvt.s.lu,                   2.0,  2);
  TEST_INT_FP_OP_S( 9, fcvt.s.lu,          1.8446744e19, -2);
#endif

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
