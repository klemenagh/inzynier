%%algorytm 2 detekcji osi pojazd�w
function [liczba_osi, syg]=fun_algorytm2_test(syg)
%pocz�tkowe dla osobowego
S=4.0;
H=0.5;
r=0.5;
%
R=syg.R01m;
%R=fun_zeruj_ujemne(R);
X=syg.X01m;
%
%sprawdzam, czy to ci�ar�wka..
[Xsum_p, liczba_Xp]=suma_plus(X,0.1); 
%[Xsum_m, liczba_Xm]=suma_minus(X,-0.2);
%[Rsum_p, liczba_Rp]=suma_plus(R,0.2);
Z=R.^2+X.^2;
[Zsum_p, liczba_Z]=suma_plus(Z,0.5);
dod=liczba_Xp/liczba_Z * 100; %liczbaX�w dodatnich/liczba wyst�pie� R>0.2
%parametr do detekcji pojazdow 3 osiowych
%c=liczba_Xm/liczba_Rp;
if dod>10 % dodatnich 
      S=0.8;
      r=0.21;
      H=0.45;
end

Kprim=r*R + X;
m=max(Kprim);
%??
if m>3
    S=0.8;
      %r=0.21;
      H=0.45;
end
%
Ku=unormowanie_do1(Kprim)*5;
C=komparator(Ku,S,H);
liczba_osi=licznik(C);

%liczba osi mniejsza niz 2 oznaczy zbyt wysoko ustawiony poziom S
if 1 % wylaczenie dla porownania 
    tmp1=liczba_osi;
    H=0.1;
    while liczba_osi<2 && S>0.15
        S=S-0.1;
        C=komparator(Ku,S,H);
        liczba_osi=licznik(C);
        %fprintf('#')
    end
    if tmp1<2
        %fprintf('\n')
    end
end

% Pr�ba znalezienia 5 osi w przypadku wykrycia 4.
if liczba_osi==4
    tmp1=liczba_osi;
    H=0.1; % poziom histerezy komparatora bardzo niski..
    r=0.3; % troch� wy�sze wykorzystanie profilu R;
    Kprim=r*R + X;
    Ku=unormowanie_do1(Kprim)*5;
    stop=1;
    while liczba_osi~=5 && S>0.15 && stop
        S=S-0.1;
        C=komparator(Ku,S,H);
        liczba_osi=licznik(C);
        if liczba_osi<4 || liczba_osi>5
            stop=0;
            S=1.8;
            C=komparator(Ku,S,H);
            liczba_osi=licznik(C);
        end
        %fprintf('#')
    end
    if tmp1==4
        %fprintf('\n')
    end
end
%
fprintf(' Lm      = %5d\n Lx      = %5d\n', liczba_Z, liczba_Xp);
fprintf(' a_b [r] =  %4.2f\n', r);
fprintf(' Y [S]   =  %4.2f\n', S);
fprintf(' H       =  %4.2f\n', H);
fprintf(' Kp_max  = %5.2f\n', m);
fprintf(' Osie    = %5d\n', liczba_osi);

syg.Kprim=Kprim;
syg.Ku=Ku;
syg.C=C;
syg.r=r;
syg.a=0;
syg.b=0;
syg.c=m;
syg.dod=dod;
syg.S=S;
end