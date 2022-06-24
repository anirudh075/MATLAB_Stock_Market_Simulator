function [] = print_portfolio (userPortfolio)
%  [] = print_portfolio (userPortfolio)
% 
% The function prints user portolio.
%
% Created by Anirudh Aggarwal

%Checks tp see of the user portfolio has nothing in it and then returns a
%error messaege.
if size(userPortfolio) > 0
    %Table heading.
    fprintf('\nStock Name \t\t\t\tVolume \t\t\t\t Buying Price\n')
    %Iterates through the user portfolio and prints the respective data in
    %each rw and coulmn.
    for i = 1:size(userPortfolio)
        fprintf('%-4s %25d %26.2f\n',userPortfolio{i,1},userPortfolio{i,2},userPortfolio{i,3})
    end
else 
    fprintf('\nThere is nothing in your portfolio. You don''t have any investments')
end
end