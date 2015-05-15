function s=unormowanie_do1(s)
    %Mmax=max(max(abs(s)));
    Mmax=max(s);
    if Mmax>0
        s=s./Mmax;
    end
end