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

void version();

void handle_output(vehicle_data_t, bool, bool, char *);

bool is_verbosity_at_least(verb_level v);

void load_sensor_configuration(const char *);

bool string_starts_with(const char *, const char *);

bool is_between(const double val, const double from, const double to);

#endif //INZYNIER_FUNCTIONS_H
