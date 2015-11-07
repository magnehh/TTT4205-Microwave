function [ f_c_mn ] = f_c_mn( m,n,a,b,epsilon_r,mu_r )
%F_C_MN This function calculates the cut-off frequency of a waveguide in
%mode mn, with dimensions a,b and dielectric constants epsilon_r,mu_r

c= 3e8; % Speed of light in vacuum

f_c_mn = c/(2*pi*sqrt(epsilon_r*mu_r))*sqrt(((m*pi)/a)^2 + ((n*pi)/b)^2);

end

