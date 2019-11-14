
libname mylib '/folders/myfolders/ban130/assignment4/data/';

*a;
data mylib.evaluate;
set mylib.psych;

	*using if to find QuesAve
	*i;if n(of Ques1-Ques10) ge 7 then QuesAve=mean(of Ques1-Ques10);
	
	*using if find max score min score secondhighest of the score variables;
	*ii;if n(of Score1-Score5) eq 5 then maxscore=max(of Score1-Score5);
	if n(of Score1-Score5) eq 5 then Minscore=min(of Score1-Score5);
	if n(of Score1-Score5) eq 5 then SecondHighest=largest(2,of Score1-Score5); 

run;

proc print data=mylib.evaluate;
run;

*b;
data medical1;
	set mylib.medical;
	if not findw(comment,'antibiotics',' ','i') then delete;
run;
title "All patients in the Medical data set where the word antibiotics is in the comment field";
proc print data=medical1;
run;

*c;
data tempq5c;
	set mylib.survey;
	array questions(*) ques1-ques5;
	do i = 1 to dim (questions);
		if questions(i) = '5' then do;
			Any5  = 'Yes';
			leave;
		end;		
	end;
	drop i;
run;

title "Listing of Survey data set with newly created variable - Any5";
proc print data = tempq5c noobs;
run;


