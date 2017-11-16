function answer=Is_bipartite(name)
list=dlmread(name);% read the .txt file
len=size(list);
n=list(1,1);
nodelist=1:n;
edgelist=Find_edge_list(name);% use the function to get the edgelist
new=[];
forest=[];
k=1;
a=nodelist;
%% function for the BFS
while isempty(a)==0 % check whether all the nodes in the have been used
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
        new=cell2mat(edgelist(min(node),1));
        forest=horzcat(forest,[new;zeros(1,size(new,2))+1]);
    else
        k=1;
        while k<=size(newcopy,2)% search the neighbors of new nodes
        new=[new,cell2mat(edgelist(newcopy(1,k),1))];
        k=k+1;
        end
        new=unique(new);
        i=forest(2,end);
        forest=horzcat(forest,[new;zeros(1,length(new))+i+1]);
    end
   %%  when finish the point i, just delete it from the eagelist
 for m=1:n
    for f=1:size(forest,2)
    edgelist{m,1}=edgelist{m,1}(find(edgelist {m,1}~=forest(1,f)));% get the new edgelist without visted nodes
    end
 end
  a=nodelist;
  a(forest(1,:))=[];
end
 
%find the bipartite
graphmatrix=Find_adj_matrix(name);
ncomp=sum(forest(2,:)==0); %find how many original point and let it be the number of components in the graph
complist=cell(1,ncomp);%creat a new cell array to save the components
array=[];
bw=[];
%check whether the information is enough
if len<=1,
    answer=sprintf('please give more edges information%/n');
else
%label the node with black and white, set black to be 0, and white to be 1

for p=1:size(forest,2)
     bw(p)=(1+(-1)^forest(2,p))/2;
end
information=[forest;bw];

%cut the forest into small components
i=0;
k=1;
  while k<=size(information,2)%use function to get nodes in each component
      if information(2,k)==0
          i=i+1;
          complist{1,i}=[complist{1,i},information(:,k)];
      else
          i=i;
          complist{1,i}=[complist{1,i},information(:,k)];
      end
      k=k+1;
  end
  
%check whether the graph is bipartite
i=1;
while i<=length(complist)
    j=1;
    while j<size(complist{1,i},2)
          f=j;
        for m=(j+1):size(complist{1,i},2)
            %check whether the nodes has the same label are connected
            if graphmatrix(complist{1,i}(1,j),complist{1,i}(1,m))==1&&complist{1,i}(3,j)==complist{1,i}(3,m)
               decision='not bipartite ';
               %find the odd cycle
               %path starting from the jth node
               array1=[complist{1,i}(1,j)];
               while j>1
               h=j-1;
               while h>=1
                   if complist{1,i}(2,h)==(complist{1,i}(2,j)-1)&&graphmatrix(complist{1,i}(1,j),complist{1,i}(1,h))==1
                       array1=[array1,complist{1,i}(1,h)];
                       j=h;
                       h=h-1;
                   else
                       j=j;
                       h=h-1;
                   end
               end
               end
                
               %path starting from the mth node
               array2=[complist{1,i}(1,m)];
               while m>1
                   h=m-1;
               while h>=1
                   if complist{1,i}(2,h)==(complist{1,i}(2,m)-1)&&graphmatrix(complist{1,i}(1,h),complist{1,i}(1,m))==1
                       array2=[array2,complist{1,i}(1,h)];
                        m=h;
                       h=h-1;
                   else
                       m=m;
                       h=h-1;
                   end
               end
               end
               array2=fliplr(array2);
               array2(1)=[];
               %combine the array1 and array2 as the final array
               array=[array1,array2];
               vector=array;
               answer=vector;
               %answer=sprintf('the graph is %s, and the array is [%s]%/n',decision,vector);
               return
            else
               decision='bipartite ';
               array=sortrows(information',1);
               array=array(:,3)';
               vector=array;
               answer=vector;
               %answer=sprintf('the graph is %s, and the array is [%s]%/n',decision,vector);
            end
        end
        j=j+1;
    end
    i=i+1;
end
end
end