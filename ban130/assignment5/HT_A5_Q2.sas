libname learn '/folders/myfolders/data';


title "Statistics from BLOOD by Gender";
proc report data= learn.blood nowd headline;
	*use proc report;
	column Gender WBC RBC;
	*define column;
	define Gender /group width=6; *define group var: gender;
	*define reporting var;
	define WBC / analysis mean 'AverageWBC' width=7 format= comma6.0;
	define	RBC /analysis mean 'AverageRBC' width=7 format= 5.2;
	*report summary;
	rbreak after / summarize;	
run;
