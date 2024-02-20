#include <stdio.h>
#include <unistd.h>
#include <time.h>

int main() {
    for (int i = 0; i < 1000; i++) {
        time(NULL);
    }
    return 0;
}
