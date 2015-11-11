function [ variation ] = percent_freq_band( f_c,percentage )
%PERCENT_FREQ_BAND This function calculates the upper and lower boundaries
%of a specified percentage frequency band.

variation = f_c * percentage / 200;

end

