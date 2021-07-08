function int = trapezc(a,b,m,fun)
%TRAPEZC Composite trapezoidal formula
% INT=TRAPEZC(A,B,M,FUN) computes an approximation of the integral of the
% function FUN over (A,B) via the trapezoidal method (with M equispaced intervals).
% FUN accepts a real vector input x and returns a real vector value.
h=(b-a)/m;
x=[a:h:b];
dim=length(x);
y=eval(fun);
if size(y)==1
y=diag(ones(dim))*y;
end
int=h*(0.5*y(1)+sum(y(2:m))+0.5*y(m+1));
return
