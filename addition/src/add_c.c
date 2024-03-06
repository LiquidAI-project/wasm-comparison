#include <stdio.h>
#include <time.h>
int main()
{
    struct timespec start, end;
    unsigned long timeElapsed;
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (int i = 0; i < 10000; i++)
    {
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    timeElapsed = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    printf("%lu\n", timeElapsed);
}