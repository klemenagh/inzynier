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
  - [ ] Zmiana struktury danych z listy jednokierunkowej na wektor
  - [ ] Implementacja testów
  - [ ] położenie osi w wektorze czasu
  - [ ] todo położenie osi względem karoserii ( Z = sqrt(R2 + X2) )
  - [ ] Format wyjścia: 
  LiczbaOsi DlugoscPojazdu wartościOdległości S1 S2 S3
  --O-------O--
  S1    S2   S3
