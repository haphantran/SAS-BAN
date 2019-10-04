libname myfmts "/folders/myfolders/ban130/assignment3/q4format";
options fmtsearch=(myfmts);
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