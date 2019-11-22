libname learn '/folders/myfolders/data';


title "Ages of Customers by Group and Gender";
proc tabulate data=learn.customer_dim;
	class customer_group customer_gender;
	var customer_age;
	table customer_group all, 
			customer_gender*(customer_age*(n Mean));
run;
