
 x=linspace(0,1.5,1500);
 max=prod(size(x))
 i=1
 y=[]
 while(i<max+1)
 [xvect,xdif,fx,nit]= newton(x(i),1.e-10,10000,'cos(2*x).^2-x^2','- 2*x - 4*cos(2*x)*sin(2*x)')   
 y=[y;xvect(end)]
 i=i+1
 end
 plot(x,y)
 xlabel('initial value of x0')
 ylabel('final convergence value')
 title('subintervals for which Newton method is convergent to the zero ')
 
 