/********************************************************************************************** 
*  BAN130 – Assignment 3
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Oct 15, 2019 
* 
*   QUESTION No: 5
***********************************************************************************************/

*create new dataset call Soccer;
data Soccer;
input Team : $20. Wins Losses;
datalines;
Readington 20 3
Raritan 10 10
Branchburg 3 18
Somerville 5 18
;

options nodate nonumber;
title;
ods listing close;
*print data to csv file;
ods csv file='/folders/myfolders/ban130/assignment3/submit/Soccer.csv';
proc print data=Soccer noobs;
run;
ods csv close;
ods listing;