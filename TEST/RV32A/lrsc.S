#include "riscv_test.h"
#include "test_macros.h"

#
# Test LR/SC instructions.
#

# get a unique core id
la a0, coreid
li a1, 1
amoadd.w a2, a1, (a0)

# for now, only run this on core 0
1:li a3, 1
bgeu a2, a3, 1b

1: lw a1, (a0)
bltu a1, a3, 1b

# make sure that sc without a reservation fails.
TEST_CASE( 2, a4, 1, \
  la a0, foo; \
  sc.w a4, x0, (a0); \
)

# make sure that sc with the wrong reservation fails.
# TODO is this actually mandatory behavior?
TEST_CASE( 3, a4, 1, \
  la a0, foo; \
  la a1, fooTest3; \
  lr.w a1, (a1); \
  sc.w a4, a1, (a0); \
)

# make sure that sc-after-successful-sc fails.
TEST_CASE( 5, a1, 1, \
  la a0, foo; \
1:lr.w a1, (a0); \
  sc.w a1, x0, (a0); \
  bnez a1, 1b; \
  sc.w a1, x0, (a0)
)

TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

coreid: .word 0
barrier: .word 0
foo: .word 0
.skip 1024
fooTest3: .word 0
RVTEST_DATA_END
