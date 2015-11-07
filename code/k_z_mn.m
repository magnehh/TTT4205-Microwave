function [ k_z_mn ] = k_z_mn( f,m,n,a,b,epsilon_r,mu_r )
%K_Z_MN Summary of this function goes here

k_z_mn = sqrt((k_0(f))^2 * epsilon_r * mu_r - ((m*pi)/a)^2 - ((n*pi)/b)^2);

end

