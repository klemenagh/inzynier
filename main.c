#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <getopt.h>

#include "structures.h"
#include "functions.h"
#include "algorithm.h"

extern int verbosity_level;

int main(int argc, char **argv) {

    verbosity_level = RELEASE; // debug

    //parse args
    bool read_from_file = 0;
    bool verify = false;
    char *filename = NULL;
    int c;

    while ((c = getopt(argc, argv, "f:vqch")) != -1) {
        switch (c) {
            case 'f':
                read_from_file = 1;
                filename = optarg;
                break;
            case 'v':
                verbosity_level = DEBUG;
                break;
            case 'q':
                verbosity_level = QUIET;
                break;
            case 'c':
                verify = true;
                break;
            case '?':
            case 'h':
                usage(EXIT_SUCCESS);
            default:
                usage(EXIT_FAILURE);
                abort();
        }
    }
    if (read_from_file && verbosity_level == DEBUG) {
        fputs("Odczyt z pliku: ", stderr);
        fputs(filename, stderr);
        fputs("\n", stderr);
    }
    else if (verbosity_level == DEBUG) {
        fputs("Odczyt z stdin.\n", stderr);
    }
    data_vector_t *data = init_data_vector();

    if ((read_from_file && read_file(filename, data))
        || (!read_from_file && read_stdin(data))) {
        if (verbosity_level == DEBUG) fputs("Załadowano dane.\n", stderr);
    }
    else {
        if (verbosity_level != QUIET) fputs("Błąd w czasie odczytu.\n", stderr);
    }

    print_data_vector(data, false, true);

    vehicle_class class = algorithm2(data, verify);

    if (verbosity_level != QUIET) {
        switch (class) {
            case POJAZD_2OS:
                puts("2");
                break;
            case POJAZD_3OS:
                puts("3");
                break;
            case POJAZD_4OS:
                puts("4");
                break;
            case POJAZD_5OS:
                puts("5");
                break;
            case POJAZD_5OS_UP:
                puts("5up");
                break;
            case INVALID:
            default:
                puts("error");
                break;
        }
    }

    clear_data_vector(data);

    return EXIT_SUCCESS;
}