//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <errno.h>
#include <string.h>

void usage(int exit_status) {
    if (exit_status == EXIT_FAILURE) {
        printf("Try -h for usage.\n");
    }
    else {
        printf("Usage: program [-f filename]\n\
-f\t Read data from given file.\n\
-h\t Show this usage message.\n");
    }
    exit(exit_status);
}

bool read_file(char *filename, data_vector_t *vector) {
    if (filename == NULL) {
        fputs("Null filename given\n", stderr);
        return false;
    }

    if (vector->length != 0) clear_data_vector(vector);

    FILE *f = fopen(filename, "r");

    if (f == NULL) {
        fputs("Invalid filename given\n", stderr);
        return false;
    }

    return read_stream(f, vector);
}

bool read_stdin(data_vector_t *vector) {

    if (vector->length != 0) clear_data_vector(vector);

    return read_stream(stdin, vector);
}

static bool read_stream(FILE *s, data_vector_t *vector) {

    double data[13];
    char buffer[160];
    char *splitted;
    int i;
    while (fgets(buffer, sizeof(buffer), s)) {
        splitted = strtok(buffer, " \t");
        for (int i = 0; i < 13; i++) {
            if (splitted == NULL) {
                fputs("Bad data format (value expected but not given)\n", stderr);
                exit(EIO);
            }

            data[i] = strtod(splitted, NULL);

            if (i < 12) splitted = strtok(NULL, " \t");
        }

        pushback_data(vector, data);
    }

    fclose(s);

    return true;
}