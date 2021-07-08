function [G,d,x2,N,rkNorm,NormRatio]=Jacobi_iterative(A,b)
n=size(A);
if n(1)~=n(2)
    error('����A���Ƿ���');
end

%��ʼ��
N=1;%��������
%X=zeros(N,n)%�洢ÿ�ε��������x����������N
B=zeros(n);%��B��ʾL+U
D=zeros(n);
G=zeros(n);
x=zeros(n(1),1);%����ȫ0��nά������
d=ones(n(1),1);
B=A;
for i=1:n
    B(i,i)=0;
    D(i,i)=A(i,i);
end
%������ʼ
G=-inv(D)*B;
if vrho(G)>1
    error('jacobi����������');
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