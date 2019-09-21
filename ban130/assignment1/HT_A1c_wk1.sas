*---------------------------------------------------*
| Program name: stocks.sas in c:\books\learning |
| Purpose: Read in raw data on stock prices and |
| compute values |
| Programmer: Ron Cody |
| Date: June 23, 2006 |
*---------------------------------------------------*;
*a;
data portfolio;
infile '/folders/myfolders/ban130/data/stocks.txt';
input Symbol $ Price Number;
Value = Number*Price;
run;
title "Listing of Portfolio";
proc print data=portfolio noobs;
run;
*b;
title "Means and Sums of Portfolio Variables";

proc means data=portfolio n mean sum maxdec=0;
var Price Number;
run;