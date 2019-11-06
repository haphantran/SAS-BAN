/********************************************************************************************** 
*  BAN130 – Assignment 3
*  I declare that this assignment is my own work in accordance with Seneca  Academic Policy. 
*  No part of this assignment has been copied manually or electronically from any other source 
*  (including web sites) or distributed to other students. 
*  
*	Name: HaPhan Tran Student ID: 122 699 176 Date: Oct 15, 2019 
* 
*   QUESTION No: 2
***********************************************************************************************/

*use procedure format to create approriate format;
proc format;
	value $likert_new
		"1","2" = "Generally Disagree"
		"3" = "No Opinion"
		"4","5" = "Generally Agree";
	*format for displaying party in full not in abbreviation;
	value $party
		"D" = "Democrat"
		"R" = "Republican";
	*format for displaying age group;
	value age
		0-30 = "0-30"
		31-50 = "31-50"
		51-70 = "51-70"
		71-high = "71+";
run;


*Data step to read the data in with label for questions;
data Voter2; 
	input Age Party : $1. (Ques1-Ques4)($1. + 1);
	label 
		Ques1 = "The president is doing a good job"
		Ques2 = "Congress is doing a good job"
		Ques3 = "Taxes are too high"
		Ques4 = "Government should cut spending";	
	format Ques1-Ques4 $Likert_new. age age. party $party.;
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


title "The frequency distribution for voter dataset with new format for questions";
proc freq data=voter2;
run;

