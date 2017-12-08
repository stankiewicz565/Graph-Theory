function [part1, part2]=Find_partition(A)
%get the D
%this is not making a square matrix its just a single row of zeros

D=zeros(size(A));

for i=1:size(A,1)
  D(i,i)=nnz(A(i,:));
end
%calculate delta
P=pinv(D)*A;
delta=eye(size(A))-P;
%calculate the eigenvalues of delta
[V,mu]=eigs(delta,2,'SR');
%Find the eigenvector of corresponding to the eigenvalue mu2(second smallest mu). Denote this vector by y.
y=V(:,2);

%find the all the combinations of subset S
S={};
for i=1:size(A,1)
    S{i}=find(y<=y(i));
end

%calculate C
C=zeros(1,size(A,1));
minsize=zeros(1,size(A,1));
E=zeros(1,size(A,1));

for i=1:size(A,1)
    minsize(i)=min(numel(S{i}),size(A,1)-numel(S{i}));%calculate the min size of subsets
    AE=A(cell2mat(S(i)),:);
    AE(:,cell2mat(S(i)))=[];
    E(i)=nnz(AE);%claculate the edges
    C(i)=E(i)/minsize(i);%calculate C by the E, minsize
end

%find the minimum of C
j=find(C==min(C));
part11=S{j};
part11=part11.';
part21=1:size(A,1);
part21(part11)=[];
part21=part21;
if ismember(1,part11)==1
part1=part11;
part2=part21;
else
part1=part21;
part2=part11;
end

end












