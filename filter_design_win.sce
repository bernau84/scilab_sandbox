D = 20;
PRE = 2^16;
FS = 176470.59;

Fs_ds = FS / D;
Fstop_rel = Fs_ds / FS / 2 / 2;

//sinc metoda z ideainiho filtru pomoci fce filt_sinc
//takze obdelnikove okno
//hn = ffilt("lp", 160, 0.8*Fstop_rel, 1.2*Fstop_rel);
//[hm, fr] = frmag(hn, 256);

//kaiser parametricke okno
[hn, hm, fr] = wfir("lp", 64, [Fstop_rel, 0], "kr", [4, 2.0]);
//plot(fr*FS, hm);

hn_f = round(hn .* 2^16);
//[hm, fr] = frmag(hn_f, 256);
//plot(fr*FS, hm);
//
N = max(size(hn_f))
t = 0 : N-1;
hn_sh = 1.4144272 * hn .* cos(%pi*1*t/D/2);//po pravde nejsem si jist proc ta normalizace

hn_f_sh = round(hn_sh .* 2^16);
[hm, fr] = frmag(hn_f_sh, 256);
plot(fr*FS, hm);

//write('fir10D_shifted_64T_16bprec', hn_f_sh');