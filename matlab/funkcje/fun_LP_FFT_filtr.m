function y_filtr = fun_LP_FFT_filtr(y, pro)
L = length(y);
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT);
%% filter przez zerowanie wyzszych prozkow
% pro = NFFT; % ile prozkow do przeniesienia z 1, reszta 0.
Y = [Y(1:pro); zeros(1,NFFT-pro)'];
y_filtr = real(ifft(Y,NFFT));
y_filtr = 2*y_filtr(1:L);
end