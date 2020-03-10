libname mylib '/folders/myfolders/ban130/assignment4/data/';
proc sort data=mylib.bicycles out=bike;
	by Manuf;
run;
proc sort data = markup;
	by manuf;
run;

data bike;
	merge bike (in=in_bike)
		markup (in=in_manuf);
	by manuf;
	if in_bike and in_manuf;
run;

data Markup_Prices;
	set bikes2;
	newTotal = TotalSales*Markup;
proc print data=Markup_Prices;
run;
