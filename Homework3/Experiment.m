%set n=200, then we would like to draw graph which reflecting the
%relationship between p and q, set q as x-axis and p and y-axis.
q=[.00:.04:1];
for i=1:length(q)
    p=[q(i):.02:1];
    for j=1:length(p)
        [ A, community1, community2 ] = Generate_random_block_model(200,p(j),q(i) );
        [part1, part2]=Find_partition(A);
        common=[intersect(community1,part1),intersect(community2,part2)];
        error(j)=length(common)/400;
    end
    bestp(i)=min(p(find(error<0.1)));
end
        