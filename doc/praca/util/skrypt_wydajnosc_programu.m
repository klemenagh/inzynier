%% wykres 3 Wydajność pracy programu
% 1 0,054 0,055
% 2 0,104 0,12
% 4 0,206 0,235
% 6 0,301 0,309
% 8 0,402 0,462
% 10 0,499 0,508
% 20 0,988 1,071
% 40 1,968 2,087
% 60 2,986 3,376
% 80 3,923 4,182
% 100 4,947 5,174
% 200 9,603 10,175
% 400 19,063 20,043
% 600 29,814 30,136
% 800 38,333 40,524
% 1000 47,597 50,149
% 2000 96,123 100,769
% 4000 194,012 209,098
% 6000 301,069 311,295
% 8000 414,659 419,714
% 10000 510,345 522,708
close all
load('dane_wydajnosc_programu')

f = figure;
semilogx(num, 1000 * argument ./ num, 'ro--', 'MarkerSize', 5)
hold on;
semilogx(num, 1000 * stdin ./ num, 'b.--', 'MarkerSize', 12)

axis([num(1), num(end), 30, 70])
xlabel('Liczba pojazdów')
ylabel('Czas przetwarzania jednego pojazdu [ms]')
legend('Argument', 'Strumień wejścia')
grid on