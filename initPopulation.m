function [ population ] = initPopulation(size)
%Initializes the population with random values
%   The chromosome is comprised of a concatenated binary string
%   Each chromosome is made up of genes
%   Gene0: SP-wave rate: SP%
%   Gene1: maximum SP-minus change rate: SP%-
%   Gene2: maximum number of days to hold bought stocks
%   Gene3: minimum up rate to sell bought stocks
%   Gene4: minimum down shooting
%   Gene5: maximum price level
    
    population = zeros(6,24,size);
    for i = 1 : size
            population(:,:,i) = round(randi([0 1],6,24));
    end
end

