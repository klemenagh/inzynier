%algorytm 1 detekcji osi pojazdów
function zgodnosc=fun_test_zgodnosci(syg, liczba_osi)
zgodnosc=0;
P=syg.P1;
P_os=licznik(P);
 if P_os == liczba_osi % jezli liczba osi piezo zgadza sie z 
    C=syg.C';
    CP=C+P;
    wy=licznik_prog(CP,8); % specjalny licznik z progiem 8
    if wy==liczba_osi 
        zgodnosc=1;
    end
 end
end