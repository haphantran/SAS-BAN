/*******************************************************************/
/*program Bank_Program.sas										   */
/*james.harroun@sas.com											   */
/*10 april 2016													   */
/*******************************************************************/ 


*
create ABA1 library
;


LIBNAME ABA1 "D:\Workshop\WINSAS\GAABA";

*
create ABA1.demog data set--rename Education, JOB, and AGE variables to education, job, and age, respectively
;


PROC SQL; 
CREATE TABLE ABA1.z_demog 
AS 
SELECT CUSTOMER_DEMOGRAPHICS.Education 
AS education, CUSTOMER_DEMOGRAPHICS.customer_id, CUSTOMER_DEMOGRAPHICS.AGE 
AS age, CUSTOMER_DEMOGRAPHICS.marital, CUSTOMER_DEMOGRAPHICS.JOB 
AS job 
FROM ABA1.CUSTOMER_DEMOGRAPHICS CUSTOMER_DEMOGRAPHICS; 
QUIT;


*
import customer_banking_info.csv file with default end of line indicator and save as ABA1.info_import data set
;


FILENAME REFFILE 'D:\Workshop\WINSAS\GAABA\customer_banking_info.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.z_info_import
	REPLACE;
	GETNAMES=YES;
	DATAROW=2;
RUN;


*
create ABA1.info data set from ABA1.info_import data set--rename customer_id1 to customer_id
; 


PROC SQL; 
CREATE TABLE ABA1.z_info 
AS 
SELECT INFO_IMPORT.customer_id1 
AS customer_id, INFO_IMPORT.default, INFO_IMPORT.balance, INFO_IMPORT.housing, INFO_IMPORT.loan 
FROM WORK.z_INFO_IMPORT INFO_IMPORT; 
QUIT;


*
import customer_banking_info_promo.xlsx file with defaults and save as WORK.z_promo_import data set
; 


FILENAME REFFILE 'D:\Workshop\WINSAS\GAABA\customer_banking_info_promo.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.z_promo_import
	REPLACE;
	GETNAMES=YES;
RUN;


*
create data set ABA1.z_promo from data set ABA1.z_promo_import
convert customer_id2 to numeric customer_id variable and drop customer_id2 variable
;


DATA ABA1.z_promo;
	SET WORK.z_promo_import;
	DROP customer_id2;
	customer_id=INPUT(customer_id2,12.);
RUN;


*
merge ABA1.z_demog, ABA1.z_info, and ABA1.z_promo to create ABA1.z_bank0
;


PROC SQL; 
CREATE TABLE ABA1.Z_bank0 
AS 
SELECT DEMOG.customer_id, DEMOG.age, INFO.balance, DEMOG.education, DEMOG.marital, DEMOG.job, INFO.default, INFO.housing, INFO.loan, PROMO.contact, PROMO.day, PROMO.month, PROMO.duration, PROMO.campaign, PROMO.pdays, PROMO.previous, PROMO.poutcome, PROMO.y 
FROM ABA1.Z_DEMOG DEMOG 
INNER JOIN ABA1.Z_INFO INFO 
ON 
   ( DEMOG.customer_id = INFO.customer_id ) 
INNER JOIN ABA1.Z_PROMO PROMO 
ON 
   ( INFO.customer_id = PROMO.customer_id ) ; 
QUIT;


*
Characterize data set ABA1.z_bank0
;

ods noproctitle;

/*** Analyze categorical variables ***/
title "Frequencies for Categorical Variables";

proc freq data=ABA1.Z_BANK0;
	tables education marital job default housing loan contact month poutcome y;
run;

/*** Analyze numeric variables ***/
title "Descriptive Statistics for Numeric Variables";

proc means data=ABA1.Z_BANK0 n nmiss min mean median max std;
	var customer_id age balance day duration campaign pdays previous;
run;


*
create data set ABA1.z_bank1 from ABA1.z_bank0 data set
recode variables education, marital, job, and age identified as problematic in characterization of bank0 data set
;


DATA ABA1.z_bank1;
	SET ABA1.z_bank0;
	IF education="SECONDARY" THEN education=LOWCASE(education);
	marital=LOWCASE(marital);
	IF job="ADMINISTRATION" THEN job="admin.";
	IF age>=100 THEN age=.;
RUN;


*
characterize data set ABA1.z_bank1
;


ods noproctitle;

/*** Analyze categorical variables ***/
title "Frequencies for Categorical Variables";

proc freq data=ABA1.Z_BANK1;
	tables education marital job default housing loan contact month poutcome y;
run;

/*** Analyze numeric variables ***/
title "Descriptive Statistics for Numeric Variables";

proc means data=ABA1.Z_BANK1 n nmiss min mean median max std;
	var customer_id age balance day duration campaign pdays previous;
run;


*
create data set ABA1.z_bank2 from ABA1.z_bank1
recode pdays variable to three class levels: -1, 1, annd 2 based on customer contact status
;


DATA ABA1.z_bank2;
	SET ABA1.z_bank1;
	IF 1<=pdays<=273 THEN pdays=1;
	ELSE IF pdays>=274 THEN pdays=2;
RUN;


*
proc freq  one way frequency table and frequency plot of pdays variable in ABA1.z_bank2 data set
;


proc freq data=ABA1.z_bank2;
	tables pdays / plots=(freqplot cumfreqplot);
run;


*
summary statistics and histogram of balance (analysis) and y (class) variables in ABA1.z_bank2 data set
;


proc means data=ABA1.Z_BANK2 chartype mean std min max n vardef=df;
	var balance;
	class y;
run;

proc univariate data=ABA1.Z_BANK2 vardef=df noprint;
	var balance;
	class y;
	histogram balance;
run;


*
bar chart of balance (response) and age (category) variables in ABA1.z_bank2 data set
;


/*--Set output size--*/
ods graphics / reset width=8in height=6in imagemap;

/*--SGPLOT proc statement--*/
proc sgplot data=ABA1.Z_BANK2;
	/*--Bar chart settings--*/
	vbar Age / response=balance stat=Mean name='Bar';

	/*--Response Axis--*/
	yaxis grid;
run;

ods graphics / reset;





