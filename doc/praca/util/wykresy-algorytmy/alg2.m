%% dlugosc pojazdu
close all;
clear all;
load('sygnaly-dlugosc-pojazdu')
dt = 10e-5;
t = (1:size(M, 2)) * dt;
body = (M > 0.5) * 3.5;
osie = zeros(size(M));
for i =1:size(M, 2)
    if min(abs(axles - i)) < 50
        osie(i) = 3;
    else
        osie(i) = 0;
    end;
end;
plot(t, M);
grid on;
axis([0, t(end), -.5, 3]);
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał M = R_{1m}^{2} + X_{1m}^{2}', ...
    'Orientation','horizontal')

figure, plot(t, M);
hold on;
plot(t, body);
plot(t, osie);
grid on;
axis([0, t(end), -.5, 4]);
xlabel('Czas [s]')
ylabel('Profil [V]')
legend('Sygnał M = R_{1m}^{2} + X_{1m}^{2}', 'Sygnał detekcji body', 'Sygnał detekcji osi', ...
    'Location','northoutside','Orientation','horizontal')