function fv = idft(N,fc)
%IDFT Inverse discrete Fourier transform.
% FV=IDFT(N,F) computes the coefficients of the inverse discrete Fourier
% transform of a function F.
h = 2*pi/N; wn = exp(-i*h);
for k=0:N-1
s = 0;
for j=0:N-1
s = s + fc(j+1)*wn^(-k*(j-N/2));
end
fv (k+1) = s;
end
return