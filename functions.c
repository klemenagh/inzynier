//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include "functions.h"
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#define VERSION "0.9.0"

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
-c --verify\tSprawdź wynik z sygnałami piezo.\n\
-q --quiet\tNie wyświetlaj wyjścia na ekran. (może być użyteczna, gdy zapis\n\
\t\tnastępuje do pliku).\n\
-o --output\tZapisuje wyniki działania algorytmu do podanego pliku. Zawartość\n\
\t\tpliku nie jest usuwana, dane są dopisywane na końcu pliku.\n\
-h --help\tWywołaj pomoc dla programu.\n\
-v --version\tPokaż informację o aktualnej wersji programu.\n");
    }
    exit(exit_status);
}

void version() {
    printf("axles %s\n", VERSION);
    putchar('\n');
    puts("Program wykonany w ramach pracy inżynierskiej przez Wojciecha Gumuła (github.com/vvk).");
    exit(EXIT_SUCCESS);
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
    if (vector != NULL && vector->size != 0) {
        clear_data_vector(vector);
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
        if (data[0] == 0 && vector->size > 0) {//dane kolejnego pojazdu
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
    char tmp[20];

    if (filename != NULL) strcat(str, filename);
    else strcat(str, "stdin");

    if (vehicle.class == POJAZD_5OS_UP) strcpy(tmp, " 5up");
    else if (vehicle.class == INVALID) strcpy(tmp, " error");
    else sprintf(tmp, " %u", (unsigned) vehicle.class);

    strcat(str, tmp);
    if (compute_positions) {
        const unsigned num_axles = (vehicle.class == POJAZD_5OS_UP) ? 5
                                                                    : (unsigned) vehicle.class;
        for (unsigned i = 0; i <= num_axles + 1; i++) {
            sprintf(tmp, " %.3f", vehicle.lengths[i]);
            strcat(str, tmp);
        }
    }
    strcat(str, "\n");
    if (piezo_verify) {
        sprintf(tmp, "piezo %u", vehicle.piezo_axles);
        strcat(str, tmp);

        if (compute_positions && vehicle.piezo_axles >= 2 &&
            vehicle.piezo_axles <= 5) {
            for (unsigned i = 0; i < vehicle.piezo_axles - 1; i++) {
                sprintf(tmp, " %.3f", vehicle.piezo_lengths[i]);
                strcat(str, tmp);
            }
        }
        strcat(str, "\n");
    }

    if (is_verbosity_at_least(RELEASE)) {
        printf("%s", str);
        fflush(stdout);
    }

    if (output_filename[0] != '\0') { //zapis do pliku o podanej nazwie
        FILE *f = fopen(output_filename, "a");
        fprintf(f, "%s", str);
        fclose(f);
    }
}

bool is_verbosity_at_least(verb_level v) {
    return ((int) v <= verbosity_level);
}
