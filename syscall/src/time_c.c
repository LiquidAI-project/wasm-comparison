#include <time.h>
#include <stdio.h>

int main() {
    time_t t = time(NULL);
    for (int i = 0; i < 100; i++) {
        time_t t = time(NULL);
    }
    printf("time: %ld\n", t);
}
