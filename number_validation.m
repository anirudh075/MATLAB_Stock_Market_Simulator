function [number_check] = number_validation (number_check,max,min,float_or_not)
% [number_check] = number_validation (number_check,max,min,float_or_not)
%
% Input validation for numbers. 
%
% Created by Anirudh Aggarwal

% Checks if the user information is a float or not
if float_or_not == 0 
    % Input validation
    while isempty(number_check) || number_check > max || number_check < min || mod(number_check,1) ~=0
        number_check = input('Please reenter a valid input: ');
    end
else
    % Input Validation 
    while isempty(number_check) || number_check > max || number_check < min
        number_check = input('Please reenter a valid input: ');
    end  
end