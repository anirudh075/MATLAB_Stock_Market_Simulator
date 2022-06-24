
clear % useful to clear your workspace and use new variables
clc %always clear command window screens before you start
close all % (optional) needed to close any opened graphs or figures
commandwindow % make the commend mindow the active location

%Welcome message and intial user inputs
fprintf('WELCOME TO LONG TERM STOCK MARKET SIMULATOR\n\n');
instruction() % Instruction manual 

%INPUT information 
userName = input('What is your name: ','s'); 

%Name Input Validation
while isempty(userName)
    userName=input('Please enter a name: ', 's');
end
userInvestment = input('Enter intial capital (USD): ');
userInvestment = number_validation(userInvestment,100000000000000000000000,1,1);
intial_investoment = userInvestment;
tradeFrequency = input('Choose private eqauity investment period: \n(1) Monthly \n(2) Quarterly \n(3) Annually\n Selection: ');
tradeFrequency = number_validation(tradeFrequency,3,1,0);
broker = input('Choose your brokers service:\n(1) Charles Schwab (min: $0 Fees: 12%)\n(2) J.P.Morgan Wealth Management (min: $625 Fees: 6.5%)\n(3) Marcus by Goldman Sachs (min: $10,000 Fees: 2.5%)\n(4) ZOE Financial (min: $100,000 Fees: 0.25%)\n Selection: ');
broker = number_validation(broker,4,1,0);

%Intializes broker details
if broker == 1 
    broker_name = 'Charles Schwab';
    boker_min = 0;
    broker_fees = 0.12;
elseif broker == 2 
    broker_name = 'J.P.Morgan Wealth Management';
    boker_min = 625;
    broker_fees = 0.065;
elseif broker == 3
    broker_name = 'Marcus by Goldman Sachs';
    boker_min = 10000;
    broker_fees = 0.025;
 elseif broker == 4 
    broker_name = 'ZOE Financial';
    boker_min = 0;
    broker_fees = 0.0025;
end

%Intializing user infromation 
if tradeFrequency == 1 %<SM: IF>
    tradeFrequency = 1;
elseif tradeFrequency == 2 
    tradeFrequency = 3;
else 
    tradeFrequency = 12;
end
user_portfolio = {}; % user stock portfolio 
local_year = 2000; % local year
local_month = 1; % local month 


%The main loop runs until the year is 2021
while local_year < 2021 %<SM:WHILE> %<SM:ROP>
    notification = []; % notification intialization
    print_stock_market (local_year, local_month,userInvestment,broker_name,broker_fees,boker_min) % prints stock market for sepcific date 
    userSelection = 0; % intialziation
   
    while userSelection ~=6 % Exits the menu loop when user selects option 5  
        %<SM:PDF> <SM: PDF_PARAM> =>in brakets <SM: PDF_RETURN> => in square brackets Option menu gives the user options to select information
        [user_portfolio,userSelection,userInvestment,notification] = options_menu (user_portfolio,tradeFrequency,local_year,local_month, userInvestment,notification,boker_min,broker_fees);
    end
    clc;
    %Prints notification collected from the buy and sell functions
    if ~isempty(notification)
        exit = 0; 
        %Exits the notification once user presses 1
        while exit ~= 1
        fprintf('NOTIFICATION FROM %s\n',upper(broker_name))
        error_message(notification)
        exit = input('Press 1 to exit: ');
        exit = number_validation(exit,1,1,0);
        end
    end
    %Time claculation for new term
   time_calc= local_month + tradeFrequency; 
   if time_calc > 12
       local_year = local_year + 1; 
       local_month = time_calc - 12; 
   else 
       local_month = time_calc;
   end
end
%Simulator ending print message. 
fprintf ('Ms./Mr. %s in 20 years you earned $%.2f.\n',userName,userInvestment-intial_investoment);
fprintf('\nThank your for using the simulator.\n');