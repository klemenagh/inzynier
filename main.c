#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <getopt.h>

#include "structures.h"
#include "functions.h"

int main(int argc, char **argv) {
    printf("argc: %d\n", argc);
    //parse args
    bool read_from_file = 0;
    char *filename = NULL;
    int c;

    while ((c = getopt(argc, argv, "f:")) != -1) {
        switch (c) {
            case 'f':
                read_from_file = 1;
                filename = optarg;
                break;
            case '?':
            default:
                usage();
                abort();
        }
    }
    printf("%d\n", read_from_file);
    if(read_from_file) printf("%s\n", filename);

    data_vector_t * data = init_data_vector();

    if(read_from_file) {
        if(read_file(filename, data))
        {
            printf("Successfull read\n");
        }
        else {
            printf("Error while reading file\n");
        }
    }
    else read_stdin(data);

    print_data_vector(data, false);


/*     data_vector_t *v = init_data_vector();

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


 */
    return 0;
}