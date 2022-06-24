function [stock_var] = stock_str2var (stock_name)
%  [stock_var] = stock_str2var (stock_name)
% 
% The function coverts the string stock to a matrix with the stock's data.
%
% Created by Anirudh Aggarwal

    % Reads all the data
    MSFT = xlsread("Stock.xlsx","Sheet1"); %<SM:READ>
    F = readmatrix("Stock.xlsx","Sheet",2);
    NVDA = readmatrix("Stock.xlsx","Sheet",3);
    DIS = readmatrix("Stock.xlsx","Sheet",4);
    ORCL = readmatrix("Stock.xlsx","Sheet",5);
    KO = readmatrix("Stock.xlsx","Sheet",6);
    UNH =readmatrix("Stock.xlsx","Sheet",7);
    V = readmatrix("Stock.xlsx","Sheet",8);
    WMT = readmatrix("Stock.xlsx","Sheet",9);
    JPM =readmatrix("Stock.xlsx","Sheet",10);
    PG = readmatrix("Stock.xlsx","Sheet",11);
    BRK = readmatrix("Stock.xlsx","Sheet",12);
    JNJ = readmatrix("Stock.xlsx","Sheet",13);
    AMZN = readmatrix("Stock.xlsx","Sheet",14);
    
    %Compares stock and sets the output the respective data type. 
    if strcmpi(stock_name,'MSFT')
        stock_var = MSFT;
    elseif strcmpi(stock_name,'F')
        stock_var = F;
    elseif strcmpi(stock_name,'NVDA')
        stock_var = NVDA;
    elseif strcmpi(stock_name,'DIS')
        stock_var = DIS;
    elseif strcmpi(stock_name,'ORCL')
        stock_var = ORCL;
    elseif strcmpi(stock_name,'KO')
        stock_var = KO;
    elseif strcmpi(stock_name,'UNH')
        stock_var = UNH;
    elseif strcmpi(stock_name,'V')
        stock_var = V;
    elseif strcmpi(stock_name,'WMT')
        stock_var = WMT;
    elseif strcmpi(stock_name,'JPM')
        stock_var = JPM;
    elseif strcmpi(stock_name,'PG')
         stock_var = PG;
    elseif strcmpi(stock_name,'BRK')
        stock_var = BRK;
    elseif strcmpi (stock_name, 'JNJ')
        stock_var = JNJ;
    elseif strcmpi (stock_name,'AMZN')
        stock_var = AMZN;
    end
end