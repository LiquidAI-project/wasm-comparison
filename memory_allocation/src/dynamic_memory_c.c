#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Node {
    int data;
    struct Node *next;
};

int main() {
    struct timespec start, end;
    unsigned long timeElapsed;
    clock_gettime(CLOCK_MONOTONIC, &start);
    struct Node *head = (struct Node *)malloc(sizeof(struct Node));
    head->data = 0;
    head->next = NULL;
    struct Node *tail = head;
    for (int i = 0; i < 50000; i++) {
        struct Node *node = (struct Node *)malloc(sizeof(struct Node));
        node->data = i;
        node->next = NULL;
        tail->next = node;
        tail = node;
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    timeElapsed = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
    printf("%lu\n", timeElapsed);
    return 0;
}