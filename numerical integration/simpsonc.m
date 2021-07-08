function int = simpsonc(a,b,m,fun)
%SIMPSONC Composite Simpson formula
% INT=SIMPSONC(A,B,M,FUN) computes an approximation of the integral of the
% function FUN over (A,B) via the Simpson method (with M equispaced intervals). FUN
% accepts a real vector input x and returns a real vector value.
h=(b-a)/m;
x=[a:h/2:b];
dim= length(x);
y=eval(fun);
if size(y)==1
y=diag(ones(dim))*y;
end
int=(h/6)*(y(1)+2*sum(y(3:2:2*m-1))+4*sum(y(2:2:2*m))+y(2*m+1));
return
