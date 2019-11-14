libname mylib '/folders/myfolders/ban130/assignment4/data/';

*a) 3 proc contents to compare the variable in 3 dataset;
title 'Content of Shoes dataset';
proc contents data=mylib.shoes;
run;

title 'Content of Shoes_eclipse dataset';
proc contents data=mylib.shoes_eclipse;
run;

title 'Content of Shoes_tracker dataset';
proc contents data=mylib.shoes_tracker;
run;
*b) proc append to append shoes_eclipse and shoes_tracker to shoes -  using forces option;
proc append base=mylib.shoes data=mylib.shoes_eclipse force;
run;
proc append base=mylib.shoes data=mylib.shoes_tracker force;
run;

*c) print shoes dataset with 34 obs;
proc print data = mylib.shoes;
run;
