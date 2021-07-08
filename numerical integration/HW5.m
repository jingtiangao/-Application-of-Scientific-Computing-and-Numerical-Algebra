alpha=1;
y=@(x) x.^1.*log(x)
I=integral(y,0,1);
M=zeros(1,9);
i=1;
while (i<10)
M(i)=2^(i);
i=i+1;
end

ETRA=zeros(1,9);

i=1;
while (i<10) 
  ETRA(i)= I- trapezc(0.0000000000000001,1,M(i),'(x.^1).*log(x)');
  i=i+1;
end
RTRA=zeros(1,8);
i=1;
while (i<9)
    RTRA(i)=ETRA(i)/ETRA(i+1);
    i=i+1;
end



