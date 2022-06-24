function [] = company_info (local_year, local_month,frequency)
% [] = company_info (local_year, local_month,frequency)
% 
% The function analyzes stock bases on previous performance based on data
% in the simulator. The function gives ATR, Performace, pervious price,
% bullish or bearish information and a stock graph.
%
% Created by Anirudh Aggarwal
fprintf ('\nYAHOO FINANCE\n');

%Checks to see if its the first term and the first semester and returns and
%error message.
if local_year == 2000 && local_month == 1 
     fprintf ('Sorry no data is available. This is the first term please wait for the another term to enable analysis.\n')
else
   %User Input information
    user_choice = input('Which company would you like to anlayze in XNYAS form (eg. MSFT for Microsoft): ','s');
    user_choice = stock_input_validation(user_choice);
    fprintf('Processing Request. Please Wait.\n');
     
        % Compares the value the user entered and intilizes the stock full
        % name the GCIS sector and industry. 
        if strcmpi(user_choice,'MSFT')
            stock_name = 'MICROSOFT CORPORATION (XNAS:MSFT)';
            sector = 'Technology';
            industry =  'Software';
    
        elseif strcmpi(user_choice,'F')
            stock_name = 'FORD MOTOR COMPANY (XNYS:F)';
            sector = 'Consumer Cyclical';
            industry =  'Auto Manufacturers';
    
        elseif strcmpi(user_choice,'NVDA')
            stock_name = 'NVIDIA CORPORATION (XNAS:NVDA)';
            sector = 'Technology';
            industry =  'Semiconductors';
    
        elseif strcmpi(user_choice,'DIS')
            stock_name = 'THE WALT DISNEY COMPANY (XNYS:DIS)';
            sector = 'Technology';
            industry =  'Software';
    
        elseif strcmpi(user_choice,'ORCL')
            stock_name = 'ORACLE CORPORATION (XNYS:ORCL)';
            sector = 'Technology';
            industry =  'Software';
    
        elseif strcmpi(user_choice,'KO')
            stock_name = 'THE COCA-COLA COMPANY (XNYS:KO)';
            sector = 'Consumer Defensive';
            industry =  'Beverages—Non-Alcoholic';
    
        elseif strcmpi(user_choice,'UNH')
            stock_name = 'UNITEDHEALTH GROUP INCORPORATED (XNYS:UNH)';
            sector = 'Healthcare';
            industry =  'Healthcare Plans';
    
        elseif strcmpi(user_choice,'V')
            stock_name = 'VISA INC. (XNYS:V)';
            sector = 'Financial Services';
            industry =  'Credit Services';
    
        elseif strcmpi(user_choice,'WMT')
            stock_name = 'WALMART INC. (XNYS:WMT)';
            sector = 'Consumer Defensive';
            industry =  'Discount Stores';
    
        elseif strcmpi(user_choice,'JPM')
            stock_name = 'JPMORGAN CHASE & CO. (XNYS:JPM)';
            sector = 'Financial Services';
            industry =  'Banks—Diversified';
    
        elseif strcmpi(user_choice,'PG')
             stock_name = 'THE PROCTER & GAMBLE COMPANY (XNYS:PG)';
             sector = 'Consumer Defensive';
            industry =  'Household & Personal Products';
    
        elseif strcmpi(user_choice,'BRK')
            stock_name = 'BERKSHIRE HATHAWAY INC. (XNYS:BRK.B)';
            sector = 'Financial Services';
            industry =  'Insurance—Diversified';
    
        elseif strcmpi (user_choice, 'JNJ')
            stock_name = 'JOHNSON & JOHNSON (XNYS:JNJ)';
            sector = 'Healthcare';
            industry =  'Drug Manufacturers—General';
    
        elseif strcmpi (user_choice,'AMZN')
            stock_name = 'AMAZON.COM, INC. (XNAS:AMZN)';
            sector = 'Consumer Cyclical';
            industry =  ' Internet Retail';
    
        end
    
        % Coverts the user string choice its matrix counterpart. 
    considering_stock = stock_str2var (user_choice);
    
    index = data_row_finder(considering_stock,local_year,local_month);


    % Finds the values for the based previous data and calcuates the %
    % increase or decrease.
    old_high = considering_stock(index-frequency,3);
    new_high = considering_stock(index,3);
    old_low = considering_stock(index-frequency,4);
    new_low = considering_stock(index,4);
    sub_calc_high = (new_high-old_high)/old_high;
    sub_calc_low = (new_low-old_low)/old_low;
    average_percen = ((sub_calc_low + sub_calc_high)/2)*100;
    
    %Sets the arrow picture based on the data.
    if average_percen < 0
        arrow_percentage = compose("\x25BC"); %<NEWFUN>
    else
        arrow_percentage = compose("\x25B2");
    end
    
    %Calcuates the ATR Valus
    atr_14 = max(considering_stock(1:index,5));
    atr_inc = max(considering_stock(1:index,5))/2;
    atr_20 =  max(considering_stock(1:frequency:index,5));
    range_today = new_high - new_low;
    
    %Calcuates the performance for the values of the respective values.
    today_p = new_high/new_low;
    monthly_p = considering_stock(index-1,4)/new_high;
    
    %Prints the stock quantative analytical details
    fprintf ('\n\n%s\n',stock_name)
    fprintf (arrow_percentage +'\t<strong>%.2f </strong>'+'(%.2f%%)\n\n',considering_stock(index,4),average_percen);
    fprintf('GICS Sector: %s\t\t\t\t\t\t\t\t\t\t\t\t\n',sector)
    fprintf('GICS Industry: %s\t\t\t\t\t\t\t\t\t\t\t\t\n\n',industry)
    
    fprintf('Perfomance\t\t\t\t\t\t\t\t\t\t\t\t\n')
    fprintf('---------------------------------\n')
    fprintf('Today: %.2f\t\t\t\t\tMonthly: %.2f\n',today_p,monthly_p)
    fprintf('Last Open: %.2f\t\t\tLast Close: %.2f\n\n',considering_stock(index-1,3),considering_stock(index-1,4))
    
    fprintf('Volatility\t\t\t\t\t\t\t\t\t\t\t\t\n')
    fprintf('---------------------------------\n')
    fprintf('ATR(14): %.2f\t\t\t\t\tATR(20%%): %.2f\n',atr_14,atr_20)
    fprintf('ATR Inc: %.2f\t\t\t\t Range Today: %.2f\n',atr_inc,range_today)
    
    %Intializes x and y values for the plot
    x_value = [1:frequency:index];
    high_price = considering_stock (1:frequency:index,4);
    low_price = considering_stock (1:frequency:index,3);
    
    % Plots the values as a line graph. 
    plot(x_value,high_price,"Color",'b') %<SM:PLOT>
    hold on 
    plot(x_value,low_price,Color='r')
    hold off
    
    % Plot properties. 
    xlim([1 max(x_value)])
    xlabel('Terms from Jan''01 (Months)')
    ylabel('Price (USD)')
    legend('Clossing Price','Opening Price')
    title_graph = sprintf('%s Price vs Time Displayed in %d month(s) Intervals',upper(user_choice),frequency);
    title(title_graph);
end

end