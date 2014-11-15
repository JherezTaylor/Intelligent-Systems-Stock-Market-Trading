function [ result ] = decodeGene( bitString, x, y )
%This function returns the real number representation of a gene
%   Accepts the bit string and the range
%   and returns the real number representation
%   http://www.ise.ncsu.edu/fangroup/ie789.dir/IE789F_ch3.pdf

bitValue =  bin2dec(bitString);
numBytes = length(bitString);
result = x + bitValue * ((y - x)/(2^numBytes - 1));

end
