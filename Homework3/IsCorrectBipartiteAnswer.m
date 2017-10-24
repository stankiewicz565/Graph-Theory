function [ correct ] = IsCorrectBipartiteAnswer(A, answer )

if answer.^2 == answer
    answer = logical(answer);
    correct = isempty(find(A(answer,answer),1)) & isempty(find(A(~answer,~answer),1));        
else
    correct = 1;
    if mod(length(answer),2)== 0
        correct = 0;
    end
    for i = 2:length(answer)
        if ~A(answer(i-1),answer(i))
            correct = 0;
        end
    end
    if ~A(answer(1),answer(end))
        correct = 0;
    end
end

end

