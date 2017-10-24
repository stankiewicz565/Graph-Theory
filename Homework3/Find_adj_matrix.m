%% Find_adj_matrix(name) function
function graphmatrix=Find_adj_matrix(name)
%this function read the file and transfer the list into matrix
list=dlmread(name)%read the .txt file
len=size(list);
n=list(1,1);
graphmatrix=zeros(n);
for k=2:len(1)
    graphmatrix(list(k,1),list(k,2))=1;
    graphmatrix(list(k,2),list(k,1))=1;
end%end of matrix
end%end of function1



%% Find_edge_list(file) function
function edgelist=Find_edge_list(name)
list=dlmread(name);%read the .txt file
length=size(list);
n=list(1,1);
edgelist=cell(1,n);
i=1;
while i<=n%i is the number of nodes
  for k=2:length(1)%k is the egdes rows, check the edges by the node one by one
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
        edgelist{1, i}=edgelist{1, i};
    end
  end
  i=i+1;
end
end



%% function3




