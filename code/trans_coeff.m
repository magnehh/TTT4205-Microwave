function [ trans_coeff ] = trans_coeff( z1,z2 )
%TRANS_COEFF This function calculates the transmission coefficient of a
%microstrip

trans_coeff = (2*sqrt(z1*z2))/(z1 + z2);

end

