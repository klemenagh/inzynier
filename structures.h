//
// Created by vka on 20.04.15.
//
#ifndef INZYNIER_STRUCTURES_H
#define INZYNIER_STRUCTURES_H

#include <stdbool.h>

typedef struct data_cell {
    double data[8];
} data_cell_t;

typedef struct data_node {
    data_cell_t *cell;

    struct data_node *next;
} data_node_t;

typedef struct data_vector {
    data_node_t *head;
    data_node_t *tail;
    unsigned length;
} data_vector_t;

data_vector_t *init_data_vector();

data_cell_t *create_data_cell(double data[8]);

data_node_t *pushback_data_cell(data_vector_t *, data_cell_t *);

data_cell_t *popfront_data_cell(data_vector_t *);

#endif //INZYNIER_STRUCTURES_H
