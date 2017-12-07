%set n=120, then we would like to draw graph which reflecting the
%relationship between p and q, set q as x-axis and p and y-axis.
%GenerateNumber is the number of generation the random block model is going
%to make
generateNum= 120;
q=[0:.1:.9];
bestp=zeros(numel(q),1);
for i=1:numel(q)
    p=[q(i)+0.02:.02:1];
    for j=1:numel(p)
        k=1;
        while k<31
        %make the 120 a variable    
        [ A, community1, community2 ] = Generate_random_block_model(generateNum,p(j),q(i));
        [part1, part2]=Find_partition(A);
        common1=[intersect(community1,part1),intersect(community2,part2)];
        common2=[intersect(community1,part2),intersect(community2,part1)];
        length(k)=max(numel(common1),numel(common2));
        k=k+1;
        end
        %here make the 240 the 2*var
        acurracy(j)=(mean(length))/(2*generateNum);
    end
    bestp(i)=p(min(find(acurracy>0.9)));
end
plot(q,bestp(1:numel(q)),'-*b')%From the plot, the distribution might be the format as bestp=a0+a1*exp(-q)+a2*q*exp(-q)
table(q',bestp)



%find the function from the data
t=q';
y=bestp;
X = [ones(size(t))  exp(-t)  t.*exp(-t)];
a=X\y
%From this we get the formula is:
%bestp=1.9252-1.8682*exp(-q)-0.5640*q*exp(-q)

T = (0:0.01:1)';
Y = [ones(size(T))  exp(-T)  T.*exp(-T)]*a;
plot(T,Y,'-',t,y,'o'), grid on
title('Plot of Model and Original Data')






