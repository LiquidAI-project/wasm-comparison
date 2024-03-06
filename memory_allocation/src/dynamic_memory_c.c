#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    struct timespec start, end;
    unsigned long timeElapsed;
    int *data = NULL;
    int i;
    clock_gettime(CLOCK_MONOTONIC, &start);
    for(i = 0; i < 10000; i++) {
        data = realloc(data, (i + 1) * sizeof(int)); 
        data[i] = i;            
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    timeElapsed = (end.tv_sec - start.tv_sec) * 1e9;
    timeElapsed = (end.tv_nsec - start.tv_nsec) + timeElapsed;
    printf("%lu\n", timeElapsed);
    free(data);
    return 0;
}