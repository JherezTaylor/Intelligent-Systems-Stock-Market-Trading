function [ result ] = calculateEncoding(x,y)
%calculateEncoding is used get the required amount of bits in a gene
%   It takes in a range and returns the amount of bits required to
%   represent that range
%   Let the domain of variable xj is aj
%   bj  and the required
%   precision is ve places after the decimal point The
%   precision requirement implies that the range of domain of
%   each variable should be divided into at least bj  aj   
%   size ranges The required bits denoted with mj  for a
%   variable is calculated as follows
%   http://www.ise.ncsu.edu/fangroup/ie789.dir/IE789F_ch3.pdf


    midVal = (y - x) * 10^3;
    numBytes = log(midVal)/log(2); % number of bytes required to store a given integer
    % required bits = 2^(midVal - 1) < midVal <= 2^(midVal) -
    result = ceil(numBytes);


end
