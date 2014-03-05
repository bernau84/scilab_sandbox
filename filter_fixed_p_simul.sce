
figure;
stacksize('max');
coe = read('cheby80_fir_4kBP_160FS_16b.txt', 80, 1);
//coe = read('fir10D_shifted_64T_16bprec', 64, 1);
subplot(5,1,1); plot(coe);
x = wavread('chirp_20_8000_fs16kHz.wav');
f_x = (x + 1.0) * (2^11); //offset a prevod na 12b presnost
subplot(5,1,3); plot(f_x);
[hm, fr] = frmag(coe, 256);
subplot(5,1,2);plot(fr*160000, hm);
f_y = filter(coe, [1], f_x);
//subplot(5,1,4); plot(f_y);
//f_n = detrend(f_y, "c") ./ (2^17) + (2^11);
f_n = (f_y) ./ (2^17) + (2^11);
subplot(5,1,4); plot(f_n);
subplot(5,1,5); plot(f_n(1:20:length(f_n)));