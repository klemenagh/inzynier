function stat=statystyka(stat,liczba_osi,zgodnosc)

if liczba_osi<2
    stat(1)=stat(1)+1;
elseif liczba_osi>5
    stat(6)=stat(6)+1;
else
    stat(liczba_osi)=stat(liczba_osi)+1;
end
if zgodnosc
  stat(7)=stat(7)+1;
end
end