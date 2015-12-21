#!/usr/bin/env bash

## stanowisko 1
#. ./examples/example1.sh

## stanowisko 2
#. ./examples/example2.sh

## wykorzystanie gui i modułu watcher do obserwowania ścieżki
#. ./examples/example_watcher_gui.sh

## testy
# plik wykonujący testy znajduje się w katalogu test
# wykorzystuje dane z archiwum `algorytm2_in_matlab` zakładając, że jest ono rozpakowane w głównym katalogu projektu
# można to zmodyfikować poprzez plik config.json (`root_directory`)
#. ./examples/test.sh

## strony podręczników
#man axles
#man watcher
