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

data_cell_t *create_data_cell(double data[13]) {
    data_cell_t *d = malloc(sizeof(data_cell_t));

    if (d == NULL) exit(ENOMEM); //not enough memory

    for (int i = 0; i < 13; i++) d->data[i] = data[i];

    return d;
}

data_node_t *pushback_data_cell(data_vector_t *v, data_cell_t *c) {
    if (v == NULL || c == NULL) exit(EFAULT);

    data_node_t *n = malloc(sizeof(data_node_t));
    if (n == NULL) exit(ENOMEM); //not enough memory
    n->cell = c;
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

data_node_t * pushback_data(data_vector_t* v, double data[13]) {
    return pushback_data_cell(v, create_data_cell(data));
}

data_cell_t *popfront_data_cell(data_vector_t *v) {
    if (v == NULL) exit(EINVAL); //bad vector

    if (v->length == 0) return NULL;

    data_node_t *n = v->head;
    data_cell_t *c = n->cell;

    if (v->length > 2) {
        v->head = v->head->next;
    }
    else if (v->length == 2) {
        v->head = v->head->next;
        v->tail = v->head;
        v->head->next = v->head;
    }
    else {
        v->head = NULL;
        v->tail = NULL;
    }

    v->length--;
    free(n);

    return c;
}

void clear_data_vector(data_vector_t *vector) {
    //removes all entries from given vector

    if(vector->length == 0) return;

    data_cell_t * cell;
    while(vector->length != 0) {
        cell = popfront_data_cell(vector);
        if(cell != NULL) free(cell);
    }
}

void print_data_vector(data_vector_t *v, bool verbose) {
    printf("VECTOR\n");
    if(v == NULL) {
        printf("Pusty wskaźnik na wektor.\n");
        return;
    }

    printf("Wskaźnik: %x, \t długość: %d\n", v, v->length);
    if(verbose) {
        data_node_t *n = v->head;
        int i = 0;
        while (i++ < v->length) {
            print_data_node(n);
            n = n->next;
        }
    }
}

void print_data_node(data_node_t * n) {
    printf("NODE\n");
    if(n == NULL) {
        printf("Pusty wskaźnik na węzeł.\n");
        return;
    }

    printf("Wskaźnik: %x\nDane:\n", n);
    for(int i = 0; i < 13; i++) {
        printf("%f ", n->cell->data[i]);
    }
    printf("\n");

}