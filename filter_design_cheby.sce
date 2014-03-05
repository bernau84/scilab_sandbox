D = 8;
PRE = 2^16;
FS = 176470.59;

Fs_ds = FS / D;
Fstop_rel = Fs_ds / FS / 2 / 2;

//1.pokus udelat rovnou pasmovou propust
//hn = eqfir(128, [0 0.1*Fstop_rel; 0.4*Fstop_rel 0.6*Fstop_rel; 2.0*Fstop_rel 0.5], [0 1 0], [1 1 0.5]);

//2. lepsi varinata se spoustou tapu a dolni propusti - lze posouvat
hn = eqfir(160, [0 0.8*Fstop_rel; 1.2*Fstop_rel 0.5], [1 0], [1 1]);

[hm, fr] = frmag(hn, 256);
//plot(fr*FS, hm);

N = max(size(hn))
t = 0 : N-1;

for d=1:D
    hn_sh(d, :) = 2* hn .* cos(%pi*(2*d-1)*t/D/2);
    hn_f_sh(d, :) = round(hn_sh(d, :) .* 2^16);
    [hm(d, :), fr] = frmag(hn_f_sh(d, :), 256);
end

write('equi_8bands_160coe_16b.txt', hn_f_sh);
plot(fr*FS, hm);
