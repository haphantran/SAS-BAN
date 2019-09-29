/********************************************************************************************** 
*  BAN130 – Assignment 2
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Sep 20, 2019 
* 
*   QUESTION No: 2
***********************************************************************************************/

*using filename statement and use fileref as the link to the file;
filename fileref '/folders/myfolders/ban130/data/political.csv';

*data step to input data from csv file;
data Votes;
infile fileref dsd;
input State $ Party $ Age;
run;

Title "Voting Dataset with State, Party and Age";
proc print data= votes;
run;

title "Party Frequencies table for Party";
proc freq data=votes;
	tables party;
run;