//
// Created by vka on 26.05.15.
//
/*
 * Program śledzi podaną jako argumenty programu ścieżki (lub obecny katalog,
 * jeśli argument nie został podany) i po wykryciu pojawienia się nowego pliku,
 * wyświetla jego zawartość w stdout (by można było przekazać ją do programu
 * zliczającego osie).
 * Wykorzystuje API inotify, dostępne w jądrze systemu Linux, więc działanie
 * wymaga systemu Linux w wersji co najmniej 2.6.13.
 */
#include <stdio.h>
#include <sys/inotify.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#define DEBUG 1
#define EVENT_SIZE  ( sizeof (struct inotify_event) )
#define BUF_LEN     ( 1024 * ( EVENT_SIZE + 16 ) )

static void read_file_to_stdout(char *filename) {
    if (DEBUG) {
        fprintf(stderr, "Reading file: %s\n", filename);
    }

    FILE *f = fopen(filename, "r");
    char buffer[160];
    unsigned num_lines = 0;

    while (fgets(buffer, sizeof(buffer), f)) {
        printf(buffer);
        num_lines++;
    }
    if (DEBUG) {
        fprintf(stderr, "Liczba przeczytanych linii: %d\n", num_lines);
    }
    fclose(f);
}

int main(int argc, char **argv) {

    int fd;
    int wd;
    int i;
    ssize_t num_read;
    char *p;
    char created_file_patch[255];
    char buffer[BUF_LEN];
    struct inotify_event *event;
    const int num_dirs = (argc == 1) ? 1 : (argc - 1);
    char *directory_names[num_dirs];
    int directory_wds[num_dirs];

    fd = inotify_init();

    if (fd < 0) perror("inotify_init");

    if (argc == 1) {
        if (DEBUG) {
            fprintf(stderr, "Obserwuję ścieżkę: %s\n", ".");
        }
        wd = inotify_add_watch(fd, ".", IN_CLOSE_WRITE);
        if (wd == -1) perror("inotify_add_watch");

        directory_names[0] = ".";
        directory_wds[0] = wd;
    }
    for (i = 1; i < argc; i++) {
        if (DEBUG) {
            fprintf(stderr, "Obserwuję ścieżkę: %s\n", argv[i]);
        }
        wd = inotify_add_watch(fd, argv[i], IN_CLOSE_WRITE);
        if (wd == -1) perror("inotify_add_watch");

        directory_names[i - 1] = argv[i];
        directory_wds[i - 1] = wd;
    }

    while (1) {
        if (DEBUG) {
            fprintf(stderr, "Oczekiwanie na event\n");
        }
        num_read = read(fd, buffer, BUF_LEN);

        if (num_read <= 0) perror("read");

        if (DEBUG) {
            fprintf(stderr, "Read %ld bytes from inotify fd\n",
                    (long) num_read);
        }
        for (p = buffer; p < buffer + num_read;) {
            event = (struct inotify_event *) p;

            //ustalenie pełnej ścieżki do stworzonego pliku
            strcpy(created_file_patch, "");
            for (i = 0; i < num_dirs; i++) {
                if (event->wd == directory_wds[i]) {
                    strcpy(created_file_patch, "");
                    strcat(created_file_patch, directory_names[i]);
                    if (created_file_patch[strlen(created_file_patch) - 1] !=
                        '/') {
                        strcat(created_file_patch, "/");
                    }
                    strcat(created_file_patch, event->name);
                    break;
                }
            }
            if (DEBUG) {
                fprintf(stderr, "IN_CLOSE_WRITE: \n name: %s\n",
                        created_file_patch);
            }
            if (strcmp(created_file_patch, "") != 0) {
                read_file_to_stdout(created_file_patch);
            }

            p += sizeof(struct inotify_event) + event->len;
        }
    }
    return 0;
}