%% pojazdy osobowe
clc
close all;
clear all;
files = dir('*.mat');
file = 'osobowy-alus-M120620_154404';

for i = 1:length(files)
    file = files(i).name(1:(end-4))
    load(file)
    M = 0 * wgn(length(M), 1, 1) + M;
    osie = zeros(size(M));
    for i =1:length(M)
        if min(abs(axles - i)) < 50
            osie(i) = 5;
        else
            osie(i) = 0;
        end;
    end;

    body = (M > (0.5 ^ .25));
    i1 = find(body + osie, 1, 'first');
    i2 = find(body + osie, 1, 'last');
    body = 3.5 * ((1:length(M) >= i1) .* (1:length(M) <= i2));


    dt = 10e-5;
    t = (1:length(R01)) * dt;

    figure('units','normalized','position',[.1 .1 .6 .5])
    ha1 = subplot(2, 1, 1);
    plot(t, R01, t, X01, t, P);
    axis([0 t(end), floor(min([R01; X01; P])), ceil(max([R01; X01; P]))])
    grid on;
    xlabel('Czas [s]')
    ylabel('Profil [V]')
    hl1 = legend('Sygnał R_{0,1m}', 'Sygnał X_{0,1m}', 'Sygnał piezo   ', ...
        'location', 'northeastoutside', 'orientation', 'vertical');

    ha2 = subplot(2, 1, 2);
    plot(t, Ku, t, M, t, body, t, osie);
    axis([0 t(end), floor(min([Ku; M])), ceil(max([Ku; M; 5.0000001]))])
    grid on;
    xlabel('Czas [s]')
    ylabel('Profil [V]')
    hl2 = legend('Sygnał K_{u}', 'Sygnał M', 'Sygnał detekcji body', 'Sygnał detekcji osi', ...
        'location', 'northeastoutside', 'orientation', 'vertical');

    pl1 = get(hl1,'Position');
    pl2 = get(hl2,'Position');
    pa1 = get(ha1,'Position');
    pa2 = get(ha2,'Position');
    set(hl1,'Position',[pl2(1) pl1(2) pl2(3) pl1(4)])

    set(ha1,'Position',[pa2(1) pa1(2) pa2(3) pa1(4)])
%     print(['n-' file], '-dsvg')
% break
pause
end
% R01 = log(:, 1);
% X01 = log(:, 2);
% P = log(:, 3);
% Ku = log(:,4);
% M = log(:, 5);
