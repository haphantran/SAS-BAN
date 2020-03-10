libname learn '/folders/myfolders/data';

*a;

proc sort data=learn.sales;
	*sort dataset by region and totalsales;
	by region totalsales;
run;


title "Sales Figures from  the Sales Data Set";
proc print data=learn.sales noobs;
	*print dataset with sum and var;
	id region;
	by region;
	sum quantity totalsales;
	var region quantity totalsales;
run;


*b;

title "First 5 observation of Blood dataset";
*print first 5 rows;
proc print data = learn.blood 
	(obs=5) 
	noobs ; *omit obs column using noobs option in proc print;
	var Subject gender bloodtype; *print required variables;
run;