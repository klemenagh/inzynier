#!/usr/bin/env bash

## stanowisko 1
echo "-------------------------------------------------"
echo "Przykład przetworzenia danych ze stanowiska nr 1."
. ./examples/example1.sh

## stanowisko 2
echo "-------------------------------------------------"
echo "Przykład przetworzenia danych ze stanowiska nr 2."
. ./examples/example2.sh

## testy
# plik wykonujący testy znajduje się w katalogu test
# wykorzystuje dane z archiwum `algorytm2_in_matlab` zakładając, że jest ono rozpakowane w katalogu data/baza1
# można to zmodyfikować poprzez plik config.json (`root_directory`)
echo "-------------------------------------------------"
echo "Przykład wywołania testów"
. ./examples/test.sh


## wykorzystanie gui i modułu watcher do obserwowania ścieżki
# . ./examples/example_watcher_gui.sh

## strony podręczników
# man axles
# man watcher
