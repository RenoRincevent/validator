#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32UF

#if __riscv_xlen == 32
    # Replace the function with the 32-bit variant defined in test_macros.h
    #undef TEST_FP_OP3_D
    #define TEST_FP_OP3_D TEST_FP_OP3_D32
#endif

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_FP_OP3_D( 2,  fmadd.d, 0,                 3.5,  1.0,        2.5,        1.0 );
  TEST_FP_OP3_D( 3,  fmadd.d, 1,  1236.1999999999999, -1.0,    -1235.1,        1.1 );
  TEST_FP_OP3_D( 4,  fmadd.d, 0,               -12.0,  2.0,       -5.0,       -2.0 );

  TEST_FP_OP3_D( 5, fnmadd.d, 0,                -3.5,  1.0,        2.5,        1.0 );
  TEST_FP_OP3_D( 6, fnmadd.d, 1, -1236.1999999999999, -1.0,    -1235.1,        1.1 );
  TEST_FP_OP3_D( 7, fnmadd.d, 0,                12.0,  2.0,       -5.0,       -2.0 );

  TEST_FP_OP3_D( 8,  fmsub.d, 0,                 1.5,  1.0,        2.5,        1.0 );
  TEST_FP_OP3_D( 9,  fmsub.d, 1,                1234, -1.0,    -1235.1,        1.1 );
  TEST_FP_OP3_D(10,  fmsub.d, 0,                -8.0,  2.0,       -5.0,       -2.0 );

  TEST_FP_OP3_D(11, fnmsub.d, 0,                -1.5,  1.0,        2.5,        1.0 );
  TEST_FP_OP3_D(12, fnmsub.d, 1,               -1234, -1.0,    -1235.1,        1.1 );
  TEST_FP_OP3_D(13, fnmsub.d, 0,                 8.0,  2.0,       -5.0,       -2.0 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
