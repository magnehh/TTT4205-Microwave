function [ equiv_inductance ] = equiv_inductance( s,m,n,a,b,mu_r,mu_0 )
%equiv_inductance This function calculates the equivalent inductance of a
% inductive iris in a specified waveguide.

equiv_inductance = (a * mu_0 * mu_r) / (2 * pi * cot(((pi * s)/(2 * a)) * ( 1 + csc((pi * s)/(2 * a))^2))^2);

end

