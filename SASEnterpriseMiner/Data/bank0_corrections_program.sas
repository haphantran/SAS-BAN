DATA ABA1.bank1;
	SET ABA1.bank0;
	IF education="SECONDARY" THEN education=LOWCASE(education);
	marital=LOWCASE(marital);
	IF job="ADMINISTRATION" THEN job="admin.";
	IF age>=100 THEN age=.;
RUN;
