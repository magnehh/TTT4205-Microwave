function [ loss_constant ] = loss_constant( f,m,n,a,b,epsilon_r,mu_r )
%LOSS_CONSTANT This function calculates the dielectric loss constant

loss_constant = (k_0(f)*sqrt(epsilon_r * mu_r))/(1000 * sqrt(1 - (f_c_mn(m,n,a,b,epsilon_r,mu_r)/f)^2));

end

