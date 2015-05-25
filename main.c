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
    bool check_lengths = false;

    char *filename = NULL;
    int c;

    while ((c = getopt(argc, argv, "f:dvqch")) != -1) {
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
            case 'd':
                check_lengths = true;
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

    vehicle_data_t vehicle = algorithm2(data, verify, check_lengths);

    if (verbosity_level != QUIET) {
        switch (vehicle.class) {
            case POJAZD_2OS:
                printf("2");
                break;
            case POJAZD_3OS:
                printf("3");
                break;
            case POJAZD_4OS:
                printf("4");
                break;
            case POJAZD_5OS:
                printf("5");
                break;
            case POJAZD_5OS_UP:
                printf("5up");
                break;
            case INVALID:
            default:
                printf("error");
                break;
        }
        if (check_lengths) {
            const unsigned num_axles =
                    (vehicle.class == POJAZD_5OS_UP) ? 5
                                                     : (unsigned) vehicle.class;
            for (unsigned i = 0; i <= num_axles + 1; i++) {
                printf(" %f", vehicle.lengths[i]);
            }
        }
        printf("\n");
    }

    if (verify) {
        puts(vehicle.piezo == (unsigned) vehicle.class ? "piezo ok"
                                                       : "piezo error");
    }
    clear_data_vector(data);

    return EXIT_SUCCESS;
}