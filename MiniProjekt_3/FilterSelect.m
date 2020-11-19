function [Bout,Aout] = FilterSelect(gain,Fc, sel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Fs  = 44100;    % Sampelfrekvens                            
%Fc = Fc/(Fs/2);
K = tan(pi*Fc/Fs);
V0 = 10^(gain/20);


denomBoost = (1+sqrt(2)*K+K^2);
denomCutLF = (V0+sqrt(2*V0)*K+K^2);
denomCutHF = (1+sqrt(2*V0)*K+V0*K^2);

%boost
if(sel == "bass")
    if(gain >= 0)
        b0=(1+sqrt(2*V0)*K+V0*K^2)/denomBoost;
        b1=(2*(V0*K^2-1))/denomBoost;
        b2=(1-sqrt(2*V0)*K+V0*K^2)/denomBoost;
        a1=(2*(K^2-1))/denomBoost;
        a2=((1-sqrt(2)*K+K^2))/denomBoost;
        
    elseif (gain < 0)
        b0=(V0*(1+sqrt(2)*K+K^2))/denomCutLF;
        b1=(2*V0*(K^2-1))/denomCutLF;
        b2=(V0*(1-sqrt(2)*K+K^2))/denomCutLF;
        a1=(2*(K^2-V0))/denomCutLF;
        a2=(V0-sqrt(2*V0)*K+K^2)/denomCutLF;        
    end
elseif(sel == "treble")
    if(gain >= 0)
        b0=(V0+sqrt(2*V0)*K+K^2)/denomBoost;
        b1=(2*(K^2-V0))/denomBoost;
        b2=(V0-sqrt(2*V0)*K+K^2)/denomBoost;
        a1=(2*(K^2-1))/denomBoost;
        a2=((1-sqrt(2)*K+K^2))/denomBoost;
        
    elseif (gain < 0)
        b0=(V0*(1+sqrt(2)*K+K^2))/denomCutHF;
        b1=(2*V0*(K^2-1))/denomCutHF;
        b2=(V0*(1-sqrt(2)*K+K^2))/denomCutHF;
        a1=(2*(V0*K^2-1))/denomCutHF;
        a2=(1-sqrt(2*V0)*K+V0*K^2)/denomCutHF;
    end
end

B = [b0, b1, b2];
A = [1, a1, a2];


fvtool(B,A, 'FrequencyScale', 'log', 'Fs', Fs);

Aout = A;
Bout = B;
end

%func(basgain, diskgain, bascut, diskcut){
%    switch()
%}