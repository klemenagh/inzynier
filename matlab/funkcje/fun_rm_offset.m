function s=fun_rm_offset(s)
%liczba probek do obliczenia sr-edniego poziomu
sr = 50;
%petla 3 metrowa
fprintf('Offset 3m [X:R].\n');
s.X3m=rm_offset(s.X3m,sr);
s.R3m=rm_offset(s.R3m,sr);

%petla 1 metrowa
fprintf('Offset 1m [X:R].\n');
s.X1m=rm_offset(s.X1m,sr);
s.R1m=rm_offset(s.R1m,sr);

%petla 0,5 metrowa
fprintf('Offset 0.5m [X:R].\n');
s.X05m=rm_offset(s.X05m,sr);
s.R05m=rm_offset(s.R05m,sr);

%petla 0,3 metrowa
fprintf('Offset 0.3m [X:R].\n');
s.X03m=rm_offset(s.X03m,sr);
s.R03m=rm_offset(s.R03m,sr);

%petla 0,1 metrowa
fprintf('Offset 0.1m [X:R].\n');
s.X01m=rm_offset(s.X01m,sr);
s.R01m=rm_offset(s.R01m,sr);

%piezo1, %piezo2
fprintf('Offset piezo [1:2].\n');
s.P1=rm_offset(s.P1,sr);
s.P2=rm_offset(s.P2,sr);
end