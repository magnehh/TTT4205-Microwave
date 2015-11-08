function [ reflect_coeff ] = reflect_coeff( z1,z2 )
%REFLECT_COEFF This function calculates the reflection coefficient

reflect_coeff = (z2 - z1)/(z2 + z1);

end

