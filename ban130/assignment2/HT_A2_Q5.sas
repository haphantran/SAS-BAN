/********************************************************************************************** 
*  BAN130 – Assignment 2
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Sep 20, 2019 
* 
*   QUESTION No: 5
***********************************************************************************************/  
*data step to input data from text file;
data Stocks;
infile '/folders/myfolders/ban130/data/stockprices.txt';
input @1 stock $4.
	@5 PurDate mmddyy10.
	@15 PurPrice dollar6.1
	@21 Number 4.
	@25 SellDate mmddyy10.
	@35 SellPrice  dollar6.1;
	TotalPur   = number * purprice;
	TotalSell   = number * sellprice;
	Profit      = totalSell - totalPur;
run;

*proc print with format;
title "Banking Data";
proc print data=Stocks;
	format purdate mmddyy10. selldate mmddyy10.
			PurPrice	dollar6.1 SellPrice  dollar6.1 
			TotalPur dollar10.2 TotalSell dollar10.2 profit dollar10.2 ;
run;