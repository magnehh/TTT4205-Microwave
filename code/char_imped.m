function [ char_imped ] = char_imped( h,w,epsilon_r )
%CHAR_IMPED This function calculates the characteristic impedance given a
%geometry and epsilon_r

if ((w/h) < 1)
    char_imped = (60 / eff_rel_perm(h,w,epsilon_r)) * log((((8*h)/w)) + ((0.25*w)/h));
else
    char_imped = (120 * pi) / (sqrt(eff_rel_perm(h,w,epsilon_r)) * (w/h + 1.393 + (0.667*log(w/h + 1.444))));
end

end

