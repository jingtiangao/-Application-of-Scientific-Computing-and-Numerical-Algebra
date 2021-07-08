function y=fourier(N,Fy,x)
s=0;
for j=0:N-1
    s=s+Fy(j+1)*exp(1i*(j-N/2).*x);
end
y=s;
return