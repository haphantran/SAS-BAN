/********************************************************************************************** 
*  BAN130 – Assignment 3
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Oct 15, 2019 
* 
*   QUESTION No: 3
***********************************************************************************************/

*define the library mylib;
libname mylib "/folders/myfolders/ban130/assignment3/tmp";
*option to define where to search the format;
options fmtsearch=(mylib); 

*format with lib option to save the format to the library mylib;
proc format lib = mylib;
	value age
		0-30 = "0-30"
		31-50 = "31-50"
		51-70 = "51-70"
		71-high = "71+";
	value $party
		"D" = "Democrat"
		"R" = "Republican";
	value $likert
		"1" = "Strongly Disagree"
		"2" = "Disagree"
		"3" = "No Opinion"
		"4" = "Agree"
		"5" = "Strongly Agree";
run;

*Data step to read the data in with label for questions;
data Voter; 
	input Age Party : $1. (Ques1-Ques4)($1. + 1);
	*label for questions;
	label 
		Ques1 = "The president is doing a good job"
		Ques2 = "Congress is doing a good job"
		Ques3 = "Taxes are too high"
		Ques4 = "Government should cut spending";	
	format Ques1-Ques4 $Likert. age age. party $party.;
*datalines where all the data sit;
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3
57 R 4 3 4 4
;
run;


title "Format Definitions in the mylib Library";
proc format library=mylib fmtlib;
run;
	