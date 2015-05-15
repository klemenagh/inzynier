function rysunek_rej(syg, plik)
t=syg.t; 
gr=2.0;
gx=1.0;
or=6.0; %offset R
ox=0; %offset X
figure(1)
plot(t, syg.P1+ox, 'c' ,'LineWidth', gx), hold on
plot(t, syg.P2+ox, 'y' ,'LineWidth', gx)
plot(t, syg.R3m+or, 'c' ,'LineWidth', gr)
plot(t, syg.X3m+ox, 'c' ,'LineWidth', gx)
plot(t, syg.R1m+or, 'g' ,'LineWidth', gr)
plot(t, syg.X1m+ox, 'g' ,'LineWidth', gx)
plot(t, syg.R05m+or, 'b' ,'LineWidth', gr)
plot(t, syg.X05m+ox, 'b' ,'LineWidth', gx)
plot(t, syg.R03m+or, 'r' ,'LineWidth', gr)
plot(t, syg.X03m+ox, 'r' ,'LineWidth', gx)
plot(t, syg.R01m+or, 'k' ,'LineWidth', gr)
plot(t, syg.X01m+ox, 'k' ,'LineWidth', gx)
% FigureWhitedrZM();
legend_handle=legend('Piezo1', 'Piezo2', ...
    'R3m', 'X3m', ... 
    'R1m', 'X1m', ... 
    'R05m', 'X05m', ...
    'R03m', 'X03m', ...
    'R01m', 'X01m', ... 
    'Location', 'EastOutside' );
xlabel('{\itt} [s]')
ylabel('Profil [V]')
% Create textbox
% annotation(1,'textbox',...
%     [0.727631578947366 0.812080167233293 0.184868421052634 0.122151638696627],...
%     'String',{'R_o_f_f_s_e_t dodany','sztucznie'},...
%     'FitBoxToText','off',...
%     'LineStyle','none');
plik=strrep(plik,'_',' ');
plik=strrep(plik,'.lvm','');
title(plik)
grid on
hold off
end