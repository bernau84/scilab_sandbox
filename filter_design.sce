D = 8;
PRE = 2^16;
FS = 176470.59;

Fs_ds = FS / D;
Fstop_rel = Fs_ds / FS / 2 / 2;
hn = eqfir(128, [0 0.1*Fstop_rel; 0.4*Fstop_rel 0.6*Fstop_rel; 2.0*Fstop_rel 0.5], [0 1 0], [1 1 0.5]);
//hn = eqfir(160, [0 0.8*Fstop_rel; 1.2*Fstop_rel 0.5], [1 0], [1 1]);
//[hm, fr] = frmag(hn, 256);
//plot(fr*FS, hm);

hn_f = round(hn .* 2^16);
[hm, fr] = frmag(hn_f, 256);
plot(fr*FS, hm);

N = max(size(hn_f))
t = 0 : N-1;
hn_sh = 2* hn .* cos(%pi*7*t/D/2);

hn_f_sh = round(hn_sh .* 2^16);
[hm, fr] = frmag(hn_f_sh, 256);
plot(fr*FS, hm);
