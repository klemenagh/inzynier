//
// Created by vka on 20.04.15.
//

#include "structures.h"
#include <stdlib.h>
#include <errno.h>
#include <string.h>

data_vector_t *init_data_vector() {
    const unsigned initial_size = 4;
    data_vector_t *v;
    v = (data_vector_t *) malloc(sizeof(data_vector_t));
    if (v == NULL) exit(ENOMEM); //błąd alokacji

    v->vector = (data_cell_t *) malloc(initial_size * sizeof(data_cell_t));
    if (v->vector == NULL) exit(ENOMEM); //błąd alokacji

    v->size = 0;
    v->capacity = initial_size;

    return v;
}

void pushback_data(data_vector_t *v, double data[13]) {
    if (v == NULL) exit(EFAULT);

    if (v->size == v->capacity) resize_vector(v);
    for (int i = 0; i < 13; i++) v->vector[v->size].data[i] = data[i];

    v->size++;
}

void resize_vector(data_vector_t *v) {
    const double resize_factor = 1.5;
    unsigned new_capacity = (unsigned) (v->capacity * resize_factor);

    v->vector = (data_cell_t *) realloc(v->vector,
                                        new_capacity * sizeof(data_cell_t));
    memset(v->vector + v->capacity, 0, (new_capacity - v->capacity) * sizeof(data_cell_t));
    if (v->vector == NULL) exit(ENOMEM);
    v->capacity = new_capacity;
}

void clear_data_vector(data_vector_t *vector) {
    vector->size = 0;
}

void free_data_vector(data_vector_t *vector) {
    // uwolnij zaalokowane zasoby

    if (vector == NULL || vector->capacity == 0) return;

    if (vector->vector != NULL)
        free(vector->vector);
    free(vector);
}
