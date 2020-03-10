libname learn '/folders/myfolders/data';

*repair product_list;
proc datasets library=learn noprint;
repair product_list;
quit;

*a;

proc freq data=learn.order_fact noprint; * use noprint to skip the output; 
	tables Product_ID / nocum nopercent out=count_product;
run;

data count_product;
	set count_product (drop =percent);
run;

proc sort data=count_product;
	by product_id;
run;


proc sort data=learn.product_list out=product_list2;
	by product_id;
run;
*b;
data count_product;
	merge count_product (keep = product_id count)
		product_list2 (keep = product_name product_id);
	by product_id;
run;

proc sort data= count_product;
	by descending count ;
run;


title "Top Ten Products by Number of Orders";
proc print data = count_product (obs=10) label;
	var Count product_id product_name;
	LABEL Count='Orders' product_id='Product Number' product_name='Product';
run;

