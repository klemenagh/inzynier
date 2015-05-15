function syg=fun_load(sciezka)
%% fun. laduje dane i rozdziela na sygnaly, fun. zwraca struct
dane = load(sciezka); 
t=dane(:,1); %wektor czasu
%petla 3 metrowa
X3m=dane(:,2);
R3m=dane(:,3);
%petla 1 metrowa
X1m=dane(:,4);
R1m=dane(:,5);
%petla 0,5 metrowa
X05m=dane(:,6);
R05m=dane(:,7);
%petla 0,3 metrowa
X03m=dane(:,8);
R03m=dane(:,9);
%petla 0,1 metrowa
X01m=dane(:,10);
R01m=dane(:,11);
%piezo1, %piezo2
P1=dane(:,12);
P2=dane(:,13);
%sygnaly
syg.R3m=R3m;
syg.X3m=X3m;
syg.R1m=R1m;
syg.X1m=X1m;
syg.R05m=R05m;
syg.X05m=X05m;
syg.R03m=R03m;
syg.X03m=X03m;
syg.R01m=R01m;
syg.X01m=X01m;
syg.P1=P1;
syg.P2=P2;
syg.t=t;
end
