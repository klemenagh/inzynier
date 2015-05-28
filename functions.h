//
// Created by vka on 20.04.15.
//
#ifndef INZYNIER_FUNCTIONS_H
#define INZYNIER_FUNCTIONS_H

#include "structures.h"

bool read_file(char *, data_vector_t *);

bool read_stdin(data_vector_t *);

bool read_stream(FILE *, data_vector_t *);

void usage(int);

void handle_output(vehicle_data_t, bool, bool, char *);

bool is_verbosity_at_least(verb_level v);

#endif //INZYNIER_FUNCTIONS_H
