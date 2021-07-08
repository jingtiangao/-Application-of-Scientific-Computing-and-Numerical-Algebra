function y=F0(h,x1)
x0=x1-h;
x2=x1+h;
y0=exp(x0)*sin(3*x0);
y1=exp(x1)*sin(3*x1);
y2=exp(x2)*sin(3*x2);
y = (y0+y2-2*y1)/(h*h);
end
