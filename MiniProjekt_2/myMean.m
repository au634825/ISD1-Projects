function [mid] = myMean(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
sum = 0;
for i = 1:N
    sum = sum + x(i); 
end
mid = sum/N;

end