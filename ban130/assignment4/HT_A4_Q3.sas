libname mylib '/folders/myfolders/ban130/assignment4/data/';

proc sort data=mylib.shoes_eclipse out=work.eclipsesort;
	by Product_Name;
run;

proc sort data=mylib.shoes_tracker out=work.trackersort;
	by Product_Name;
run;

data work.e_t_shoes (keep=product_group product_name Supplier_id); 
	set eclipsesort trackersort;
	by product_name;
run;

title "Listing of the e_t_shoes dataset";
proc print data=e_t_shoes;
run;