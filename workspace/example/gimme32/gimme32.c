#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#define MAX_SIZE 0x1000

int main() {
    void *rwx_map = mmap(NULL, MAX_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
    if (rwx_map == MAP_FAILED) {
        return -1;
    }

    write(STDOUT_FILENO, "Gimme size: ", strlen("Gimme size: "));
    size_t bytes_to_read = 0;
    ssize_t bytes_read = read(STDIN_FILENO, &bytes_to_read, sizeof(bytes_to_read));
    if (bytes_read != sizeof(bytes_to_read) || bytes_to_read > MAX_SIZE) {
        return -1;
    }

    write(STDOUT_FILENO, "Gimme code: ", strlen("Gimme code: "));
    bytes_read = read(STDIN_FILENO, rwx_map, bytes_to_read);
    if (bytes_read != bytes_to_read) {
        return -1;
    }

    if (memcmp(rwx_map, "H@CK", 4) == 0) {
        write(STDOUT_FILENO, "Running...\n", strlen("Running...\n"));
        ((void (*)())rwx_map)();
    }
    write(STDOUT_FILENO, "Bye.\n", strlen("Bye.\n"));

    return 0;
}
