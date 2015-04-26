#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <getopt.h>

#include "structures.h"
#include "functions.h"
#include "algorithm.h"

int main(int argc, char **argv) {

    //parse args
    bool read_from_file = 0;
    char *filename = NULL;
    int c;

    while ((c = getopt(argc, argv, "f:h")) != -1) {
        switch (c) {
            case 'f':
                read_from_file = 1;
                filename = optarg;
                break;
            case '?':
            case 'h':
                usage(EXIT_SUCCESS);
            default:
                usage(EXIT_FAILURE);
                abort();
        }
    }
    if (read_from_file) {
        fputs("Odczyt z pliku: ", stderr);
        fputs(filename, stderr);
        fputs("\n", stderr);
    }
    else {
        fputs("Odczyt z stdin.\n", stderr);
    }
    data_vector_t *data = init_data_vector();

    if ((read_from_file && read_file(filename, data))
        || (!read_from_file && read_stdin(data))) {
        fputs("Załadowano dane.\n", stderr);
    }
    else {
        fputs("Błąd w czasie odczytu.\n", stderr);
    }

    print_data_vector(data, true);

    printf("Typ pojazdu: %d\n", algorithm2(data));

    return EXIT_SUCCESS;
}