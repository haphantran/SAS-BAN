libname learn '/folders/myfolders/data';

title "Hypertensive Patients";
proc report data=learn.bloodpressure;
	*proc report for dataset bloodpressure;
	*list column;
	column Gender sbp dbp Hypertensive;

	*display columns;
	define gender /display;
	define sbp / display;
	define dbp/ display;
	
	*computed column;
	define Hypertensive / computed  width=15 'Hypertensive?';
	
	*how to compute new variable;
	compute Hypertensive / character length=3;
		if gender = 'F' and (sbp >138 or dbp > 88) then	 Hypertensive = 'Yes';
		else if  gender = 'F' then Hypertensive='No' ;
		else if (sbp >140 or dbp > 90) then Hypertensive = 'Yes';
		else Hypertensive='No';		
	endcomp;

run;
