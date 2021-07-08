function [G,d,x2,N,rkNorm,NormRatio]=Jacobi_iterative(A,b)
n=size(A);
if n(1)~=n(2)
    error('矩阵A不是方阵');
end

%初始化
N=1;%迭代次数
%X=zeros(N,n)%存储每次迭代解出的x，迭代次数N
B=zeros(n);%用B表示L+U
D=zeros(n);
G=zeros(n);
x=zeros(n(1),1);%生成全0的n维列向量
d=ones(n(1),1);
B=A;
for i=1:n
    B(i,i)=0;
    D(i,i)=A(i,i);
end
%迭代开始
G=-inv(D)*B;
if vrho(G)>1
    error('jacobi迭代不收敛');
end
d=inv(D)*b;
x1=x;
x2=G*x+d;
while norm(b-A*x2,2)>10^(-2)
    x1=x2;
    x2=G*x2+d;
    N=N+1;
end
rkNorm= norm(b-A*x2,2);
NormRatio=rkNorm/norm(b-A*x1,2);
x=x2;
end