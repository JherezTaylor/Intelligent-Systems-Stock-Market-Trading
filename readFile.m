function[data] = readFile()

file = fopen('WDC_tickbidask.txt');
data = textscan(file, '%s %s %s %s %s %s');