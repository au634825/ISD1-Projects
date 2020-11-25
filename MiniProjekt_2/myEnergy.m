function [energy] = myEnergy(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
sum = 0;
for i = 1:N
    sum = sum + abs(x(i))^2; 
end
energy = sum;
end

