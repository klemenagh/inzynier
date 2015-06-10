//
// Created by vka on 26.04.15.
//


#ifndef INZYNIER_ALGORITHM_H
#define INZYNIER_ALGORITHM_H

#include "structures.h"
#include "functions.h"

/*
 * glówna funkcja odpowiadająca za detekcję ilości osi pojazdu,
 * którego profil przekazany jest przy pomocy argumentu.
 */
vehicle_data_t algorithm2(data_vector_t *, bool, bool);

/*
 * usuwa offset ze składowych wektora
 */
void remove_offset(data_vector_t *, unsigned);

/*
 * funkcja służąca do określenia parametrów ruchu pojazdu
 */
void find_velocity_distance(data_vector_t *, double *, double *);

/*
 * funkcja ogarniczająca zakres danych do istotnych
 */
void trim_data(data_vector_t *, double);

/*
 * funkcja pomocnicza dla trim_data, usuwa zbędne próbki danych dla zadanych parametrów
 */
void trim_values(data_vector_t *, data_field_t, unsigned, unsigned);

/*
 * funkcja ograniczająca rozmiar wektora do wartości okna.
 */
void trim_to_window(data_vector_t *, unsigned);

/*
 * zwraca wartość ilości próbek tablicy o zadanej długości,
 * która ma wartość większą od zadanego progu
 */
unsigned count_compare(double *, unsigned, double);

/*
 * symuluje pracę komparatora i licznika.
 * Otrzymuje na wejściu wskaźnik do tablicy zawierającej przebieg sygnału Ku
 * oraz jej długości wartości progu i histerezy.
 * Na wyjściu zwraca ilość osi.
 * Dodatkowy argument - wskaźnik do tablicy zawierającej położenia osi.
 * Jeśli jest null - ignorowany.
 */
unsigned counter(double *, unsigned, double, double, unsigned *);

/*
 * funkcja wykorzystywana do ustalenia położenia osi oraz długości pojazdu
 */
void find_lengths(data_vector_t *, unsigned[5], vehicle_data_t *);

/*
 * funkcja analogiczna do powyższej, służąca do wyznaczenia odległości pomiędzy osiami na podstawie odczytów piezo
 */
void find_lengths_piezo(data_vector_t *, unsigned[5], vehicle_data_t *);

#endif //INZYNIER_ALGORITHM_H

