function L=Laplacian(A)
%get the D
D=zeros(size(A));
for i=1:size(A,1)
  D(i,i)=nnz(A(i,:));
end
%calculate L
L=D-A;
end