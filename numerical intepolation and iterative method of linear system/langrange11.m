function [k,rkNorm,NormRatio]=langrange(p)
n = 2^p;
R = 'N';
G = numgrid(R,n);
spy(G)
title('A Finite Difference Grid')

g = numgrid(R,10)

D = delsq(G);
spy(D)
title('The 5-Point Laplacian')
N = sum(G(:)>0)
rhs = ones(N,1);
if (R == 'N') % For nested dissection, turn off minimum degree ordering.
   spparms('autommd',0)
   %u = D\rhs;
   [G1,d,u,k,rkNorm,NormRatio]=Jacobi_iterative(D,rhs);
   %u=gaussMethod(D,rhs);
   spparms('autommd',1)
else
  % u = D\rhs; % This is used for R=='L' as in this example
  u=gaussMethod(D,rhs);
end

U = G;
U(G>0) = full(u(G(G>0)));
clabel(contour(U));
prism
axis square ij


