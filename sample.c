#include "test.h"

int your_test_handle(void) {
  EXPECT_EQ(1, 2); // assertion error

  // return 0 = succed
  // return <non-zero> = failed
  return 0;
}

int always_fail(void) {
  return 1;
}

int test(const char *suite) {
  // registring tests
  TEST_REGISTER(your_test_handle);
  TEST_REGISTER(always_fail);

  // de-registring tests
  //TEST_DEREGISTER(your_test_handle);

  // run tests
  TEST_RUN(your_test_handle);
  //TEST_RUN(always_fail);
  // registered tests that are not run are marked as skipped

  // your exit code
  return 0;
}

