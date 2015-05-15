function [Vkm, Vms, Dl] = predkosc_dlugosc(t, p1, p2, Od_czuj)
%Od_czuj=1;          % odleglosc miedzy czujnikami w metrach

LP=length(t);       % liczba probek

% PARAMETRY------------------------------------------------------
prog1=3;            % progi histerezy w voltach
prog2=2;

% ZMIENNE--------------------------------------------------------
Nimp1=0;             % numer impulsu PIEZO1
Nimp2=0;             % numer impulsu PIEZO2

pocz_imp=0;          % flaga - wskazuje czay jestesmy w obszarze impulsu
index1(2)=0;         % tablice indeksów przednich zboczy impulsów
index2(2)=0;

Vms=0;
Vkm=0;
Dl=0;

for i = 1:LP            
    if p1(i)<prog1 && pocz_imp==0    
        elseif p1(i)>=prog1 && pocz_imp==0
            pocz_imp=1;
            Nimp1=Nimp1+1;     % inkrementacja numeru impulsu
            index1(Nimp1)=i;   % zapamiêtanie indeksu przejscia przez próg 
        elseif p1(i)<prog2 && pocz_imp==1
            pocz_imp=0;            
   end
end

for i = 1:LP            
    if p2(i)<prog1 && pocz_imp==0    
        elseif p2(i)>=prog1 && pocz_imp==0
            pocz_imp=1;
            Nimp2=Nimp2+1;     % inkrementacja numeru impulsu
            index2(Nimp2)=i;   % zapamiêtanie indeksu przejscia przez próg 
        elseif p2(i)<prog2 && pocz_imp==1
            pocz_imp=0;            
   end
end

if Nimp1==2 && Nimp2==2
    czas2=(index1(2)-index1(1)  +  index2(2)-index2(1) )/2 *1e-4; %  usredniony czas do obliczenia predkosci
    czas1=(index2(1)-index1(1)  +  index2(2)-index1(2) )/2 *1e-4; % usredniony czas do obliczenia dlugosci   
   
    Vms=Od_czuj/czas1;
    Vkm=Vms*3.6;
    Dl=Vms*czas2;   
elseif Nimp1>2 || Nimp2>2

    czas2=(index1(2)-index1(1)  +  index2(2)-index2(1) )/2 *1e-4; % usredniony czas do obliczenia predkosci
    czas1=(index2(1)-index1(1)  +  index2(2)-index1(2) )/2 *1e-4; % usredniony czas do obliczenia dlugosci   
   
    Vms=Od_czuj/czas1;
    Vkm=Vms*3.6;
    Dl=Vms*czas2; 
else
    disp('Problem z danymi!')
end

end
