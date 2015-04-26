//
// Created by vka on 20.04.15.
//
#ifndef INZYNIER_STRUCTURES_H
#define INZYNIER_STRUCTURES_H

#include <stdbool.h>

/*
 * enumerator wykorzystywany do zwiększenia czytelności
 * przy dostępie do pól data_cell_t
 */
typedef enum data_field {
    DATA_T,
    DATA_X3,
    DATA_R3,
    DATA_X1,
    DATA_R1,
    DATA_X05,
    DATA_R05,
    DATA_X03,
    DATA_R03,
    DATA_X01,
    DATA_R01,
    DATA_P1,
    DATA_P2
} data_field;

/*
 * klasy pojazdów
 */
typedef enum vehicle_class {
    INVALID,
    CIEZAROWY_5OS,
    CIEZAROWY_5OS_UP,
    CIEZAROWY_4OS,
    CIEZAROWY_3OS,
    CIEZAROWY_2OS,
    DOSTAWCZY,
    OSOBOWY_ALUS,
    OSOBOWY_STAL
} vehicle_class;

/*
 * Kolejność danych w polu data to:
 *  1       czas
 *  2,3     pętla 3-metrowa
 *  4,5     pętla 1-metrowa
 *  6,7     pętla 0.5-metrowa
 *  8,9     pętla 0.3-metrowa
 *  10,11   pętla 0.1-metrowa
 *  12,13   dane z piezo 1 i 2
 */
typedef struct data_cell {
    //dane ładowane ze strumienia
    double data[13];
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

data_cell_t *create_data_cell(double data[13]);

data_node_t *pushback_data_cell(data_vector_t *, data_cell_t *);

data_node_t *pushback_data(data_vector_t *, double data[13]);

data_cell_t *popfront_data_cell(data_vector_t *);

void clear_data_vector(data_vector_t *);

void print_data_vector(data_vector_t *, bool);

void print_data_node(data_node_t *);

#endif //INZYNIER_STRUCTURES_H
