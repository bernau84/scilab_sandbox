D = 8;
N = 160; //viz filter_design_xxx.sce

figure;
stacksize('max');
coe = read('c:\Users\bernau84\Documents\work\bats\simulace\equi_8bands_160coe_16b.txt', D, N);
subplot(5,1,1); plot(coe');

x = wavread('c:\Users\bernau84\Documents\work\bats\simulace\chirp_20_8000_fs44kHz_4s.wav');
f_x = (x + 1.0) * (2^11); //offset a prevod na 12b presnost

for d=1:D
    [hm(d, :), fr] = frmag(coe(d, :), 256);
    f_y(d, :) = filter(coe(d, :)', [1], f_x);    
end

//subplot(5,1,2); plot(fr*160000, hm);
//subplot(5,1,3); plot(f_x);

//subplot(5,1,4); plot(f_y);
//f_n = detrend(f_y, "c") ./ (2^17) + (2^11);
f_n = (f_y) ./ (2^17) + (2^11);
//subplot(5,1,4); plot(f_n);
t_2_plot = f_n(:, 1:100:length(f_n));
figure; plot(f_2_plot);
