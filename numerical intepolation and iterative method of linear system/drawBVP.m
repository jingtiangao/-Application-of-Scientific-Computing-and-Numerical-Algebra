p=@(x) 0
q=@(x) x.*x
r=@(x) -(1+4*x+2*x.*x-x.*x.*x.*x).*exp(x)
i=1
 while(i<14)
     N=2^i;
     h=1/N;
     N1=N+1;
     oh=linspace(1/N,1,N-1)';
     OY=(1-oh.*oh).*exp(oh);
     z=ODEBVP(p,q,r,0,1,1,0,N);
     Col(i,1)=h;
     Col(i,2)=norm(z-OY,'inf');
     Col(i,3)=norm(z-OY,'inf')/(h*h);
     i=i+1
    
 end
