#include <stdio.h>
int main() {
    int a = 0;
    for (int i = 0; i < 100000000; i++) {
        a += 3;
    }
    printf("%d\n", a);
}