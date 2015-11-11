function [ z02 ] = z02( z0,k_c )
%Z02 This function calculates the impedance of the vertical strip lines
%in a microstrip branch line directional coupler

z01_res = z01(z0,k_c);

z02 = z01_res / sqrt(1 - (z01_res/z0)^2);

end

