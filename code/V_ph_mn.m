function [ V_ph_mn ] = V_ph_mn( f,m,n,a,b,epsilon_r,mu_r )
%V_PH_MN This function calculates the phase velocity of a TE_mn wave at
%frequency f

c = 3e8;

V_ph_mn = (c/sqrt(epsilon_r * mu_r))/sqrt(1 - (f_c_mn(m,n,a,b,epsilon_r,mu_r)/f)^2);

end

