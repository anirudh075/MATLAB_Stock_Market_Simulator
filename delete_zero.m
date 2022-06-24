function [user_portfolio] = delete_zero (user_portfolio)
%[user_portfolio] = delete_zero (user_portfolio)
%
% The function deletes the information if the volume in the portfolio is zero
%
% Created by Anirudh Aggarwal

delted_matrix_row = [];

%Interates through the portfolio
for i = 1:size(user_portfolio)
    %Adds the row to a new matrix to delete later. 
    if user_portfolio{i,2} == 0
        delted_matrix_row(end+1) = i; 
    end
end
% Returs to the new deleted matrix. 
user_portfolio(delted_matrix_row,:) = []; 

end