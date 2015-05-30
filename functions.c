//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <errno.h>
#include <string.h>

char output_filename[80];

void usage(int exit_status) {
    if (exit_status == EXIT_FAILURE) {
        printf("Wywołaj program z opcją -h by uzyskać pomoc.\n");
    }
    else {
        printf("Użycie: axles [-d] [-p] [-v] [-q] [-a] [plik1 plik2 ...] \
[-o output_file]\n\n\
W przypadku nie podania żadnej nazwy pliku, odczyt odbywa się ze strumienia\n\
wejściowego.\n\nArgumenty wejścia:\n\n\
-d --debug\tWyświetlaj wyjście ułatwiające debugowanie.\n\
-a --all\tWyświetlaj jeszcze więcej informacji na wyjście.\n\
-p --positions\tWyświetl wyjście związane z długościami w pojeździe.\n\
-v --verify\tSprawdź wynik z sygnałami piezo.\n\
-q --quiet\tNie wyświetlaj wyjścia na ekran. (może być użyteczna, gdy zapis\n\
\t\tnastępuje do pliku).\n\
-o --output\tZapisuje wyniki działania algorytmu do podanego pliku. Zawartość\n\
\t\tpliku nie jest usuwana, dane są dopisywane na końcu pliku.\n\
-h\t\tWywołaj pomoc dla programu.\n");
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
        if (buffer[0] == '\n')
            break; //zakładam, że pusta linia oznacza koniec danych dla jednego pojazdu
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
        if (data[0] == 0 && vector->length > 0) {//dane kolejnego pojazdu
            //for(unsigned j = 0; buffer[j] != '\0'; j++) ungetc(buffer[j], s);
            // bez powyższej linii gubiona jest pierwsza próbka - która i tak
            // prawdopodobnie nie zawiera istotnych informacji. Nie udało się
            // napisać kodu który zwracałby pełną linię do strumienia.
            return true;
        }

        pushback_data(vector, data);
    }
    if (s != stdin) fclose(s);

    return true;
}

void handle_output(vehicle_data_t vehicle, bool piezo_verify,
                   bool compute_positions, char *filename) {
    char str[160] = "";
    char position_data[20];
    if (filename != NULL) strcat(str, filename);
    else strcat(str, "stdin");
    switch (vehicle.class) {
        case
            POJAZD_2OS:
            strcat(str, " 2");
            break;
        case
            POJAZD_3OS:
            strcat(str, " 3");
            break;
        case
            POJAZD_4OS:
            strcat(str, " 4");
            break;
        case
            POJAZD_5OS:
            strcat(str, " 5");
            break;
        case
            POJAZD_5OS_UP:
            strcat(str, " 5up");
            break;
        case
            INVALID:
        default:
            strcat(str, " error");
            break;
    }
    if (compute_positions) {
        const unsigned num_axles = (vehicle.class == POJAZD_5OS_UP) ? 5
                                                                    : (unsigned) vehicle.class;
        for (unsigned i = 0; i <= num_axles + 1; i++) {
            sprintf(position_data, " %.3f", vehicle.lengths[i]);
            strcat(str, position_data);
        }
    }
    strcat(str, "\n");
    if (piezo_verify) {
        strcat(str, vehicle.piezo == (unsigned) vehicle.class ? "piezo ok\n"
                                                              : "piezo error\n");
    }

    if (is_verbosity_at_least(RELEASE)) printf(str);

    if(output_filename[0] != '\0') { //zapis do pliku o podanej nazwie
        FILE * f = fopen(output_filename, "a");
        fprintf(f, str);
        fclose(f);
    }
}

bool is_verbosity_at_least(verb_level v) {
    return ((int) v <= verbosity_level);
}