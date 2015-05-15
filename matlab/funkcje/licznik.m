function wy=licznik(y)
% licznik impulsów prostk¹tnych 0-5V
wy=0;             % Liczba impulsów w sygnale y (piezo)
f_H=0;              % flaga stanu wysokiego w czasie tx
prog=2;

len=length(y);       % liczba probek sygnalu y

for k = 1:1:len
    if     y(k) < prog && f_H==0
        % nic
    elseif y(k) > prog && f_H==0
            f_H=1;            % stan wysoki y
            wy=wy+1;      % inkrementacja numeru impulsu
    elseif y(k) < prog && f_H==1
            f_H=0;            % stan niski y
   end
end
