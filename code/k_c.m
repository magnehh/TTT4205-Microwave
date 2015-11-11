function [ k_c ] = k_c( p_i,p_c )
%K_C This function calculates the coupling coefficient in a microstrip
%branch line directional coupler

k_c = sqrt(p_c/p_i);

end

