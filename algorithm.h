//
// Created by vka on 26.04.15.
//


#ifndef INZYNIER_ALGORITHM_H
#define INZYNIER_ALGORITHM_H

#include "structures.h"

/*
 * glówna funkcja odpowiadająca za detekcję ilości osi pojazdu,
 * którego profil przekazany jest przy pomocy argumentu.
 *
 * Kolejność operacji:
 * 1) usunięcie offsetu ze wszystkich składowych poza czasem
 */
vehicle_class algorithm2(data_vector_t *);

/*
 * usuwa offset ze składowych wektora
 */
static void remove_offset(data_vector_t *, unsigned);
#endif //INZYNIER_ALGORITHM_H

