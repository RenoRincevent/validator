#include "riscv_test.h"
#include "test_macros.h"

#
# Test fcvt{wu|w}.d instructions.
#

RVTEST_RV32UF

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_FP_INT_OP_D( 2,  fcvt.w.d, 0x01,         -1, -1.1, rtz);
  TEST_FP_INT_OP_D( 3,  fcvt.w.d, 0x00,         -1, -1.0, rtz);
  TEST_FP_INT_OP_D( 4,  fcvt.w.d, 0x01,          0, -0.9, rtz);
  TEST_FP_INT_OP_D( 5,  fcvt.w.d, 0x01,          0,  0.9, rtz);
  TEST_FP_INT_OP_D( 6,  fcvt.w.d, 0x00,          1,  1.0, rtz);
  TEST_FP_INT_OP_D( 7,  fcvt.w.d, 0x01,          1,  1.1, rtz);
  TEST_FP_INT_OP_D( 8,  fcvt.w.d, 0x10,     -1<<31, -3e9, rtz);
  TEST_FP_INT_OP_D( 9,  fcvt.w.d, 0x10,  (1<<31)-1,  3e9, rtz);

  TEST_FP_INT_OP_D(12, fcvt.wu.d, 0x10,          0, -3.0, rtz);
  TEST_FP_INT_OP_D(13, fcvt.wu.d, 0x10,          0, -1.0, rtz);
  TEST_FP_INT_OP_D(14, fcvt.wu.d, 0x01,          0, -0.9, rtz);
  TEST_FP_INT_OP_D(15, fcvt.wu.d, 0x01,          0,  0.9, rtz);
  TEST_FP_INT_OP_D(16, fcvt.wu.d, 0x00,          1,  1.0, rtz);
  TEST_FP_INT_OP_D(17, fcvt.wu.d, 0x01,          1,  1.1, rtz);
  TEST_FP_INT_OP_D(18, fcvt.wu.d, 0x10,          0, -3e9, rtz);
  TEST_FP_INT_OP_D(19, fcvt.wu.d, 0x00, 0xffffffffb2d05e00, 3e9, rtz);


  # test negative NaN, negative infinity conversion
  TEST_CASE(42, x1, 0x000000007fffffff, la x1, tdat_d; fld f1,  0(x1); fcvt.w.d x1, f1)
  TEST_CASE(44, x1, 0xffffffff80000000, la x1, tdat_d; fld f1, 16(x1); fcvt.w.d x1, f1)

  # test positive NaN, positive infinity conversion
  TEST_CASE(52, x1, 0x000000007fffffff, la x1, tdat_d; fld f1,  8(x1); fcvt.w.d x1, f1)
  TEST_CASE(54, x1, 0x000000007fffffff, la x1, tdat_d; fld f1, 24(x1); fcvt.w.d x1, f1)

  # test NaN, infinity conversions to unsigned integer
  TEST_CASE(62, x1, 0xffffffffffffffff, la x1, tdat_d; fld f1,  0(x1); fcvt.wu.d x1, f1)
  TEST_CASE(63, x1, 0xffffffffffffffff, la x1, tdat_d; fld f1,  8(x1); fcvt.wu.d x1, f1)
  TEST_CASE(64, x1,                  0, la x1, tdat_d; fld f1, 16(x1); fcvt.wu.d x1, f1)
  TEST_CASE(65, x1, 0xffffffffffffffff, la x1, tdat_d; fld f1, 24(x1); fcvt.wu.d x1, f1)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

# -NaN, NaN, -inf, +inf
tdat:
.word 0xffffffff
.word 0x7fffffff
.word 0xff800000
.word 0x7f800000

tdat_d:
.dword 0xffffffffffffffff
.dword 0x7fffffffffffffff
.dword 0xfff0000000000000
.dword 0x7ff0000000000000

RVTEST_DATA_END
