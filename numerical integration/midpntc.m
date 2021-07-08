function int = midpntc(a,b,m,fun)
%MIDPNTC Composite midpoint formula
% INT=MIDPNTC(A,B,M,FUN) computes an approximation of the integral of the
% function FUN over (A,B) via the midpoint method (with M equispaced intervals).
% FUN accepts a real vector input x and returns a real vector value.
h=(b-a)/m;
x=[a+h/2:h:b];
dim=length(x);
y=eval(fun);
if size(y)==1
y=diag(ones(dim))*y;
end
int=h*sum(y);
return

