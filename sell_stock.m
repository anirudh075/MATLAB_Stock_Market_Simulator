function [BankBallance,error_message,user_portfolio] = sell_stock(trade_freqency,local_year,local_month,BankBallance,user_portfolio,error_message)
% [BankBallance,error_message,user_portfolio] = sell_stock(trade_freqency,local_year,local_month,BankBallance,user_portfolio,error_message)
%
% The functions  sells stocks for the user given input intializing
% information for next term.
%
% Created by Anirudh Aggarwal

    %Welcome Message
    fprintf ('\nSELL STOCK\n');
    % User Input
    selling_stock = input('Please enter the stock you would like to sell in XNYAS form (eg. MSFT for Microsoft): ','s');
    selling_stock = stock_input_validation(selling_stock);
    %Iterates through user portfolio to ensure stock exsits
    while sum(strcmpi(user_portfolio(:,1),selling_stock)) == 0
        selling_stock = input('Sorry the stock is not your holding. Please reenter a stock:  ','s');
        stock_input_validation(selling_stock);
    end

    selling_price = input('Please enter the selling price: ');
    number_validation(selling_price,100000000000000000,0,1);

    selling_volume = input ('Please enter the volume you would like to sell: ');
    number_validation(selling_price,100000000000000000,1,0);
    
    %Interates through the stock market to ensure that the user has the
    %stocks
    location_user_portfolio = strcmpi(user_portfolio(:,1),selling_stock);
    volume_user_portfolio = user_portfolio(location_user_portfolio,2);
    if length(volume_user_portfolio) > 1
        matrix_volume = cell2mat(user_portfolio(location_user_portfolio,2));
        volume_exsists = sum(matrix_volume);
    else 
        
        volume_exsists = user_portfolio{location_user_portfolio,2};
    end

    while volume_exsists < selling_volume
        selling_volume = input('Insufficient volume: Please enter the quantity of stock you have: ');
    end
    
    fprintf('Telephoning your broker. Please wait.\n');
    
    %Coverts the stock name to data
    considering_stock = stock_str2var(selling_stock);
    index = data_row_finder(considering_stock,local_year,local_month);

    user_selling = selling_price * selling_volume; 
    
   % Looks up the max price for next term to sell the user's stock choice
   % at the specified price. 
   if (index+trade_freqency) <= length(considering_stock) %<SM:ROP>
       max_term = max(considering_stock((index):(index+trade_freqency),3));
   else 
       max_term = max(considering_stock((index):end,3));
   end
    
   %Compares the value and decides wether to sell or not. 
   if selling_price < max_term 
       for i = 1:size(user_portfolio)
           if strcmpi (user_portfolio{i,1},selling_stock)
               if selling_volume <= user_portfolio{i,2}
                  user_portfolio{i,2} = user_portfolio{i,2} - selling_volume; 
                  selling_volume = 0;
               else 
                   user_portfolio{i,2} = user_portfolio{i,2} - selling_volume;
                   selling_volume = abs(user_portfolio{i,2});
                   user_portfolio{i,2}  = 0;
               end 
           end
       end
       BankBallance = BankBallance + user_selling;
   else 
        error_message = [error_message,sprintf('%s could not sell at $%.2f.\n',upper(selling_stock),selling_price);];
   end
   
   %Calls delete_zero to delete the stock if the volume of the stock is 0
   %from the portforlio. 
   user_portfolio = delete_zero (user_portfolio);
   
   %End Message
   fprintf('Market has been notified.\n');

end
