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
data Bank;
infile '/folders/myfolders/ban130/data/bankdata.txt';
input @1 Name $15.
	@16 Acct $5.
	@21 Balance 6.
	@27 rate 4.;
Interest = Balance*rate/100; *because the rate is percentage, I divide the result by 100;

run;
title "Banking Data";
proc print data=bank;
run;