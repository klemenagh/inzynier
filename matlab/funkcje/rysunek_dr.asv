function rysunek_dr(syg, sciezka_plik)
t=syg.t; %moze byc syg.T
gr2=2.0;
gr1=1.5;
figure(2)
plot(t, syg.P1, 'y' ,'LineWidth', gr2), hold on
plot(t, syg.R01m, 'r' ,'LineWidth', gr1), hold on
plot(t, syg.X01m, 'b' ,'LineWidth', gr1)
plot(t, syg.Ku, 'g' ,'LineWidth', gr2), hold on
plot(t, syg.C, 'k' ,'LineWidth', gr1), hold on
% plot(t, syg.R03m, 'g' ,'LineWidth', gr1)
% plot(t, syg.L03m, 'g' ,'LineWidth', gr2)
% plot(t, syg.R05m, 'b' ,'LineWidth', gr1)
% plot(t, syg.L05m, 'b' ,'LineWidth', gr2)
% plot(t, syg.R1m, 'k' ,'LineWidth', gr1)
% plot(t, syg.L1m, 'k' ,'LineWidth', gr2)
% plot(t, syg.R3m, 'c' ,'LineWidth', gr1)
% plot(t, syg.L3m, 'c' ,'LineWidth', gr2)
FigureWhitedrZM();
% legend('Piezo', 'R 0,1 m', 'X 0,1 m', 'R 0,3 m', 'X 0,3 m', ...
% 'R 0,5 m', 'X 0,5 m', 'R 1 m', 'X 1 m', ...
% 'R 3 m', 'X 3 m');
legend('{\itP}_~', '{\itR}_~', '{\itX}_~', '{\itK_u}_~','{\itC}_~')
%legend('{\itP}_~', '{\itR}_~', '{\itX}_~', '{\itK''}_~','{\itC}_~')
%title(sciezka_plik)
xlabel('{\itt} [s]'), ylabel('Profil [V]')
grid on
hold off
end