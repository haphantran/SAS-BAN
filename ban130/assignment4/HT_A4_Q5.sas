libname mylib '/folders/myfolders/ban130/assignment4/data/';

data mylib.evaluate;
set mylib.psych;


if n(of Ques1-Ques10) ge 7 then QuesAve=mean(of Ques1-Ques10);
if n(of Score1-Score5) eq 5 then maxscore=max(of Score1-Score5);
if n(of Score1-Score5) eq 5 then Minscore=min(of Score1-Score5);
if n(of Score1-Score5) eq 5 then SecondHighest=largest(2,of Score1-Score5); 
*using if then stmt to find max score min score secondhighest of the score variables;
run;

proc print data=mylib.evaluate;
run;