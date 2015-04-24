//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <errno.h>

void usage() {
    printf("Usage: program [-f filename]\n-f\t Read data from given file.\n");
}

bool read_file(char *filename, data_vector_t *vector) {
    if (filename == NULL) {
        printf("Null filename given");
        return false;
    }

    if (vector->length != 0) clear_data_vector(vector);

    FILE *f = fopen(filename, "r");

    if (f == NULL) {
        printf("Invalid filename given: %s\n", filename);
        return false;
    }

    double data[13];
    char buffer[160];
    int i;
    while (fgets(buffer, sizeof(buffer), f)) {
        for (i = 0; i < 13; i++) {
            if (sscanf(buffer, "%lf", &data[i]) != 1) {
                printf("Bad data format (value expected but not given)\n");
                exit(EIO);
            }
        }
        pushback_data(vector, data);
    }

    return true;
}

bool read_stdin(data_vector_t *vector) {

    if (vector->length != 0) clear_data_vector(vector);

    double data[13];
    char buffer[160];
    int i;
    while (fgets(buffer, sizeof(buffer), stdin)) {
        for (i = 0; i < 13; i++) {
            if (sscanf(buffer, "%lf", &data[i]) != 1) {
                printf("Bad data format (value expected but not given)\n");
                exit(EIO);
            }
        }
        pushback_data(vector, data);
    }

    return true;
}