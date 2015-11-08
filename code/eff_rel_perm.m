function [ eff_rel_perm ] = eff_rel_perm( h,w,epsilon_r )
%EFF_PERM This function calculates the effective permittivity given a
%geometry and epsilon_r

eff_rel_perm = ((epsilon_r + 1)/ 2) + ((epsilon_r - 1) / (2 * sqrt(1 + 10*h/w)));

end

