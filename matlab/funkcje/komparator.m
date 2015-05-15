function wy=komparator(y,prog,hist)
f_H=0;              % flaga stanu wysokiego w czasie tx
len=length(y);       % liczba probek sygnalu y
wy(len)=0;
progN=prog+hist/2;
progO=prog-hist/2;
for ti = 1:1:len
    if     y(ti) < progN && f_H==0
        % nic
    elseif y(ti) >=progN && f_H==0
            f_H=1;            % stan wysoki y
    elseif y(ti) < progO && f_H==1
            f_H=0;            % stan niski y
    end
   if f_H
       wy(ti)=5;
   end
end

