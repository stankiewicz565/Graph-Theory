function plot=Rubberband_plot(filename)
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

%pick up the first three node as the pinned nodes with the location is
%(1,0),(3,0),(2,2)
B=L(4:end,1:3);
K=L(4:end,4:end);
x=[1;3;2];
y=[0;0;2];
X=-inv(K')*B*x;
Y=-inv(K')*B*y;
Xx=[x;X];
Yy=[y;Y];
%plot the graph
newlocation=[Xx,Yy];
gplot(A,newlocation,'-*')
end

                       