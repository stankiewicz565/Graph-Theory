function forest=Find_BFS_forest(name)
list=dlmread(name);%read the .txt file
len=size(list);
n=list(1,1);
nodelist=1:n;
edgelist=Find_edge_list(name);%use the function to get the edgelist
new=[];
forest=[];
a=nodelist;
%% function for the BFS
while isempty(a)==0 %check whether all the nodes in the have been used
    newcopy=new;
    new=[];
    if isempty(newcopy)==1
        node=nodelist;
        if isempty(forest)==1
             node=node;
        else
        node(forest(1,:))=[];
        end
        s=[min(node);0];
        forest=horzcat(forest,s);
        new=cell2mat(edgelist(min(node),1));
        forest=horzcat(forest,[new;zeros(1,length(new))+min(node)]);
    else
        k=1;
        while k<=size(newcopy,2)%search the neighbors of new nodes
        new2=cell2mat(edgelist(newcopy(1,k),1));
        new=[new,cell2mat(edgelist(newcopy(1,k),1))];
        forest=[forest,[new2;zeros(1,length(new2))+newcopy(1,k)]];
        for m=1:n
            for f=1:length(new2)
        edgelist{m,1}=edgelist{m,1}(find(edgelist{m,1}~=new2(f)));%get the new edgelist without visted nodes
            end
        end
        k=k+1;
        end
    end
   %%  when finish the point i, just delete it from the eagelist
 for m=1:n
    for f=1:size(forest,2)
    edgelist{m,1}=edgelist{m,1}(find(edgelist{m,1}~=forest(1,f)));%get the new edgelist without visted nodes
    end
 end
  a=nodelist;
  a(forest(1,:))=[];
end
end



