//
// Created by vka on 20.04.15.
//

#include "structures.h"
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>

data_vector_t *init_data_vector() {
    data_vector_t *v;
    v = malloc(sizeof(data_vector_t));
    if (v == NULL) exit(ENOMEM); //not enough memory
    v->head = 0;
    v->tail = 0;
    v->length = 0;

    return v;
}

data_cell_t *pushback_data(data_vector_t *v, double data[13]) {
    if (v == NULL) exit(EFAULT);

    data_cell_t *n = malloc(sizeof(data_cell_t));

    for (int i = 0; i < 13; i++) n->data[i] = data[i];

    if (n == NULL) exit(ENOMEM); //not enough memory
    n->next = NULL;
    if (v->head == NULL) {
        v->head = n;
        v->tail = n;
        n->next = n;
    }
    else {
        v->tail->next = n;
        v->tail = n;
    }
    v->length++;

    return n;
}

void clear_data_vector(data_vector_t *vector) {
    //removes all entries from given vector

    if (vector->length == 0) return;

    data_cell_t *n = vector->head;
    data_cell_t *b = NULL;
    while (n != NULL) {
        b = n;
        n = n->next;
        free(b);
    }

    free(vector);
    vector = NULL;
}

void print_data_vector(data_vector_t *v, bool verbose, bool pure) {
    if (!pure) printf("VECTOR\n");
    if (v == NULL) {
        printf("Pusty wskaźnik na wektor.\n");
        return;
    }

    if (!pure) printf("Wskaźnik: %p, \t długość: %d\n", v, v->length);
    if (verbose) {
        data_cell_t *n = v->head;
        unsigned i = 0;
        while (i++ < v->length) {
            print_data_node(n, pure);
            n = n->next;
        }
    }
}

void print_data_node(data_cell_t *n, bool pure) {
    if (!pure)printf("NODE\n");
    if (n == NULL) {
        printf("Pusty wskaźnik na węzeł.\n");
        return;
    }

    if (!pure) printf("Wskaźnik: %p\nDane:\n", n);
    for (int i = 0; i < 13; i++) {
        printf("%f\t", n->data[i]);
    }
    printf("\n");

}