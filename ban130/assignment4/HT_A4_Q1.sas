libname mylib '/folders/myfolders/ban130/assignment4/data/';

data work.bigdonations;
	set mylib.employee_donations;
	Total = sum(of Qtr1-qtr4);
	NoDonation = nmiss( of Qtr1-qtr4);
	if total lt 50 or Nodonation ~= 0 then delete;
run;

title "listing of BigDonations dataset";
proc print data = bigdonations;
	var employee_id qtr1-qtr4 total nodonation;
run;