/********************************************************************************************** 
*  BAN130 – Assignment 3
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Oct 15, 2019 
* 
*   QUESTION No: 4
***********************************************************************************************/


*define the library myfmts;
libname myfmts "/folders/myfolders/ban130/assignment3/q4format";

*option to search format in the myfmts library;
options fmtsearch=(myfmts);

*format with lib option to save the format to the library myfmts;
proc format lib = myfmts;
	value yesno
		1 = "Yes"
		0 = "No";
	value $Yesno
		"Y" = "Yes"
		"N" = "No";
	value $Gender
		"M" = "Male"
		"F" = "Female";
	value Age20yr 
		low-20 = 1
		21-40 = 2
		41-60 = 3
		61-80 = 4
		81-high = 5;
run;

title "Format Definitions in the mylib Library";
proc format library=myfmts fmtlib;
run;