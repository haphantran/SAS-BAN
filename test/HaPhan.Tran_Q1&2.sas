*******Q1*******;

*data step to read the csv file;
data cars;
*infile statment with options and informat to read the data, also apply the format here;
infile '/folders/myfolders/test/CARS.csv' delimiter = ',' MISSOVER DSD firstobs=2 ;
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
	*input stament list all the variable with $ symbol for character variable;
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

*data step to create the temporary midautos dataset (in WORK library);
data midautos;
	set cars;
	*new variable AVGMPG equal to the average of mpg_city and mpg_highway;
	AvgMPG = mean(mpg_city, mpg_highway);
	*new variable msrp_invoice_total = sum of nsrp and invoice;
	msrp_invoice_total = msrp + invoice;
run;

*print out cars with avgMPG> 35;
title "Q1 - Cars with Average MPG Over 35";	
proc print data = midautos;
	*Use var statement to list desired output variable in proc print;
	var make model type avgmpg msrp_invoice_total;
	*where statement to subset the data set with condition;
	where avgmpg > 35;
run;

*using proc mean to produce report of avgMPG by type;
title "Q1 - Average MPG by Car Type";
proc means data = midautos mean min max maxdec=1;
	*avgmpg is the variable in the question;
	var avgmpg;
	*use class statement to produce the desired report: avgmpg by type;
	class type;
run;


*******Q2*******;

*data step to read the raw data from csv;
data WORK.banvitals;
	*infile statement with options;
	infile '/folders/myfolders/test/pvitals.csv' delimiter = ',' MISSOVER DSD  firstobs=2 ;
	*input statement list all variable in raw data;
	input	ID
			Age
			Pulse
			SBP
			DBP;
	*apply label for variable as the requirement;
	label SBP = "Systolic Blood Pressure"
		DBP = "Diastolic Blood Pressure";
run;

*data step to create new dataset midvitals;
data midvitals;
	*load original dataset banvitals;
	set banvitals;
	*define the length of new variables: PulseGroup and SBPGroup;
	format PulseGroup $4. SBPGroup $4.;
	*for people under the age of 50;
	if age < 50 then do;
	
		*apply the rule for pulseGroup;
		if pulse < 70 then pulseGroup = "Low";
		else pulseGroup = "High";
		
		*apply the rule for SBPGroup;
		if sbp<130 then sbpgroup = "Low";
		else SBPGroup = "High";
	end;
	*for people >= 50 years of age;
	else if age ge 50 then do;	
		*apply the rule for pulseGroup;
		if pulse < 74 then pulseGroup = "Low";
		else pulseGroup = "High";
		
		*apply the rule for SBPGroup;
		if sbp<140 then sbpgroup = "Low";
		else SBPGroup = "High";
	end;
	
	*ignore the case of missing age;

run;

*print out the data;
title "Q2 - Data from Midvitals - Ignore missing Age";
proc print data = midvitals;
run;
