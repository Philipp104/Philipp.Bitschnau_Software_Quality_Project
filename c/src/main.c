#include <stdio.h>
#include "mathlib.h"

int main(void) {
    int result = mathlib_add(2, 3);
    printf("2 + 3 = %d\n", result);
    return 0;
}
