function s=fun_synchronizacja(s)
% fun. synchronizuje
%[V, v] = predkosc(T,OS1,OS2,1);

fprintf('Wyznaczanie predkosci i dystansu.\n');
[s.V, s.v, s.Dl] = predkosc_dlugosc(s.t, s.P1, s.P2, 1);
if s.v<=0
    s.V=200;
    s.v=s.V/3.6;
    disp('Uwaga predkosc wyszla mniejsza niz zero!')
end
s.D=s.v*s.t; %wspolrzedna drogi
dt = s.t(2)-s.t(1); %

fprintf('\tpredkosc [m/s]: %f\n\tdroga: %f\n\tdt: %f\n', s.v, s.Dl, dt);

fprintf('Trimowanie\n');
%disp(sprintf('%d) Pr�dko�� %2.1f [km/h], dane z %s', nr_pliku ,V , plik))
st=1; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
lk=fix(25/s.v/dt)+1;
fprintf('\t%d\n', lp);
[s.R1m, s.X1m]=fun_przesun(s.R1m, s.X1m, lp, lk);

st=st+1+0.5; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.R05m, s.X05m]=fun_przesun(s.R05m, s.X05m,  lp, lk);
fprintf('\t%d\n', lp);

st=st+1+0.3; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.R03m, s.X03m]=fun_przesun(s.R03m, s.X03m,  lp, lk);
fprintf('\t%d\n', lp);

st=st+1+1.5+0.1; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.R3m, s.X3m]=fun_przesun(s.R3m, s.X3m, lp, lk);
fprintf('\t%d\n', lp);

st=st+1.5+1+1.5; % 1.5 a nie 1.6 bo do natarcia czujnika
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.R01m, s.X01m]=fun_przesun(s.R01m, s.X01m, lp, lk);
fprintf('\t%d\n', lp);

st=st+1+1.5+1.1+1+1; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.P1, P1_]=fun_przesun(s.P1, s.P1, lp, lk);
fprintf('\t%d\n', lp);

st=st+1; %odstep w [m] pomi�dzy czujnikami
lp=fix(st/s.v/dt); %lprobek do odciecia z przodu
[s.P2, P2_]=fun_przesun(s.P2, s.P2, lp, lk);
fprintf('\t%d\n', lp);
fprintf('\ttyl: %d\n', lk);
%ograniczenie sygnalu do 25 metrow - dziedzina drogi

s.t=s.t(1:lk);
s.D=s.D(1:lk);
end
