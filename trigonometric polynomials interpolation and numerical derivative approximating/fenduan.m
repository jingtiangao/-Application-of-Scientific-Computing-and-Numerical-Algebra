function y = fenduan(x)
%FENDUAN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
sz=[];
sz = size(x);
N =sz(2);
y=zeros(1,4);
i=1;
while (i<=N)
if( x(i)>=0 && x(i)<= pi)
y(i)=x(i);
elseif (x(i)>=pi && x(i)<= 2*pi)
y(i)=2*pi-x(i);
end
i=i+1;
end
return
