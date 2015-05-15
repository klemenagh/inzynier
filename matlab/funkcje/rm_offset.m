function s=rm_offset(s, n)
% Funkcja usuwa offset na podstawie �redniej z n pocz�tkowych warto�ci
offset=sum(s(1:n))/n;
fprintf('\toffset = %f\n', offset);
% fprintf('%f ', offset);
s=s-offset;
end