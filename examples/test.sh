#!/usr/bin/env bash
# skrypt wraz z configuracją zawartą w katalogu test
# pozwala domyślnie na wywołanie testów aplikacji
# na podstawie danych ze stanowiska nr 1
# Drzewo katalogów testowych względem głównego
# katalogu projektu ma postać
# data
# ├── baza1
# │   ├── ciezarowy_2os
# │   ├── ciezarowy_3os
# │   ├── ciezarowy_4os
# │   ├── ciezarowy_5os
# │   ├── ciezarowy_5os_up
# │   ├── dostawczy
# │   ├── osobowy_alus
# │   └── osobowy_stal
# └── baza2
# i wykorzystywane są pliki z podkatalogu baza1
# konfigurację można zmienić poprzez plik config.json
if [[ -d data/baza1 ]]; then
    cd test
    ./test_alg.py
    cd ..
else
    echo "Katalog data/baza1 nie istnieje. Jeśli zmodyfikowano konfigurację, należy bezpośrednio uruchomić skrypt test_alg.py z poziomu katalogu test."
fi

