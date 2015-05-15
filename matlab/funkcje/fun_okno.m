function syg=fun_okno(syg)
len=length(syg.R1m);
a=syg.R3m;
b=syg.X3m;
kwadrat=10.*sqrt(a.^2 + b.^2);
%kwadrat=fun_filtr_fft(kwadrat);
kwadrat=fun_LP_FFT_filtr(kwadrat,30);
kwadrat=rm_offset(kwadrat,50);
pocz = 0;
kon = len;
%bramka(len)=0;
%n=1;
f_H=0;
for k=1:len
    if     kwadrat(k)>0.8 && f_H==0 
           f_H=1;
           pocz=k;  %poczatkowa probka syg. do cieca
    elseif kwadrat(k)<0.5 && f_H==1 
           f_H=3;
           kon=k;   %koncowa probka syg. do ciecia
           break;
    end
    %% DEBUG
%      if f_H==1;
%           bramka(k)=1;
%      end
end
%% DEBUG
%figure(10), plot(syg.t, kwadrat), hold on
%plot(syg.t, bramka)
syg.R3m=syg.R3m(pocz:kon);
syg.X3m=syg.X3m(pocz:kon);
syg.R1m=syg.R1m(pocz:kon);
syg.X1m=syg.X1m(pocz:kon);
syg.R05m=syg.R05m(pocz:kon);
syg.X05m=syg.X05m(pocz:kon);
syg.R03m=syg.R03m(pocz:kon);
syg.X03m=syg.X03m(pocz:kon);
syg.R01m=syg.R01m(pocz:kon);
syg.X01m=syg.X01m(pocz:kon);
syg.P1=syg.P1(pocz:kon);
syg.P2=syg.P2(pocz:kon);
syg.t=syg.t(pocz:kon);
syg.D=syg.D(pocz:kon);
% fix t, D, poczatek od zera
syg.t=syg.t-syg.t(1);
syg.D=syg.D-syg.D(1);
end
