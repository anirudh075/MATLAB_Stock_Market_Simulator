function [] = error_message(error_message)
% error_message(error_message)
% 
% Prints the stock market error messages for the user.
%
% Created by Anirudh Aggarwal

    % If the information is not empty then prints the respective error
    % messages.
    if ~isempty(error_message)
        % Interates through the error messages and prints the stock error
        % message. 
        for index=1:length(error_message)
        fprintf (error_message(index))
        end
    end

end