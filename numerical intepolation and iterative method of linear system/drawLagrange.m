i=2 

while(i<6)
     N=2^i;
     h=1/N;
     N1=N+1;
     [k,rkNorm,NormRatio]=langrange(i)
     Col(i,1)=h;
     Col(i,2)=k;
     Col(i,3)=rkNorm;
     Col(i,4)=NormRatio;
     i=i+1
    
 end