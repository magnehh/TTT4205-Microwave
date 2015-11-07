function [ W_mn_TE ] = W_mn_TE( f,m,n,a,b,epsilon_r,mu_r )
%W_MN_TE This function calculates the wave impedance of a TE_mn wave at
%frequency f

epsilon_0 = 8.854187817e-12;
mu_0 = pi * 4e-7;

W_mn_TE = sqrt((mu_r * mu_0)/(epsilon_r * epsilon_0)) * 1/sqrt(1 - (f_c_mn(m,n,a,b,epsilon_r,mu_r)/f)^2);

end