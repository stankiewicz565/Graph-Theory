function [ A, community1, community2 ] = Generate_random_block_model(n,p,q )
%generates a 2-community random graph on n+n nodes with edge 
%density p within the two communities and with edge 
%density q between the communities. 
% it returns the adjacency matrix of the graph, as well as 
%the two communities (list of node ids sorted).

A = zeros(2*n);

%generate first community

B = triu(rand(n) < p);
B = B+B';
A(1:n,1:n) = B;

% generate second community

B = triu(rand(n) < p);
B = B+B';
A(n+1:end,n+1:end) = B;

% generate inter-community edges

B = rand(n) < q;
A(1:n,n+1:end) = B;
A(n+1:end,1:n) = B';

% remove diagonal

A = A - diag(diag(A));

% randomly relabel nodes

perm = randperm(2*n);

A = A(perm,perm);

community1 = sort(find(perm <= n));
community2 = sort(find(perm > n));

end

