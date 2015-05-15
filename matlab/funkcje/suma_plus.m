function [suma, liczba]=suma_plus(x,war)
%war - warunek dla ktorego iczona jest suma
len=length(x);
suma=0;
liczba=0;
for k=1:1:len
    if x(k) > war
       suma=suma+x(k);
       liczba=liczba+1;
    end
end
end