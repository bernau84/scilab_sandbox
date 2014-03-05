D = 16;
PRE = 2^16;
FS = 176470.59;
N = 64;

hd=[ones(1,N/2/D) 0.5 0*ones(1,N-1-N/2/D)];//desired samples
hd_appr=fsfirlin(hd,1);//real freq.
hn = ifft(hd_appr);
[hm, fr] = frmag(real(hn), 256);
plot(fr*FS, [hm, hd_appr]);

//pas=1/prod(size(hn))*.5;
//fg=0:pas:.5;//normalized frequencies grid
//n=prod(size(hn))
//plot(fg(1:n),hn);
//
//N = max(size(hn_f))
//t = 0 : N-1;
//hn_sh = 2* hn .* cos(%pi*7*t/D/2);
//
//hn_f_sh = round(hn_sh .* 2^16);
//[hm, fr] = frmag(hn_f_sh, 256);
//plot(fr*FS, hm);