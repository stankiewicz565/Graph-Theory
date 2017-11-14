function forest=Find_BFS_forest(name)
list=dlmread(name);%read the .txt file
len=size(list);
n=list(1,1);
nodelist=1:n;
edgelist=Find_edge_list(name);%use the function to get the edgelist
new=[];
forest=[];
k=1;
a=nodelist;
%% function for the BFS
while isempty(a)==0 %check whether all the nodes in the have been used
    newcopy=new;
    new=[];
    if isempty(newcopy)==1
        node=nodelist;
        if isempty(forest)==1
             node=node;
             i=-1;
        else
        node(forest(1,:))=[];
        end
        s=[min(node);0];
        forest=horzcat(forest,s);
        new=cell2mat(edgelist(1,min(node)));
        forest=horzcat(forest,[new;zeros(1,size(new,2))+1]);
    else
        k=1;
        while k<=size(newcopy,2)%search the neighbors of new nodes
        new=[new,cell2mat(edgelist(1,newcopy(1,k)))];
        k=k+1;
        end
        new=unique(new);
        i=forest(2,end);
        forest=horzcat(forest,[new;zeros(1,length(new))+i+1]);
    end
   %%  when finish the point i, just delete it from the eagelist
 for m=1:n
    for f=1:size(forest,2)
    edgelist{1,m}=edgelist{1,m}(find(edgelist{1,m}~=forest(1,f)));%get the new edgelist without visted nodes
    end
 end
  a=nodelist;
  a(forest(1,:))=[];
end
end



