function [ n ] = check_tasks( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
input_fname = strcat(filename,'.txt');
solution_fname = strcat(filename,'.mat');
my_mAdj = Find_adj_matrix(input_fname);
my_edgeList = Find_edge_list(input_fname);
my_bfsForest = Find_BFS_forest(input_fname);
my_largeComp = Find_largest_component(input_fname);
my_biPart = Is_bipartite(input_fname);
load(solution_fname);
scores = zeros(1,5);
        try
            scores(1) = isequal(mAdj,my_mAdj);
        catch ME
            disp(ME.message);
        end
        try
            scores(2) = cellisequal(edgeList,my_edgeList);
        catch ME
            disp(ME.message);
        end
        try
            scores(4) = isequal(sort(largeComp),sort(my_largeComp));
        catch ME
           disp(ME.message); 
        end
        try
            scores(3) = isequal(bfsForest,my_bfsForest);
        catch ME
            disp(ME.message);
        end
        try
            scores(5) = IsCorrectBipartiteAnswer(mAdj,my_biPart);
        catch ME
            disp(ME.message);
        end
        
    n = scores;
end

