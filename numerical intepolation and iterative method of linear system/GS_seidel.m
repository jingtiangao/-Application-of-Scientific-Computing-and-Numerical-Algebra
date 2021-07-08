function [G,d,x2,N,rkNorm,NormRatio]=GS_seidel(A,b)
n=size(A);
if n(1)~=n(2)
    error('����A���Ƿ���');
end

%��ʼ��
N=1;%��������
L=zeros(n);%�ֽ�A=D+L+U,D�ǶԽ���L����������U����������
U=zeros(n);
D=zeros(n);
G=zeros(n);%G=-inv(D+L)*U
d=ones(n(1),1);%d=inv(D+L)*b
x=zeros(n(1),1);

for i=1:n%��ʼ��L��U
    for j=1:n
        if i<j
            L(i,j)=A(i,j);
        end
        if i>j
            U(i,j)=A(i,j);
        end
    end
end
for i=1:n%��ʼ��D
    D(i,i)=A(i,i);
end
G=-inv(D+L)*U;%��ʼ��G
d=(D+L)\b;%��ʼ��d

if vrho(G)>=1
    error('Gauss-Seidel��������������');
end
%������ʼ
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

