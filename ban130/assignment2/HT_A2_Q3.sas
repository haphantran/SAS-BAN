/********************************************************************************************** 
*  BAN130 – Assignment 2
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Sep 20, 2019 
* 
*   QUESTION No: 3
***********************************************************************************************/

data Bank;
infile '/folders/myfolders/ban130/data/bankdata.txt';
input Name $ 1-15
	Acct $ 16-20
	Balance 21-26
	Rate 27-30;
	Interest = Balance*rate/100;
run;
title "Banking Data";
proc print data=bank;
run;