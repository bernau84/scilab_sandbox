N = 256;
n = 0:N-1;
x = sin(2*%pi*n/N*25) +  sin(2*%pi*n/N*50);
x_m = x .* cos(%pi*n); //mirroring?

figure;
subplot(2,1,1); plot(x);
subplot(2,1,2); plot(abs(fft(x)));

figure;
subplot(2,1,1); plot(x_m);
subplot(2,1,2); plot(abs(fft(x_m)));


