#include "riscv_test.h"
#include "test_macros.h"

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2, div,  3,  20,   6 );
  TEST_RR_OP( 3, div, -3, -20,   6 );
  TEST_RR_OP( 4, div, -3,  20,  -6 );
  TEST_RR_OP( 5, div,  3, -20,  -6 );

  TEST_RR_OP( 6, div, -1<<31, -1<<31,  1 );
  TEST_RR_OP( 7, div, -1<<31, -1<<31, -1 );

  TEST_RR_OP( 8, div, -1, -1<<31, 0 );
  TEST_RR_OP( 9, div, -1,      1, 0 );
  TEST_RR_OP(10, div, -1,      0, 0 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN
