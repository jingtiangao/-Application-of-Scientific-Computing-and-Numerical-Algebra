
M=zeros(1,9);
i=1;
while (i<10)
M(i)=2^(i-1);
i=i+1;
end
EMID=zeros(1,9);
ETRA=zeros(1,9);
ESim=zeros(1,9);

i=1;
while (i<10) 
  EMID(i)= 2-(2/exp(1))- midpntc(-1,1,M(i),'abs(x).*(exp(x))');
  i=i+1;
end

i=1;
while (i<10) 
  ETRA(i)= 2-(2/exp(1))- trapezc(-1,1,M(i),'abs(x).*(exp(x))');
  i=i+1;
end

i=1;
while (i<10) 
  ESim(i)= 2-(2/exp(1))- simpsonc(-1,1,M(i),'abs(x).*(exp(x))');
  i=i+1;
end
RMID=zeros(1,8);
RTRA=zeros(1,8);
RSim=zeros(1,8);
i=1;
while (i<9)
    RMID(i)=EMID(i)/EMID(i+1);
    i=i+1;
end

i=1;
while (i<9)
    RTRA(i)=ETRA(i)/ETRA(i+1);
    i=i+1;
end

i=1;
while (i<9)
    RSim(i)=ESim(i)/ESim(i+1);
    i=i+1;
end
