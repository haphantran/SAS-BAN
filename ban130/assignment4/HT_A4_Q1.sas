libname mylib '/folders/myfolders/ban130/assignment4/data/';

data work.bigdonations;
	set mylib.employee_donations;
	*calculate total;
	Total = sum(of Qtr1-qtr4);
	
	*count the number of missing value - NoDonation;
	NoDonation = nmiss( of Qtr1-qtr4);
	
	*use if statement to delete observation;
	if total lt 50 or Nodonation ~= 0 then delete;
run;

title "Listing of BigDonations dataset";
proc print data = bigdonations;
	*include required variable;
	var employee_id qtr1-qtr4 total nodonation;
run;