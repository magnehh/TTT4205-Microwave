function [ k_0 ] = k_0( f )
%K_0 This function calculates k_0 for a given frequency

c = 3e8; % Speed of light in vacuum

k_0 = (2*pi*f)/c;

end