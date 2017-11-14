function edgelist=Find_edge_list(name)
list=dlmread(name);%read the .txt file
len=size(list);
n=list(1,1);
edgelist=cell(1,n);
if len==1
   edgelist=edgelist;
else 
 i=1;
 while i<=n%i is the number of nodes
  for k=2:len(1)%k is the egdes rows, check the edges by the node one by one
    if list(k,1)==i||list(k,2)==i% check whether there is the edge related to node i
        a=list(k,:);
        new=a(find(a~=i));%pick the another node in the edge as the new element
        %check whether their already exists the new element
        if isempty(find(edgelist{1, i}==new))==1
            edgelist{1, i}=[edgelist{1, i},new];%if not, add the element to the vector
        else
            edgelist{1, i}=edgelist{1, i};%if yes, do not add the new element
        end%end the add new element
    else
        edgelist{1,i}=edgelist{1,i};
    end
    edgelist{1,i}=sort(edgelist{1,i});
  end
  i=i+1;
 end
end
end


