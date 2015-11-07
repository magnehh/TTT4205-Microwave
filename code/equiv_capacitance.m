function [ equiv_capacitance ] = equiv_capacitance( f,s,m,n,a,b,epsilon_r,mu_r )
%equiv_capacitance This function calculates the equivalent capacitance of a
%capacitive iris in a rectangular waveguide

equiv_capacitance = ((2 * k_z_mn(f,m,n,a,b,epsilon_r,mu_r) * b)/(pi^2 * f * W_mn_TE(f,m,n,a,b,epsilon_r,mu_r))) * log(csc((pi * s)/(2 * pi)));

%equiv_capacitance = ( (2 * k_z_mn(f,m,n,a,b,epsilon_r,mu_r) * b)/((pi)^2 * f * W_mn_TE(t,m,n,a,b,epsilon_r,mu_r)) )

end

