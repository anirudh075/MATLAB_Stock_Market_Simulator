function [stock_check] = stock_input_validation (stock_check)
%  [stock_check] = stock_input_validation (stock_check)
% 
% The function is input validation for the stock the user enters.
%
% Created by Anirudh Aggarwal

%Loop compares the to posible stock values and asks the user to reconsider
%the input if the strings don't match.
while isempty(stock_check)||~(strcmpi (stock_check,'msft') || strcmpi (stock_check,'f') ||strcmpi (stock_check,'nvda')||strcmpi (stock_check,'dis')|| strcmpi (stock_check,'orcl') || strcmpi (stock_check,'ko') || strcmpi (stock_check,'unh') || strcmpi (stock_check,'v') ||strcmpi (stock_check,'wmt')||strcmpi (stock_check,'jpm')|| strcmpi (stock_check,'jnj') || strcmpi (stock_check,'pg') || strcmpi (stock_check,'brk') || strcmpi (stock_check,'amzn'))
    stock_check = input ('Please reenter a valid stock (Use XNYAS form): ','s');
end


end