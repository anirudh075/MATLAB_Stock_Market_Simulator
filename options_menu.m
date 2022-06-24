function [user_portfolio,userSelection,userInvestment,error_message] = options_menu (user_portfolio,trade_freqency,local_year,local_month, userInvestment,error_message,boker_min,broker_fees)
% [user_portfolio,userSelection,userInvestment,error_message] = options_menu (user_portfolio,trade_freqency,local_year,local_month, userInvestment,error_message,boker_min,broker_fees)
% 
% Display the stock market and call the necessary function based on user
% choice. 
%
% Created by Anirudh Aggarwal

% Prints the menu and validates user input
userSelection = input('\n\nMenu:\n(1) Buy\n(2) Sell\n(3) Company Data\n(4) View Portfolio\n(5) Simulator Insturuction\n(6) Next Term\n Select your move: ');
number_validation(userSelection,6,1,0);

%Calls the respective function based on user selection
if userSelection == 1
   [user_portfolio,userInvestment,error_message] = buying_stock (user_portfolio,trade_freqency,local_year,local_month, userInvestment,error_message,boker_min,broker_fees);
elseif userSelection == 2
    % Checks to see if the user has any stocks in portfolio before selling.
    if size(user_portfolio) ~= 0 
       [userInvestment,error_message,user_portfolio] = sell_stock(trade_freqency,local_year,local_month,userInvestment,user_portfolio,error_message);
    else
        fprintf('\n\nYou don''t have any stocks in holding.\n.')
    end
elseif userSelection == 3 
    company_info (local_year, local_month,trade_freqency)
elseif userSelection == 4
    print_portfolio (user_portfolio)
elseif userSelection == 5
    instruction();
end

end