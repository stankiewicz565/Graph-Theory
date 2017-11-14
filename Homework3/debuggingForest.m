function forest=debuggingForest(name)
list=dlmread(name);%read the .txt file
len=size(list);
n=list(1,1);
nodelist=1:n;
%find a way that this is not displayed in the output
edgelist=Find_edge_list(name);%use the function to get the edgelist
new=[];
forest=[];
k=1;
a=nodelist;
counter=0;
%% function for the BFS
%0 is a boolen logice for false so while their is stuff in a
while isempty(a)==0 %check whether all the nodes in the have been used
    newcopy=new;

%     disp('newcopy')
%     disp(newcopy)

    new=[];
    if isempty(newcopy)==1
        node=nodelist;
% %         disp('counter:') 
%           disp(counter) 
%           disp('node') 
%           disp(node) 
%           counter = counter+1;
        if isempty(forest)==1
             node=node;
             i=-1;       
        disp('counter:') 
        disp(counter)  
        ]
        counter = counter+1;
        
        else
        node(forest(1,:))=[];
        i=forest(2,end);
        end 
        s=[min(node);0];
        forest=horzcat(forest,s);
        new=cell2mat(edgelist(1,min(node)));
        forest=horzcat(forest,[new;zeros(1,size(new,2))+1]);
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
  a=nodelist;
  a(forest(1,:))=[];
end


