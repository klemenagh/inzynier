//
// Created by vka on 20.04.15.
//
#ifndef INZYNIER_STRUCTURES_H
#define INZYNIER_STRUCTURES_H

#include <stdbool.h>

typedef enum VERBOSITY_LEVEL {
    QUIET = 0,
    RELEASE = 1,
    DEBUG = 2,
    ALL = 3
} verb_level;

int verbosity_level;

struct sensor_configuration {
    double sensor_long_position;
    double sensor_short_position;
    double piezo1_position;
    double piezo2_position;

    double sensor_long_length;
    double sensor_short_length;

    double total_length;

    double r_x_factor;
} sensor_configuration;

/*
 * enumerator wykorzystywany do zwiększenia czytelności
 */
typedef enum data_field {
    DATA_T,
    DATA_X_LONG,
    DATA_R_LONG,
    DATA_X_SHORT,
    DATA_R_SHORT,
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
    unsigned piezo_axles;   // liczba osi zliczona przy pomocy piezo (tylko jeśli wywołana była opcja weryfikacji!)
    double lengths[7];
    double piezo_lengths[4];// odległości pomiędzy poszczególnymi osiami (tylko jeśli wywołana była weryfikacja piezo)
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
 *  2,3     pętla 1-metrowa (wykorzystywana do badania długości pojazdu)
 *  4,5     pętla 0.1-metrowa (wykorzystywana do badania liczby i położenia osi)
 *  6,7     dane z piezo 1 i 2 (wykorzystywane do weryfikacji i wyznaczania prędkości
 */
typedef struct data_cell {
    double data[7]; // dane ładowane ze strumienia
} data_cell_t;

typedef struct data_vector {
    data_cell_t *vector;
    unsigned size;
    unsigned capacity;
} data_vector_t;

data_vector_t *init_data_vector();

void pushback_data(data_vector_t *, double data[7]);

void resize_vector(data_vector_t *);

void clear_data_vector(data_vector_t *);

void free_data_vector(data_vector_t *);

#endif //INZYNIER_STRUCTURES_H
