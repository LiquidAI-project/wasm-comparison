#include <stdio.h>
#include <stdlib.h>

int main() {
    int *data = malloc(1024 * 1024); 
    if (data == NULL) {
        fprintf(stderr, "Memory allocation failed!\n");
        return 1;
    }
    data[0] = 5;            
    data[1024] = 10;  
    data[1024 * 1023] = 15;
    free(data);
    return 0;
}
