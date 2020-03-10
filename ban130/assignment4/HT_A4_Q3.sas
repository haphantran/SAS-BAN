libname mylib '/folders/myfolders/ban130/assignment4/data/';

*starter program;
proc sort data=mylib.shoes_eclipse out=work.eclipsesort;
	by Product_Name;
run;

*a) sort shoes_tracker;
proc sort data=mylib.shoes_tracker out=work.trackersort;
	by Product_Name;
run;
*b) interleaved 2 datasets;
data work.e_t_shoes (keep=product_group product_name Supplier_id); *keep 3 variables;
	set eclipsesort trackersort;
	by product_name;
run;

title "Listing of the e_t_shoes dataset";
proc print data=e_t_shoes;
run;