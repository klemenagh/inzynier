function [R, L]=fun_przesun(R, L, lp, lk)
% dziedzina drogi st - odleglosc od poczatku stanowiska do czujnika, 
% v w [m/s],
R=R(:)';
L=L(:)';
%liczba próbek do odciecia po przeliczeniu z st w [m]
%lp=fix(st/v/dt);
%odciecie lp pierwszych poczatkowych probek w celu przesuniecia
%dodanie zer na koniec, naprawa dlugosci
 R=[R(lp:end) zeros(1, lp-1)];
 L=[L(lp:end) zeros(1, lp-1)]; 
%lk=fix(25/v/dt)+1; %odciecie po 25 metrach
 R=R(1:lk);
 L=L(1:lk);
 R=R(:);
 L=L(:);
end
