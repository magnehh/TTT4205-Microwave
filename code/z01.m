function [ z01 ] = z01( z0,k_c )
%Z01 This function calculates the impedance of the horizontal strip lines
%in a microstrip branch line directional coupler

z01 = z0 * sqrt(1 - k_c^2);

end

