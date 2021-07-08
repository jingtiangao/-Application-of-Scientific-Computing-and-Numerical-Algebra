function z= ODEBVP(p,q,r,a,b,ga,gb,N)
%A program to solve the two-point boundary
%value problem
%y"=p(x)y'+q(x)y+r(x)  a<x<b
%y(a)=ga, y(b)=gb
%Input p,q,r  coefficient functions
%a,b: the end-points of the interval
% ga,gb: the prescribed function values at the end-points
% N: number of subintervals
% Output:
% z is the solution values
% z=ODEBVP('p','q','r',a,b,ga,gb,100)
%
N1=N+1;
h=(b-a)/N;
h2=h*h;
xx=linspace(a,b,N1)';
yy=zeros(N1,1);
yy(1) = ga;
yy(N1)= gb;
%Define the subdiagonal avec, mian diagonal bvec
% superdiagonal cvec
pp(2:N) = feval(p,xx(2:N));
avec(1:N-2)= -1-(h/2)*pp(3:N);
bvec(1:N-1)= 2+h2*feval(q,xx(2:N));
cvec(1:N-2)= -1+(h/2)*pp(2:N-1);
%Define the right-hand-side vector fvec
fvec(1:N-1) = -h2*feval(r,xx(2:N));
fvec(1) = fvec(1)+(1+h*pp(2)/2)*ga;
fvec(N-1)=fvec(N-1)+(1-h*pp(N)/2)*gb;
%Solve the tridiagonal system
TD = full(gallery('tridiag',N-1,avec , bvec , cvec));
[L,U]=lu(TD);
z=U\(L\fvec');
return 

