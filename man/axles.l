.TH AXLES 1
.SH NAME
axles \- wyznacz parametry pojazdu
.SH SYNOPSIS
.B axles [opcje] [plik_odczytów.lvm ..]
.SH DESCRIPTION
.B Axles
jest programem służącym do wyznaczania parametrów pojazdu na podstawie odczytów z czujników indukcyjnych.
Podstawową funkcjonalność stanowi wyznaczanie ilości osi pojazdu.
Ponadto, dostępna jest opcja wyznaczania odległości pomiędzy poszczególnymi osiami oraz długość całego pojazdu.
Należy uwzględnić, że pomiar długości pojazdu może być niedokładny ze względu na specyfikę zagadnienia.
Pomiar położenia poszczególnych osi pozbawiony jest tego ograniczenia.
\fBAxles\fR towarzyszą programy pomocnicze, \fBWatcher\fR oraz \fBGui\fR.
.PP
\fBAxles\fR, wraz z programi pomocniczymi to:
.IP \[bu] 2
Wyznaczanie liczby osi pojazdu.
.IP \[bu] 2
Wyznaczanie położenia poszczególnych osi oraz długość pojazdu.
.IP \[bu] 2
Weryfikacja wyniku na podstawie odczytów z piezo.
.IP \[bu] 2
Obsługa wielu plików wejściowych poprzez argument programu.
.IP \[bu] 2
Odczyt danych z \fBstdin\fR. Umożliwia to pracę programu w trybie ciągłym i analizę napływających pomiarów.
.IP \[bu] 2
Zapis wyników do pliku.
.IP \[bu] 2
Uproszczona prezentacja graficzna wyników.
.SH OPTIONS
.TP
.BR \-\-piezo ", " \-\-verify ", " \-c
Przeprowadź weryfikację wyniku na podstawie odczytu z piezo.
.TP
.BR \-\-positions ", " \-p
Wyznacz położenie osi pojazdu i jego długosć.
.TP
.BR \-\-output=\fIPLIK_WYJŚCIOWY\fR ", " \-o " " \fIPLIK_WYJŚCIOWY\fR
Zapisz wyniki do podanego pliku niezależnie od ilości danych wysyłanych na \fBstdout\fR (zobacz poniżej).
.TP
.BR \-\-verbosity=\fIquiet\fR ", " \-s " " \fIquiet\fR ", " \-q
Pracuj w trybie cichym, bez wyświetlania komulikatów na ekranie.
.TP
.BR \-\-verbosity=\fIdebug\fR ", " \-s " " \fIdebug\fR ", " \-d
Wysyłaj zwiększoną liczbę komunikatów na ekran (co może być przydatne w przypadku błędu działania programu).
.TP
.BR \-\-verbosity=\fIall\fR ", " \-s " " \fIall\fR ", " \-aq
Wysyłaj wszystkie dostępne kominukaty w trakcie pracy.
.TP
.BR \-\-verbosity=\fIrelease\fR ", " \-s " " \fIrelease\fI
Pracuj z normalną ilością komunikatów wysyłanych na ekran (wartość domyślna).
.SH BUGS
W sytuacji, gdy program pracuje w trybie ciągłym i pobiera dane ze strumienia wejściowego, przerwsza linia danych dla każdego zestawu pomiarów po pierwszym jest gubiona.
Odpowiada to pierwszemu odczytowi z czujników.
Ze względu na format danych wejściowych, pierwszy odczyt niemal nigdy nie będzie zawierać użytecznej informacji.
Ponadto, ze względu na specyfikę pracy algorytmu, pominięcie jednej wartości pomiarów nie powinno wpłynąć na wynik na wyjściu.
.SH EXAMPLE
.TP
axles odczyt.lvm
Wyznacz liczbę osi pojazdu, dla którego pomiar znajduje się w pliku odczyt.lvm i wypisz tę wartość na wyjście.
Wyjście przyjmie postać \fBodczyt.lvm 2\fR, przy założeniu, że pojazd posiada dwie osie.
.TP
axles \-p \-c ścieżka/do/katalogu/*.lvm
Wyznacz wartości liczby osi i ich położenia, oraz weryfikację na podstawie piezo dla wszystkich plików z rozszerzeniem lvm wewnątrz podanego katalogu.
.TP
cat odczyt.lvm | axles
Zachowa się analogicznie jak w pierwszym przykładzie.
.TP
watcher ścieżka/do/katalogu/ | axles \-p \-c
Będzie pracować w trybie oczekiwania na dane ze strumienia wejściowego, a kiedy pojawią się, wyznaczy ilość osi, ich położenie i zweryfikuje wynik przy pomocy piezo.
Wyniki wyśle na standardowe wyjście.
.TP
watcher ścieżka/do/katalogu/ | axles \-q \-o plik_wyjściowy.db
Będzie pracować w trybie oczekiwania na dane, a wyniki wyśle do podanego pliku. Przełącznik \-q sprawi, że wyniki nie pojawią się w strumieniu wyjściowym.
.TP
watcher ./data | axles \-p | gui
Przeprowadzi obliczenia ilości osi i ich położenia, a wyniki przedstawi w formie graficznej.
.SH AUTHORS
Program został napisany w ramach pracy inżynierskiej studenta AGH \fBWojciecha Gumuła\fR pod kierunkiem i na bazie rozprawy doktorskiej dr. \fBZbigniewa Marszałka\fR.
.SH SEE ALSO
.TP
\fBwatcher(1)\FR
Program pomocniczny służacy do obserwacji katalogu w oczekiwaniu na zmiany.