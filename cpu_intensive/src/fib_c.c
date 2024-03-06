#include <stdio.h>
#include <time.h>

int fibonacci(int n) {
    if (n <= 1) {
        return n;
    }
    return fibonacci(n-1) + fibonacci(n-2);
}

int main() {
    struct timespec start, end;
    unsigned long timeElapsed;

    clock_gettime(CLOCK_MONOTONIC, &start);
    fibonacci(37);
    clock_gettime(CLOCK_MONOTONIC, &end);

    timeElapsed = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    printf("%lu\n", timeElapsed);
}
