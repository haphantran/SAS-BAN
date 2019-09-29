/********************************************************************************************** 
*  BAN130 – Assignment 2
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Sep 20, 2019 
* 
*   QUESTION No: 4
***********************************************************************************************/
*data step to input data from text file;
data Bank;
infile '/folders/myfolders/ban130/data/bankdata.txt';
input @1 Name $15.
	@16 Acct $5.
	@21 Balance 7.
	@28 rate 3.2;
	Interest = Balance*rate;
run;

title "Banking Data with interest computed";
proc print data=bank;
	format balance dollar11.2 interest dollar11.2 rate percent6.2;
	*display data with appropriate format;
run;