//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <errno.h>
#include <string.h>

void usage(int exit_status) {
    if (exit_status == EXIT_FAILURE) {
        printf("Wywołaj program z opcją -h by uzyskać pomoc.\n");
    }
    else {
        printf("Użycie: program [-f nazwa] [-v] [-q]\n\
-f\tOdczyt z pliku o podanej nazwie. W przeciwnym razie, odczyt następuje\n\
\tze strumienia wejściowego stdin.\n\
-v\tWyświetlaj wyjście ułatwiające debugowanie.\n\
-d\tWyświetl wyjście związane z długościami w pojeździe.\n\
-q\tNie wyświetlaj wyjścia na ekran. (może być użyteczna, gdy zapis\n\
\tnastępuje do pliku).\n\
-h\tWywołaj pomoc dla programu.\n");
    }
    exit(exit_status);
}

bool read_file(char *filename, data_vector_t *vector) {
    if (filename == NULL) {
        fputs("Pusta nazwa pliku.\n", stderr);
        return false;
    }

    FILE *f = fopen(filename, "r");

    if (f == NULL) {
        fputs("Podano błędną nazwę pliku.\n", stderr);
        return false;
    }

    return read_stream(f, vector);
}

bool read_stdin(data_vector_t *vector) {

    return read_stream(stdin, vector);
}

bool read_stream(FILE *s, data_vector_t *vector) {

    if (vector->length != 0) {
        clear_data_vector(vector);
        vector = init_data_vector();
    }

    double data[13];
    char buffer[160];
    char *splitted;
    while (fgets(buffer, sizeof(buffer), s)) {
        splitted = strtok(buffer, " \t");
        for (int i = 0; i < 13; i++) {
            if (splitted == NULL) {
                fputs("Błędny format danych (oczekiwano wartości, napotkano znak końca linii).\n",
                      stderr);
                exit(EIO);
            }

            data[i] = strtod(splitted, NULL);

            if (i < 12) splitted = strtok(NULL, " \t");
        }

        pushback_data(vector, data);
    }

    fclose(s);

    return true;
}