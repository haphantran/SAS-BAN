libname learn "/folders/myfolders/BAN130/";


title "Statistics from BLOOD by Gender";
proc report data= learn.blood ;
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



Title 'First 5 Observations from Blood Data Set';
proc report data= learn.blood (obs=5);
	*use proc report;
	column Subject WBC RBC;
	*define column;
	define Subject /display 'Subject number' f=3. width=6; *define display var: subject;
	*define reporting var;
	define WBC / display  'White Blood Cells' width=7 format= comma6.0;
	define	RBC /display  'Red Blood Cells' width=7 format= 5.2;	
run;

title "Question 3";

proc report data = learn.blood;				  /* creat table*/
	column bloodtype agegroup,gender,rbc;		/* select variables gender,rbc in column  */
	define bloodtype / group;					/* group rows by bloodtype*/
	define agegroup / across;					/* column group by AgeGroup*/
	define gender / across;						/* column group by gender */
	define rbc / analysis mean;					/* mean of rbc*/
run;