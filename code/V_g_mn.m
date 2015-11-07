function [ V_g_mn ] = V_g_mn( f,m,n,a,b,epsilon_r,mu_r )
%V_G_MN This function calculates the group velocity of a TE_mn wave at
%frequency f

c = 3e8;

V_g_mn = (c/sqrt(epsilon_r * mu_r)) * sqrt(1 - (f_c_mn(m,n,a,b,epsilon_r,mu_r)/f)^2);

end

