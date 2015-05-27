//
// Created by vka on 20.04.15.
//
#ifndef INZYNIER_STRUCTURES_H
#define INZYNIER_STRUCTURES_H

#include <stdbool.h>

typedef enum VERBOSITY_LEVEL {
    QUIET,
    RELEASE,
    DEBUG
} verb_level;

int verbosity_level;

/*
 * enumerator wykorzystywany do zwiększenia czytelności
 * przy dostępie do pól data_cell_t_old
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
} data_field_t;

/*
 * klasy pojazdów
 */
typedef enum vehicle_class {
    INVALID = 1,
    POJAZD_5OS = 5,
    POJAZD_5OS_UP = 6,
    POJAZD_4OS = 4,
    POJAZD_3OS = 3,
    POJAZD_2OS = 2,
} vehicle_class;

typedef struct vehicle_data {
    vehicle_class class;    // zawiera informacje na temat klasy pojazdu
    double velocity;        // prędkość pojazdu
    unsigned piezo;         // liczba osi zliczona przy pomocy piezo (tylko jeśli wywołana była opcja weryfikacji!)
    double lengths[7];
    /*
     * pola w zmiennej lengths:
     *  0   długość pojazdu
     *  1   odległość 1. osi od początku pojazdu
     *  ilość_osi + 1   odległość ostatniej osi od końca pojazdu
     *  2-5 ilość_osi - 1 pól informujących o odległości pomiędzy dwoma kolejnymi osiami.
     */
} vehicle_data_t;


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
    double data[13]; // dane ładowane ze strumienia

    struct data_cell *next;
} data_cell_t;

/*
 * tablice trim_front oraz trim_back przechowują wartości ilości próbek, do
 * jakiej należy obciąć dane dla odowiednio:
 * 0 - czujnik 1m
 * 1 - czujnik 0.5m
 * 2 - czujnik 0.3m
 * 3 - czujnik 3m
 * 4 - czujnik 0.1m
 * 5 - piezo 1
 * 6 - piezo 2
 *
 * //wartość trim_back jest identyczna dla wszystkich czujników
 */
typedef struct data_vector {
    data_cell_t *head;
    data_cell_t *tail;
    unsigned length;

    unsigned trim_front[7];
    unsigned trim_back;
} data_vector_t;

data_vector_t *init_data_vector();

data_cell_t *pushback_data(data_vector_t *, double data[13]);

void clear_data_vector(data_vector_t *);

void print_data_vector(data_vector_t *, bool, bool);

void print_data_node(data_cell_t *, bool);

#endif //INZYNIER_STRUCTURES_H
