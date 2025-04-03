#include <stdio.h>

#ifndef VERSION
#define VERSION "0.0.0"
#endif

int main() {
    printf("Build Version: %s\n", VERSION);
    return 0;
}