#include "unity.h"
#include "mathlib.h"

void setUp(void) {}
void tearDown(void) {}

void test_mathlib_add(void) {
    TEST_ASSERT_EQUAL_INT(5, mathlib_add(2, 3));
    TEST_ASSERT_EQUAL_INT(0, mathlib_add(-2, 2));
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_mathlib_add);
    return UNITY_END();
}
