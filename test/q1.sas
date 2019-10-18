data cars;
infile '/folders/myfolders/test/CARS.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
		informat Make $15. ;
		informat Model $40. ;
		informat Type $6. ;
		informat Origin $6. ;
		informat DriveTrain $5. ;
		informat MSRP dollar9. ;
		informat Invoice dollar9. ;
		informat EngineSize best32. ;
		informat Cylinders best32. ;
		informat Horsepower best32. ;
		informat MPG_City best32. ;
		informat MPG_Highway best32. ;
		informat Weight best32. ;
		informat Wheelbase best32. ;
		informat Length best32. ;
		format Make $15. ;
		format Model $40. ;
		format Type $6. ;
		format Origin $6. ;
		format DriveTrain $5. ;
		format MSRP dollar9. ;
		format Invoice dollar9. ;
		format EngineSize best12. ;
		format Cylinders best12. ;
		format Horsepower best12. ;
		format MPG_City best12. ;
		format MPG_Highway best12. ;
		format Weight best12. ;
		format Wheelbase best12. ;
		format Length best12. ;
	input
	Make  $
	Model  $
	Type  $
	Origin  $
	DriveTrain  $
	MSRP  
	Invoice
	EngineSize
	Cylinders
	Horsepower
	MPG_City
	MPG_Highway
	Weight
	Wheelbase
	Length;
run;

data midautos;
	set cars;
	avgmpg = mean(mpg_city, mpg_highway);
	MSRP_INVOICE_TOTAL = msrp + invoice;
run;

title "Cars with Average MPG Over 35";	
proc print data = midautos;
	var make model type avgmpg msrp_invoice_total;
	where avgmpg > 35;
run;
title "Average MPG by Car Type";
proc means data = midautos mean min max maxdec=1;
	var avgmpg;
	class type;
run;
