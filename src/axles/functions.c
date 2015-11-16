//
// Created by vka on 20.04.15.
//

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "functions.h"
#include "../include/version.h"
#include "../include/sensor_configuration.h"

#define BUFFER_SIZE 160

extern struct sensor_configuration sensor_configuration;

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

    const unsigned data_size = 7;
    double data[data_size];
    char buffer[BUFFER_SIZE];
    char *splitted;
    while (fgets(buffer, sizeof(buffer), s)) {
        if (buffer[0] == '\n')
            break; //zakładam, że pusta linia oznacza koniec danych dla jednego pojazdu
        splitted = strtok(buffer, " \t");
        for (unsigned i = 0; i < data_size; i++) {
            if (splitted == NULL) {
                fputs("Błędny format danych (oczekiwano wartości, napotkano znak końca linii).\n",
                      stderr);
                exit(EIO);
            }
            data[i] = strtod(splitted, NULL);

            if (i < data_size - 1) splitted = strtok(NULL, " \t");
        }
        if (data[0] == 0 && vector->size > 0) { //dane kolejnego pojazdu
            return true;
        }
        pushback_data(vector, data);
    }
    if (s != stdin) fclose(s);

    return true;
}

void handle_output(vehicle_data_t vehicle, bool piezo_verify,
                   bool compute_positions, char *filename) {
    char str[BUFFER_SIZE] = "";
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

void load_sensor_configuration(const char *filename) {
    FILE *file = NULL;
    if (filename != NULL && (file = fopen(filename, "r")) != NULL) {
        if (is_verbosity_at_least(DEBUG))
            printf("Wczytywanie konfiguracji z pliku %s.\n", filename);

        char buffer[BUFFER_SIZE];

        while (fgets(buffer, sizeof(buffer), file)) {
            if (string_starts_with(buffer, SENSOR_LONG_LENGTH)) {
                sensor_configuration.sensor_long_length
                        = strtod(buffer + strlen(SENSOR_LONG_LENGTH), NULL);
            }
            else if (string_starts_with(buffer, SENSOR_SHORT_LENGTH)) {
                sensor_configuration.sensor_short_length
                        = strtod(buffer + strlen(SENSOR_SHORT_LENGTH), NULL);
            }
            else if (string_starts_with(buffer, SENSOR_LONG_POSITION)) {
                sensor_configuration.sensor_long_position
                        = strtod(buffer + strlen(SENSOR_LONG_POSITION), NULL);
            }
            else if (string_starts_with(buffer, SENSOR_SHORT_POSITION)) {
                sensor_configuration.sensor_short_position
                        = strtod(buffer + strlen(SENSOR_SHORT_POSITION), NULL);
            }
            else if (string_starts_with(buffer, PIEZO1_POSITION)) {
                sensor_configuration.piezo1_position
                        = strtod(buffer + strlen(PIEZO1_POSITION), NULL);
            }
            else if (string_starts_with(buffer, PIEZO2_POSITION)) {
                sensor_configuration.piezo2_position
                        = strtod(buffer + strlen(PIEZO2_POSITION), NULL);
            }
            else if (string_starts_with(buffer, TOTAL_LENGTH)) {
                    sensor_configuration.total_length
                            = strtod(buffer + strlen(TOTAL_LENGTH), NULL);
            } else {
                if (is_verbosity_at_least(RELEASE))
                    printf("Nieznana linia w pliku konfiguracyjnym:\n %s", buffer);
            }
        }
    }
    else {
        if (is_verbosity_at_least(DEBUG))
            puts("Wczytywanie domyślnej konfiguracji.");

        sensor_configuration.sensor_long_length = 1;
        sensor_configuration.sensor_short_length = 0.1;
        sensor_configuration.sensor_long_position = 1;
        sensor_configuration.sensor_short_position = 10.4;
        sensor_configuration.piezo1_position = 16;
        sensor_configuration.piezo2_position = 17;
        sensor_configuration.total_length = 25;
    }

    if (is_verbosity_at_least(DEBUG)) {
        puts(" Konfiguracja czujników:");
        printf("  Pozycja długiego czujnika:  %5.2f [m]\n",
               sensor_configuration.sensor_long_position);
        printf("  Pozycja krótkiego czujnika: %5.2f [m]\n",
               sensor_configuration.sensor_short_position);
        printf("  Pozycja piezo 1:            %5.2f [m]\n",
               sensor_configuration.piezo1_position);
        printf("  Pozycja piezo 2:            %5.2f [m]\n",
               sensor_configuration.piezo2_position);
        printf("  Długość długiego czujnika:  %5.2f [m]\n",
               sensor_configuration.sensor_long_length);
        printf("  Długość krótkiego czujnika: %5.2f [m]\n",
               sensor_configuration.sensor_short_length);
    }
}

bool string_starts_with(const char *string, const char *pre) {
    size_t lenpre = strlen(pre);
    size_t lenstr = strlen(string);
    return lenpre <= lenstr && (strncmp(string, pre, lenpre)) == 0;
}

bool is_between(const double val, const double from, const double to) {
    return val >= from && val <= to;
}

unsigned get_between(const unsigned val, const unsigned from, const unsigned to) {
    if (val < from)
        return from;
    if (val > to)
        return to;
    return val;
}
