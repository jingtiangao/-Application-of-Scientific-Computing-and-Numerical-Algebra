function [G,d,x2,N,rkNorm,NormRatio]=GS_seidel(A,b)
n=size(A);
if n(1)~=n(2)
    error('矩阵A不是方阵');
end

%初始化
N=1;%迭代次数
L=zeros(n);%分解A=D+L+U,D是对角阵，L是下三角阵，U是上三角阵
U=zeros(n);
D=zeros(n);
G=zeros(n);%G=-inv(D+L)*U
d=ones(n(1),1);%d=inv(D+L)*b
x=zeros(n(1),1);

for i=1:n%初始化L和U
    for j=1:n
        if i<j
            L(i,j)=A(i,j);
        end
        if i>j
            U(i,j)=A(i,j);
        end
    end
end
for i=1:n%初始化D
    D(i,i)=A(i,i);
end
G=-inv(D+L)*U;%初始化G
d=(D+L)\b;%初始化d

if vrho(G)>=1
    error('Gauss-Seidel迭代法不收敛！');
end
%迭代开始
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

