libname mylib "/folders/myfolders/ban130/assignment3/tmp";
options fmtsearch=(mylib);
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

data Voter; 
	input Age Party : $1. (Ques1-Ques4)($1. + 1);
	label 
		Ques1 = "The president is doing a good job"
		Ques2 = "Congress is doing a good job"
		Ques3 = "Taxes are too high"
		Ques4 = "Government should cut spending";	
	format Ques1-Ques4 $Likert. age age. party $party.;
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



proc print data = voter label;
run;

proc freq data=voter;
run;

title "Format Definitions in the mylib Library";
proc format library=mylib fmtlib;
run;
	