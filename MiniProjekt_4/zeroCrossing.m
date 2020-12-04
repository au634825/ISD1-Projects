function [f] = zeroCrossing(x,fs)
%zeroCrossing algorithm  determines det base frequency of a given 
%sinusodial signal
%Give the function a signal and the sampling frequency as arguments and the
%function will return the base frequency of the given function.
n=length(x);
flag = 0;
for i = 2:n 
    if (x(i-1) < 0 && x(i) > 0)
        N1=i-1;
        Na1=x(i-1)/(x(i-1)-x(i));
        for c = i:n
            if (x(c-1) > 0 && x(c) < 0)
                N2=c-1;
                Na2=x(c-1)/(x(c-1)-x(c));
                flag = 1;
                break;
            end
        end
    elseif(x(i-1) > 0 && x(i) < 0) 
        N1=i-1;
        Na1=x(i-1)/(x(i-1)-x(i));
        for c = i:n
            if (x(c-1) < 0 && x(c) > 0)
                N2=c-1;
                Na2=x(c-1)/(x(c-1)-x(c));
                flag = 1;
                break;
            end
        end
    end
    if flag == 1
        break;
    end
end
T12=(2*(N2+Na2-(N1+Na1)))*1/fs;
f = 1/T12;
end

