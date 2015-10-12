.TH WATCHER 1
.SH NAME
watcher \- obserwuj katalog w oczekiwaniu na dane
.SH SYNOPSIS
.B watcher [opcje] [obserwowany_katalog ..]
.SH DESCRIPTION
.B Watcher
jest programem umożliwiającym obserwację wielu katalogów jednocześnie w oczekiwaniu na pojawienie się danych z czujników wykorzystywanych do określania ilości osi pojazdu.
W momencie pojawienia się nowego pliku lub edycji już istniejącego w jednym z obserwowanych katalogów, zawartość jest przesyłana do \fBstdout\fR.
Umożliwia to przesłanie danych bezpośrednio po pojawieniu się do programu \fBAxles\fR i wyznaczenie parametrów pojazdu. 
Znajduje to zastosowanie przy wyznaczaniu wartości dotyczących pojazdu bezpośrednio po pojawieniu się odczytów na dysku.
Wykorzystuje API inotify, dostępne w jądrze systemu Linux, przez co do poprawnego działania konieczne jest system wykorzystujący jądro systemu Linux w wersji co najmniej 2.6.13.
Dzięki uniwersalnemu interfejsowi, możliwe jest wykorzystanie programu do współpracy z innymi algorytmami i innym formatem danych wejściowych.
Pracę programu można przerwać wysyłając sygnał SIGINT (kombinacja \fBctrl\-c\fR).
.SH OPTIONS
.TP
.BR \-\-debug ", " \-d
Wypisz do strumienia \fBstderr\fR dodatkowe informacje, przydatne w trakcie poszukiwania błędów działania programu.
Użycie tej opcji nie wpływa na poprawność danych wypisywanych do \fBstdout\fR.
.TP
.BR \-\-extension=\fIROZSZERZENIE\fR ", " \-e " " \fIROZSZERZENIE\fR
Pozwala na sprecyzowanie rozszerzenia plików, które będą obserwowane. Domyślna wartość to .lvm.
.SH BUGS
W trakcie tworzenia programu, nie wykryto błędów działania.
.SH EXAMPLE
.TP
watcher
Obserwuj aktualny katalog roboczy w oczekiwaniu na pliki o rozszerzeniu \fBlvm\fR.
.TP
watcher \-\-extension=dat ./odczyty/
Obserwuj podkatalog \fBodczyty\fR w oczekiwaniu na pliki o rozszerzeniu \fBdat\fR.
.TP
watcher \-e dat \-d . ./odczyty/
Obserwuj obecny katalog roboczy oraz podkatalog \fBodczyty\fR w oczekiwaniu na pliki o rozszerzeniu \fBdat\fR.
Wyświetl dodatkowe informacje dotyczące pracy działania programu.
.TP
watcher \-\-extension=dat ./odczyty/ | axles
Przykład użycia programu w połączeniu z algorytmem wyznaczania liczby osi.
.SH AUTHORS
Program został napisany w ramach pracy inżynierskiej studenta AGH \fBWojciecha Gumuła\fR pod kierunkiem i na bazie rozprawy doktorskiej dr. \fBZbigniewa Marszałka\fR.
.SH SEE ALSO
.TP
\fBaxles(1)\FR
Program wykorzystywany do wyznaczania ilości osi pojazdu i ich położeń.