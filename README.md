# Praca inżynierska
Implementacja algorytmu detekcji osi pojazdów samochodowych w oparciu o profile R i X.

Implementation of algorithm for vehicle axles detection based on R, and X-profile.

W ramach pracy zrealizowane zostanie oprogramowanie do detekcji osi pojazdów na podstawie profili R i X,
 z użyciem języka C  w środowisku Linux.
 Zaimplementowane zostaną funkcje charakterystyczne dla oprogramowania GNU-Coreutils,
 tzn. obsługa standardowych wejść i wyjść, potoków i argumentów wiersza poleceń.

 # TODO
  - [x] Sprawdzenie wycieków pamięci
  - [x] Implementacja funkcji porównującej wynik algorytmu z odczytami piezo
  - [x] Zmiana struktury danych z listy jednokierunkowej na wektor
  - [x] Implementacja testów
  - [x] todo położenie osi względem karoserii ( Z = sqrt(R2 + X2) )
  - [x] Format wyjścia: 
```
plikWejściowy LiczbaOsi DługośćPojazdu wartościOdległości S1 S2 S3
  --O-------O--
  S1   S2    S3
```
  - [ ] Dodanie do skryptów budujących opcji `install`, instalującej programy i man-page.
  - [ ] Buforowanie odrzucanej obecnie próbki danych w trybie pracy ciągłej. (po ustaleniu przydatności)
  - [ ] Bardziej generyczna metoda zadawania poprawnych wartości w pliku testów.
  - [ ] Cleanup kodu.


Uwagi
Bibliografia
  - czas dostępu online
  - wszyscy autorzy - "and" w jabref
  - jabref - IEEE...S
  - ALT... -> article

Praca
  - unikać słowa `tworzyć`
  - spacje wokół odnośników, na końcu zdania
  - forma bezosobowa
  - w trakcie prezentacji - forma pierwszej osoby
  - cel i zakres pracy
  - grafiki - ze źródłem
  
Lyx
  - wtyczka Hunspell

Schematy
  - visio / inkscape
