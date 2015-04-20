#include <stdio.h>
#include "structures.h"

int main() {
    data_vector_t *v = init_data_vector();

    printf("ptr: 0x%x\nhead: 0x%x\ntail: 0x%x\nlen: %d\n", v, v->head, v->tail, v->length);

    double tmp_d1[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    double tmp_d2[8] = {11, 22, 33, 44, 55, 66, 77, 88};

    data_cell_t *d1 = create_data_cell(tmp_d1);
    data_cell_t *d2 = create_data_cell(tmp_d2);
    printf("ptr: 0x%x\n", d1);
    printf("ptr: 0x%x\n", d2);
    data_node_t * n1 = pushback_data_cell(v, d1);
    data_node_t * n2 = pushback_data_cell(v, d2);
    printf("ptr: 0x%x\n", n1);
    printf("ptr: 0x%x\n", n2);
    printf("ptr: 0x%x\nhead: 0x%x\ntail: 0x%x\nlen: %d\n", v, v->head, v->tail, v->length);

    data_cell_t * d3 = popfront_data_cell(v);
    printf("ptr: 0x%x\n", d3);
    printf("ptr: 0x%x\nhead: 0x%x\ntail: 0x%x\nlen: %d\n", v, v->head, v->tail, v->length);

    data_cell_t * d4 = popfront_data_cell(v);
    printf("ptr: 0x%x\n", d4);
    printf("ptr: 0x%x\nhead: 0x%x\ntail: 0x%x\nlen: %d\n", v, v->head, v->tail, v->length);


    data_cell_t * d5 = popfront_data_cell(v);
    printf("ptr: 0x%x\n", d5);
    printf("ptr: 0x%x\nhead: 0x%x\ntail: 0x%x\nlen: %d\n", v, v->head, v->tail, v->length);



    return 0;
}