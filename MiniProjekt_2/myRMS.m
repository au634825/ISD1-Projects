function [RMS] = myRMS(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
sum = 0;
for i = 1:N
    sum = sum + abs(x(i))^2; 
end
mid = sum/N;
RMS = sqrt(mid);

end

