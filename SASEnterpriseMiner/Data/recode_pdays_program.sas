DATA ABA1.bank2;
	SET ABA1.bank1;
	IF 1<=pdays<=273 THEN pdays=1;
	ELSE IF pdays>=274 THEN pdays=2;
RUN;
