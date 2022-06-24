function [] = print_stock_market (local_year, local_month,userInvestment,broker_name,broker_fees,broker_min)
%[] = print_stock_market (local_year, local_month,userInvestment,broker_name,broker_fees,broker_min) 
%
% Prints the high and low price for each stock for each month and year. 
%
% Created by Anirudh Aggarwal

% Lines to be displayed randomly during the progress section of the user
% information.
bar_lines = {'Please wait for the stock market to open...','Are you the Wolf of Wall Street?','Sorry your broker is running late','The stock market can''t wait for you','Finishing touches...','There is a 9% chance your doppelgangers exsits','All froot loops are the same flavor','Fear can actually make your blood curdle','The universe is officially colored "Cosmic Latte."','Almost there...','Make it rain champ...'};

%Prints the progress bar with 10% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 10%% [..          ]')

%Reads data
MSFT = readmatrix("Stock.xlsx","Sheet",1);
F = readmatrix("Stock.xlsx","Sheet",2);

%Prints the progress bar with 15% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 15%% [...         ]')

%Reads data
NVDA = readmatrix("Stock.xlsx","Sheet",3);
DIS = readmatrix("Stock.xlsx","Sheet",4);

%Prints the progress bar with 32% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 32%% [......      ]')

%Reads data
ORCL = readmatrix("Stock.xlsx","Sheet",5);
KO = readmatrix("Stock.xlsx","Sheet",6);
UNH =readmatrix("Stock.xlsx","Sheet",7);

%Prints the progress bar with 84% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 84%% [.........   ]')

%Reads data
V = readmatrix("Stock.xlsx","Sheet",8);
WMT = readmatrix("Stock.xlsx","Sheet",9);
JPM = readmatrix("Stock.xlsx","Sheet",10);

%Prints the progress bar with 98% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 98%% [........... ]')

%Reads data
PG = readmatrix("Stock.xlsx","Sheet",11);
BRK = readmatrix("Stock.xlsx","Sheet",12);

%Prints the progress bar with 100% advancement
clc;
fprintf ('%s\n',bar_lines{randi(11)})
fprintf ('Progress: 100%% [............]')

%Reads data
AMZN = readmatrix("Stock.xlsx","Sheet",13);
JNJ = readmatrix("Stock.xlsx", "Sheet",14);
clc;

% Prints intial data for the stock exchange
fprintf('\nWelocme to New York Stock Exchange\t\t Date:%d-%d\t\tBank Balance:$%.2f\n',local_month,local_year,userInvestment);
fprintf('Exclusive for %s members. Minimum bidding amount is $%.2f at %.2f%%.\n\n',broker_name,broker_min,broker_fees*100)
fprintf('Stock\t\t\t\t\t\t\t\t\t\t\tLow Price\t\t\tHigh Price\n')

% Looks for respective data row and prints the stock name, high price and
% low price.
data_row = data_row_finder (MSFT,local_year,local_month);
fprintf('MICROSOFT CORPORATION (XNAS:MSFT)%24.2f\t\t\t\t%.2f\n',MSFT(data_row,3), MSFT(data_row,4));

data_row = data_row_finder (F,local_year,local_month);
fprintf('FORD MOTOR COMPANY (XNYS:F)%30.2f\t\t\t\t%.2f\n',F(data_row,3), F(data_row,4))

data_row = data_row_finder (NVDA,local_year,local_month);
fprintf('NVIDIA CORPORATION (XNAS:NVDA)%27.2f\t\t\t\t%.2f\n',NVDA(data_row,3), NVDA(data_row,4))

data_row = data_row_finder (DIS,local_year,local_month);
fprintf('THE WALT DISNEY COMPANY (XNYS:DIS)%23.2f\t\t\t\t%.2f\n',DIS(data_row,3), DIS(data_row,4))

data_row = data_row_finder (ORCL,local_year,local_month);
fprintf('ORACLE CORPORATION (XNYS:ORCL) %26.2f\t\t\t\t%.2f\n',ORCL(data_row,3), ORCL(data_row,4))

data_row = data_row_finder (KO,local_year,local_month);
fprintf('THE COCA-COLA COMPANY (XNYS:KO)%26.2f\t\t\t\t%.2f\n',KO(data_row,3), KO(data_row,4))

data_row = data_row_finder (UNH,local_year,local_month);
fprintf('UNITEDHEALTH GROUP INCORPORATED (XNYS:UNH)%15.2f\t\t\t\t%.2f\n',UNH(data_row,3), UNH(data_row,4))

data_row = data_row_finder (V,local_year,local_month);
fprintf('VISA INC. (XNYS:V)%39.2f\t\t\t\t%.2f\n',V(data_row,3), V(data_row,4))

data_row = data_row_finder (WMT,local_year,local_month);
fprintf('WALMART INC. (XNYS:WMT)%34.2f\t\t\t\t%.2f\n',WMT(data_row,3), WMT(data_row,4))

data_row = data_row_finder (JPM,local_year,local_month);
fprintf('JPMORGAN CHASE & CO. (XNYS:JPM)%26.2f\t\t\t\t%.2f\n',JPM(data_row,3), JPM(data_row,4))

data_row = data_row_finder (JNJ,local_year,local_month);
fprintf('JOHNSON & JOHNSON (XNYS:JNJ)%29.2f\t\t\t\t%.2f\n',JNJ(data_row,3), JNJ(data_row,4))

data_row = data_row_finder (PG,local_year,local_month);
fprintf('THE PROCTER & GAMBLE COMPANY (XNYS:PG)%19.2f\t\t\t\t%.2f\n',PG(data_row,3), PG(data_row,4))

data_row = data_row_finder (BRK,local_year,local_month);
fprintf('BERKSHIRE HATHAWAY INC. (XNYS:BRK)%23.2f\t\t\t\t%.2f\n',BRK(data_row,3), BRK(data_row,4))

data_row = data_row_finder (AMZN,local_year,local_month);
fprintf('AMAZON.COM, INC. (XNAS:AMZN)%29.2f\t\t\t\t%.2f\n',AMZN(data_row,3), AMZN(data_row,4))


end

