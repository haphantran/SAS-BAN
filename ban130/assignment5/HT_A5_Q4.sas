libname learn '/folders/myfolders/data';

*a;
proc freq data=learn.order_fact;
	tables Product_ID / nocum nopercent out=count_product;
run;

data count_product;
	set count_product (drop =percent);
run;

proc sort data=count_product;
	by product_id;
run;


proc sort data=learn.product_list;
	by product_id;
run;
	
data count_product ;
	merge count_product 
		learn.product_list (keep= product_id, product_name);
	by product_id;
run;

proc sort data= count_product;
	by count;
run;


title "Top Ten Products by Number of Orders";
proc print data = count_product (obs=10);
run;
