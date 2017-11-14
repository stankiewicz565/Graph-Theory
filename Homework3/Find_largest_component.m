function maxcomponent=Find_largest_component(name)
forest=Find_BFS_forest(name);%get the component tree from BFS function
ncomp=sum(forest(2,:)==0); %find how many original point and let it be the number of components in the graph
complist=cell(1,ncomp);%creat a new cell array to save the components
i=0;
k=1;
  while k<=size(forest,2)%use function to get nodes in each component
      if forest(2,k)==0
          i=i+1;
          complist{1,i}=[complist{1,i},forest(1,k)];
      else
          i=i;
          complist{1,i}=[complist{1,i},forest(1,k)];
      end
      k=k+1;
  end
%check which one component is the largest component
csize=1:ncomp;%creat a vector and assign the number of nodes in each components as its size
for i=1:ncomp
    csize(i)=length(complist{1,i});
end
[val, idx]=max(csize);
maxcomponent=complist{1,idx};% the max component is the component with most nodes.
end
