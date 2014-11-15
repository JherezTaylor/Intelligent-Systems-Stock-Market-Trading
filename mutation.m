function[child] = mutation(parent)
    
    % random number between 1 and 6
    mutationPoint = randi(6, 1, 1);
    
    gene = parent(mutationPoint, :);
    
    % applying the inverse to the gene
    for i=1:17
        if gene(i) == 0
            gene(i) = 1;
        elseif gene(i) == 1
            gene(i) = 0;
        end
    end
    
    parent(mutationPoint, :) = gene;
    
    child = parent;
    
end