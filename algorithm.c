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

    //wyliczenie ilości próbek do obcięcia dla każdej pary czujników
    double velocity = 0; // prędkość w m/s
    double distance = 0; // odległość w m

    find_velocity_distance(vector, &velocity, &distance);

    double sensor_distance; // odległość dla każdej pary czujników
    unsigned trim_front;    // ilość próbek do obcięcia z przodu
    unsigned trim_back;     // ilość próbek do obcięcia na końcu
    const double dt = vector->head->next->data[DATA_T]   // różnica czasów
                      - vector->head->data[DATA_T];     // między próbkami

    // 1m
    sensor_distance = 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[0] = trim_front;

    //0.5m
    sensor_distance += 1 + 0.5;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[1] = trim_front;

    //3m
    sensor_distance += 1 + 0.3;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[2] = trim_front;

    //0.3m
    sensor_distance += 1 + 1.5 + 0.1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[3] = trim_front;

    //0.1m
    sensor_distance += 1.5 + 1 + 1.5;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[4] = trim_front;

    //piezo 1 i 2
    sensor_distance += 1 + 1.5 + 1.1 + 1 + 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[5] = trim_front;

    //piezo 2
    sensor_distance += 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[6] = trim_front;

    //ograniczenie z tylu
    trim_back = (unsigned) (25 / velocity / dt);
    vector->trim_back = trim_back;
    return INVALID;
}

void remove_offset(data_vector_t *vector, unsigned num) {
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

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < num; i++) {
        for (unsigned j = 1; j < 13; j++) {
            offsets[j - 1] += n->data[j];
        }
        n = n->next;
    }

    //wyznaczenie ostatenczej wartości offsetu dla każdego wektora
    for (int i = 0; i < 13; i++) offsets[i] /= num;

    //przesunięcie wszystkich wartości w wektorze o zadany offset
    n = vector->head;
    for (unsigned i = 0; i < vector->length; i++) {
        for (unsigned j = 1; j < 13; j++) {
            n->data[j] -= offsets[j - 1];
        }
        n = n->next;
    }
}

void find_velocity_distance(data_vector_t *vector, double *v, double *d) {
    /*
     * Funkcja wykorzystuje wartości z czujników P1 i P2 wektora danych,
     * a także wektor czasu.
     * parametry v i d odpowiadają za wskaźniki do pamięci, gdzie
     * należy wpisać parametry ruchu
     *
     * Prędkość wyznaczana jest w jednostce m/s.
    */

    /*
     * Definiowanie parametrów
     */

    //zdefiniowanie progów histerezy [V]
    double p1, p2;
    p1 = 3;
    p2 = 2;

    //odległośc pomiędzy czujnikami
    double dist = 1;

    //zmienne
    bool is_impulse1 = false;
    bool is_impulse2 = false;

    unsigned num_impulse1 = 0;
    unsigned num_impulse2 = 0;

    //parametry wykorzystywane do wyliczenia odległości i prędkości
    int index1[2] = {0, 0};
    int index2[2] = {0, 0};

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < vector->length; i++) {

        //piezo 1
        if (n->data[DATA_P1] >= p1 && is_impulse1 == false) {
            is_impulse1 = true;
            num_impulse1 += 1;
            if (num_impulse1 <= 2) index1[num_impulse1 - 1] = i;
        }
        else if (n->data[DATA_P1] < p2 && is_impulse1 == true) {
            is_impulse1 = false;
        }

        //piezo2
        if (n->data[DATA_P2] >= p1 && is_impulse2 == false) {
            is_impulse2 = true;
            num_impulse2 += 1;
            if (num_impulse2 <= 2) index2[num_impulse2 - 1] = i;
        }
        else if (n->data[DATA_P2] < p2 && is_impulse2 == true) {
            is_impulse2 = false;
        }
        n = n->next;
    }

    double t1 = 0; //czas do wyznaczania prędkości
    double t2 = 0; //czas do wyznaczania odległości

    t1 = (index2[0] - index1[0] + index2[1] - index1[1]) / 2;
    t2 = (index1[1] - index1[0] + index2[1] - index2[0]) / 2;

    //konwersja z ms na s
    t1 /= 1000;
    t2 /= 1000;

    *v = dist / t1;
    *d = (*v) * t2;
}