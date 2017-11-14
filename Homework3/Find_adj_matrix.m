%% Find_adj_matrix(name) function
function graphmatrix=Find_adj_matrix(name)
%this function read the file and transfer the list into matrix
list=dlmread(name);%read the .txt file
len=size(list);
n=list(1,1);
graphmatrix=zeros(n);
for k=2:len(1)
    graphmatrix(list(k,1),list(k,2))=1;
    graphmatrix(list(k,2),list(k,1))=1;
end%end of matrix
end%end of function1


