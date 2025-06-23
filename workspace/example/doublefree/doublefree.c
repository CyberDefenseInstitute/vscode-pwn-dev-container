#include <malloc.h>

int main() {
    void *p = malloc(0x18);
    free(p);
    free(p);

    return 0;
}
