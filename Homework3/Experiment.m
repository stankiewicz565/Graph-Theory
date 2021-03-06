%set n=120, then we would like to draw graph which reflecting the
%relationship between p and q, set q as x-axis and p and y-axis.
q=[0:.05:.95];
bestp=zeros(numel(q),1);
i=1;
while i<=numel(q)
j=0;
acurracy=0;
p=q(i);
n=120;%number of the nodes
%use while function to do the loop
while acurracy<=0.9&p<=1
    j=j+1;
    p=q(i)+0.01*j;
    k=1;
        while k<31
        [ A, community1, community2 ] = Generate_random_block_model(n,p,q(i));
        [part1, part2]=Find_partition(A);
        common1=[intersect(community1,part1),intersect(community2,part2)];
        common2=[intersect(community1,part2),intersect(community2,part1)];
        length(k)=max(numel(common1),numel(common2));
        k=k+1;
        end
        acurracy=(mean(length))/(2*n);
end
bestp(i)=p;
i=i+1;
end
    


%find the function from the data
t=q';
y=bestp;
X = [ones(size(t))  exp(-t)  t.*exp(-t)];
a=X\y
%From this we get the formula is:
%bestp=1.9680-1.9202*exp(-q)-0.6303*q*exp(-q)

T = (0:0.01:1)';
Y = [ones(size(T))  exp(-T)  T.*exp(-T)]*a;
plot(T,Y,'-',t,y,'o'), grid on
title('Plot of Model and Original Data of nonlinear fit')    
    
  
%also try linear regression
h=q';
y=bestp;
X = [ones(size(h))  h];
b=X\y

%%the linear function is the: bestp=0.0911+0.9934*q
T = (0:0.01:1)';
Y = [ones(size(T))  T]*b;
plot(T,Y,'-',h,y,'o'), grid on
title('Plot of Model and Original Data by linear model')

lmtable=table(q',bestp)
mdl=fitlm(lmtable)
    
    

