function [user_portfolio,BankBallance,error_message] = buying_stock (user_portfolio,trade_freqency,local_year,local_month, BankBallance,error_message,broker_min,broker_fees)
% [user_portfolio,BankBallance,error_message] = buying_stock (user_portfolio,trade_freqency,local_year,local_month, BankBallance,error_message,broker_min,broker_fees)
% 
% The functions buys user selected stocks and does necessary calculations
% to evaluate the bid for the next term.
%
% Created by Anirudh Aggarwal

    % Welcome Message
    fprintf('\nBUY STOCK\n');
    
    %User Input Value
    buying_stock = input('Enter the stock you would like to buy in XNYAS form (eg. MSFT for Microsoft): ','s');
    buying_stock = stock_input_validation(buying_stock);
    bid_price_stock = input ('Enter your bidding price (Please be compliant with your broker): ');
    bid_price_stock = number_validation (bid_price_stock,100000000000000,0.0001,1);
    buying_volume= input ('Enter the bidding volume: ');
    buying_volume = number_validation (buying_volume,100000000000000,1,0);
    
    fprintf('Telephoning your broker. Please wait.\n')
   
    %Coverts user stock choice to matrix of data 
   considering_stock = stock_str2var (buying_stock);

   %Finds the idex for the stock tht is considering in the matrix
   index = data_row_finder(considering_stock,local_year,local_month);
   
   %Intializes the value for user luck
   user_luck = rand(); %<SM:RANDGEN>
   market_luck = rand();
   
   %Decides the intial cost of the stocks
   investment_cost = bid_price_stock * buying_volume;
   
   %Evaluates to find the minimum value for the next term.
   if (index+trade_freqency) <= size(considering_stock)
       min_term = min(considering_stock((index):(index+trade_freqency),3)); %<SM: SLICE>
   else 
       min_term = min(considering_stock((index):end,3));
   end
   
   %<SM:NEST>
   %Compares the user prices and the minimum value to make sure they are
   % compatimble with ther user.
   if  investment_cost >= broker_min
       % Checks to see if the user has enough ballance to buy the stock
       if investment_cost <= BankBallance 
           if bid_price_stock > min_term 
               % Adds the stock to portfolio
                user_portfolio{end+1,1} = upper(buying_stock); %<SM: AUG>
                user_portfolio{end,2} = buying_volume; 
                user_portfolio{end,3} = bid_price_stock; 
                broker_cut = investment_cost * broker_fees;
                investment_cost = investment_cost + broker_cut;
                BankBallance = BankBallance - investment_cost; %<SM:RTOTAL>
                error_message = [error_message,sprintf('Your bid for %s at $%.2f was succesful the broker''s cut was $%.2f.\n',upper(buying_stock),bid_price_stock,broker_cut);];
               
           elseif user_luck > market_luck %<SM:RANDUSE>
                % Adds the stock to portfolio
               user_portfolio{end+1,1} = upper(buying_stock); 
                user_portfolio{end,2} = buying_volume; 
                user_portfolio{end,3} = bid_price_stock;
                broker_cut = investment_cost * broker_fees;
                investment_cost = investment_cost + broker_cut;
                BankBallance = BankBallance - investment_cost;
                error_message = [error_message,sprintf('You are lucky your bid for %s at $%.2f was succesful the broker''s cut was $%.2f.\n',upper(buying_stock),bid_price_stock,broker_cut);];
           else 
               error_message = [error_message,sprintf('Your bid for %s at $%.2f wasn''t succesful. The market was bullish.\n',upper(buying_stock),bid_price_stock);]; %<SM:String>
           end
       else 
              error_message = [error_message,sprintf('Your bid for %s at $%.2f was not succesful due to insufficient funds.\n',upper(buying_stock),bid_price_stock);];
       end
   else
       error_message = [error_message,sprintf('Your bid for %s at $%.2f was not succesful since the minimum trading amount is $%.2f.\n',upper(buying_stock),bid_price_stock,broker_min)];
   end
   fprintf('Bid placed.\n');
end