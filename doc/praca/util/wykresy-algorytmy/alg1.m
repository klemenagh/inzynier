%% sygnaly wejsciowe
close all;
clear all;
load('sygnaly-wejsciowe')
% R01 = log(:, 1)';
% X01 = log(:, 2)';
% R3 = log(:, 3)';
% X3 = log(:, 4)';
dt = 10e-5; 
t = dt:dt:2;
subplot(2,1, 1);
plot(t, R01)
hold on
plot(t, X01)
plot(t, R3)
plot(t, X3)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał R_{0,1m}', 'Sygnał X_{0,1m}', 'Sygnał R_{3m}', 'Sygnał X_{3m}', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 1 -10 5])
grid on;
subplot(2, 1, 2);
plot(t, sqrt(R01 .^2 + X01.^2))
hold on;
plot(t, sqrt(R3 .^2 + X3.^2))
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał (R_{0,1m}^{2} + X_{0,1m}^{2})^{0.5}', 'Sygnał (R_{3m}^{2} + X_{m}^{2})^{0.5}', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 1 0 10])
grid on;

%% przetwarzanie wstepne
close all;
clear all;
load('sygnaly-przetwarzanie')
% R01 = log(:, 1)';
% X01 = log(:, 2)';
% R3 = log(:, 3)';
% X3 = log(:, 4)';
dt = 10e-5; 
% t = dt:dt:(dt * size(R01, 1));
t = (1:size(R01, 2)) * dt;
% subplot(2,1, 1);
plot(t, R01)
hold on
plot(t, X01)
plot(t, R3)
plot(t, X3)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał R_{0,1m}', 'Sygnał X_{0,1m}', 'Sygnał R_{3m}', 'Sygnał X_{3m}', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 t(end) -10 5])
grid on;
%% algorytm 1
close all;
clear all;
load('sygnaly-m-kp-ku')
% M = log(:, 1)';
% Kp = log(:, 2)';
% Ku = log(:, 3)';
dt = 10e-5;
t = (1:size(M, 2)) * dt;
plot(t, M)
hold on;
plot(t, Kp)
plot(t, Ku)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał M', 'Sygnał K_{p}', 'Sygnał K_{u}', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 t(end) -1 6])
grid on;

%% algorytm ku piezo
close all;
clear all;
load('sygnaly-ku-piezo')
% Ku = log(:, 1)';
% piezo = log(:, 2)';
dt = 10e-5;
t = (1:size(Ku, 2)) * dt;
plot(t, Ku)
hold on;
plot(t, piezo)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał K_{u}', 'Sygnał piezo', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 t(end) -1 6])
grid on;

%% algorytm brakujace ku piezo
close all;
clear all;
load('sygnaly-ku-piezo-brakujace')
% Ku = log(:, 1)';
% piezo = log(:, 2)';
dt = 10e-5;
t = (1:size(Ku, 2)) * dt;
plot(t, Ku)
hold on;
plot(t, piezo)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał K_{u}', 'Sygnał piezo', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 t(end) -2 6])
grid on;

%% algorytm podniesiona ku piezo
close all;
clear all;
load('sygnaly-ku-piezo-podniesiona')
dt = 10e-5;
t = (1:size(Ku_4, 1)) * dt;
% subplot(2,1, 1);
% plot(t, Ku_4)
% hold on;
% plot(t, Piezo)
% xlabel('Czas [s]')
% ylabel('Wartość [V]')
% legend('Sygnał K_{u} - 4 osie', 'Sygnał piezo', ...
%     'Location','northoutside','Orientation','horizontal')
% axis([0 t(end) -1 6])
% grid on;

nowe_piezo = zeros(size(Ku_5));
for i =1:size(Ku_5)
    if min(abs(osie - i)) < 50
        nowe_piezo(i) = 5;
    else
        nowe_piezo(i) = 0;
    end;
end;
% subplot(2,1, 2);
plot(t, Ku_5)
hold on;
plot(t, nowe_piezo)
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał K_{u} - 5 osi', 'Sygnał detekcji osi', ...
    'Location','northoutside','Orientation','horizontal')
axis([0 t(end) -1 6])
grid on;

