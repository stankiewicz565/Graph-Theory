function forest=Find_BFS_forest(name)
list=dlmread('list.txt');%read the .txt file
len=size(list);% len is the lenght of the list show how many different edges there are
n=list(1,1); %number of nodes
nodelist=1:n; % number of the nodes variable to use in loop
edgelist=Find_edge_list('list.txt');%use the function to get the edgelist talk to Lippner!
new=[]; %new 0x0 matrix
forest=[];
k=1;%counter used in loop
%% function for the BFS
while sum(cellfun('isempty', edgelist))<n %check whether all the nodes in the edgelist have been used
    newcopy=new;
    new=[];
    if isempty(newcopy)==1
        node=nodelist;
        if isempty(forest)==1
             node=node;
             i=-1;
        else
        node(forest(1,:))=[];
        i=forest(2,end);
        end
        s=[min(node);i+1];
        forest=horzcat(forest,s);
        new=cell2mat(edgelist(1,min(node)));
        forest=horzcat(forest,[new;zeros(1,size(new,2))+i+2]);
    else 
        while k<=size(newcopy,2)%search the neighbors of new nodes
        new=[new,cell2mat(edgelist(1,newcopy(1,k)))];
        k=k+1;
        end
        forest=[forest,[new;zeros(1,size(new,2))+i+1]];
        i=forest(2,end);
    end
   %%  when finish the point i, just delete it from the eagelist
 for m=1:n
    for f=1:size(forest,2)
    edgelist{1,m}=edgelist{1,m}(find(edgelist{1,m}~=forest(1,f)));%get the new edgelist without visted nodes
    end
 end
  k=1;
end
end



