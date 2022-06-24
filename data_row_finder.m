function data_row = data_row_finder(stock_name,local_year,local_month)
%  data_row = data_row_finder(stock_name,local_year,local_month)
% 
% The function goes through the data and looks up the row for the input year and mouth for a stock.
%
% Created by Anirudh Aggarwal

%Interates throught row of stock and the returns the row in which the data
%month and year match.

for row = 1:length(stock_name)%<SM:FOR>  <SM: SEARCH>
    if stock_name(row,2) == local_year && stock_name(row,1) == local_month %<SM:BOP>
        data_row = row; 
    end
end
end