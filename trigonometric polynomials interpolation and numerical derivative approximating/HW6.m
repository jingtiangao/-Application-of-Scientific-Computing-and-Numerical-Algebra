N=32;
h = 2*pi/N;
x=[0:h:2*pi*(1-1/N)];
Fy=dft(N,'fenduan(x)');
fourier(N,Fy,x);

mesh=[0:0.01*pi:2*pi];

error=fenduan(mesh)-fourier(N,Fy,mesh);

norm(error,'inf')