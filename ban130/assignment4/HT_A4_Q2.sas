libname mylib '/folders/myfolders/ban130/assignment4/data/';

title 'Content of Shoes dataset';
proc contents data=mylib.shoes;
run;

title 'Content of Shoes_eclipse dataset';
proc contents data=mylib.shoes_eclipse;
run;

title 'Content of Shoes_tracker dataset';
proc contents data=mylib.shoes_tracker;
run;

proc append base=mylib.shoes data=mylib.shoes_eclipse force;
run;

proc append base=mylib.shoes data=mylib.shoes_tracker force;
run;

proc print data = mylib.shoes;
run;
