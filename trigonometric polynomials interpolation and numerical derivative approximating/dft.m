function fc=dft(N,f)
%DFT Discrete Fourier transform.
% FC=DFT(N,F) computes the coefficients of the discrete Fourier
% transform of a function F. fx = eval(f); 
h = 2*pi/N;
x=[0:h:2*pi*(1-1/N)];  fx = eval(f);
wn = exp(-i*h);
for k=0:N-1,
s = 0;
for j=0:N-1
s = s + fx(j+1)*wn^((k-N/2)*j);
end
fc (k+1) = s/N;
end
return