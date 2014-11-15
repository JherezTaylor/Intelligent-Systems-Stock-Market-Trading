%function [child1, child2] = crossover(parent1, parent2, gene0, gene1, gene2, gene3, gene4, gene5)
function [child1, child2] = crossover(parent1, parent2)
    % note that the parent chromosomes being passed in are 2-d arrays (6*17)

    %chromosomeStruct = [gene0, gene1, gene2, gene3, gene4, gene5];
    
    % random number between 1 and 4
    crossoverPoint = randi(4, 1, 1);
    
    % this is a substring of the chromosome starting at position 1 to the crossoverPoint in the array
    % breakpoint = chromosomeStruct(1:crossoverPoint);


    % this pulls the columns from the parents 2d array starting from the random columns between 1-4 and the column after it
    % resulting in a 2 column segment being selected for crossover
    breakpoint1 = parent1([crossoverPoint:(crossoverPoint+1)], :);
    breakpoint2 = parent2([crossoverPoint:(crossoverPoint+1)], :);

    %temp = breakpoint1;
    parent1([crossoverPoint:(crossoverPoint+1)], :) = breakpoint2;
    parent2([crossoverPoint:(crossoverPoint+1)], :) = breakpoint1;
    
    child1 = parent1;
    child2 = parent2;

end