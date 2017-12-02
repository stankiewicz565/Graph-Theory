function plot=Spectral_plot(filename)
%read the file and find the adjacent matrix
list=dlmread(filename);%read the .txt file
len=size(list);
n=list(1,1);
graphmatrix=zeros(n);
for k=2:len(1)
    graphmatrix(list(k,1),list(k,2))=1;
    graphmatrix(list(k,2),list(k,1))=1;
end
A=graphmatrix;
%find the combinatorial Laplace matrix
L=Laplacian(A);

%find the largest 3 eigenvectors and eigenvalues for L
 [V,mu]=eigs(L,3,'SA');
%let x to be the 2nd smallest eigenvector and y to be 3rd smallest
%eigenvector
 x=V(:,2);
 y=V(:,3);
 coordinates=[x,y];
 
%plot the graph
gplot(A,coordinates,'-*')
end


