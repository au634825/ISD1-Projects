function w=win(L,type)
% Returns a Window of type 'type' with size L
% Ref: Lyons, pp. 91 and 195
% KPL 2013-09-11

n=0:L-1;

switch lower(type)
    case {'rectangular', 'uniform', 'boxcar'}
        w=ones(1,L);
    case {'bartlett', 'triangular'}
        w=1-2*abs(n-(L-1)/2)/(L-1);
    case 'blackman'
        w=0.42-0.5*cos(2*pi*n/(L-1))+0.08*cos(4*pi*n/(L-1));
    case 'hamming'
        w=0.54-0.46*cos(2*pi*n/(L-1));
    case {'hanning','hann'}
        w=1/2*(1-cos(2*pi*n/(L-1)));
%     case 'chebyshev'
%         gamma=2.5;
%         k=0:L;
%         alpha=cosh(1/L*acosh(10^gamma));
%         W=cos(L*acos(alpha*cos(pi*k/L)))./cosh(L*acosh(alpha));
%         w=ifft(W,L);
    otherwise
        disp('Unknown method.')
        disp('Why?'),why
        w=1;
end


