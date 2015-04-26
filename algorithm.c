//
// Created by vka on 26.04.15.
//

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "algorithm.h"

vehicle_class algorithm2(data_vector_t *vector) {

    unsigned OFFSET_NUM = 50;

    remove_offset(vector, OFFSET_NUM);


    return INVALID;
}

static void remove_offset(data_vector_t *vector, unsigned num) {
    if (num == 0) {
        fputs("Ilość próbek do usuwania offsetu musi być większa od 0!\n",
                stderr);
        exit(EINVAL);
    }

    if (num > vector->length) {
        fputs("Ilość próbek do usuwania offsetu musi być mniejsza od długości wektora!\n",
              stderr);
        exit(EINVAL);

    }

    /*
     * deklaracja tablicy zawierającej offsety dla poszczególnych wektorów
     */
    double offsets[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};


    data_node_t * n = vector->head;
    for(unsigned i = 0; i < num; i++) {
        for(unsigned j = 1; j < 13; j++) {
            offsets[j - 1] += n->cell->data[j];
        }
        n = n->next;
    }

    //wyznaczenie ostatenczej wartości offsetu dla każdego wektora
    for(int i = 0; i < 13; i++) offsets[i] /= num;

    //przesunięcie wszystkich wartości w wektorze o zadany offset

    n = vector->head;
    for(unsigned i = 0; i < vector->length; i++) {
        for(unsigned j = 1; j < 13; j++) {
             n->cell->data[j] -= offsets[j - 1];
        }
        n = n->next;
    }
}