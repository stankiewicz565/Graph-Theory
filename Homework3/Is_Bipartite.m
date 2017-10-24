function Is_Bipartite
list=dlmread('list.txt');
n=list(1,1); %this is the number of nodes

forest=Find_BFS_forest('list.txt');

disp(forest)
%the five should be n but there is a problem with Find_BFS with
%disconnected graphs shoule be fixed by may
%use the forest created from the last problem'
%take the second line and have 0=0  and all odds =1 and evens =0
bottomLineOfForest=forest(2,1:5);
topLineOfForest=forest(1,1:5);
%again 5 should be n
labels=zeros(1,5);
%again 5 should be n
for i=1:5
node = forest(1,i);
parent = forest(2,i);
if parent > 0
   labels(node) = 1-labels(parent); 
end
end

%completeTable = [topLineOfForest; bottomLineOfForest];
%disp(labels)
%disp(completeTable)
end

