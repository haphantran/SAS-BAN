proc format;
	value $likert_new
		"1","2" = "Generally Disagree"
		"3" = "No Opinion"
		"4","5" = "Generally Agree";
run;

data voter2;
	set voter;
	format ques1-ques4 $likert_new.;
run;

proc print data=voter2 label;
run;

