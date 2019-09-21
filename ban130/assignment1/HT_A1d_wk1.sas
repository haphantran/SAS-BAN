data prob2;
input ID $
Height /* in inches */
Weight /* in pounds */
SBP /* systolic BP */
DBP /* diastolic BP */;

HtCm = height*2.54;
WtKg = weight/2.2;
AveBP = DBP + (SBP-DBP)/3;
HtPolynomial = 2*Height**2 + 1.5*height**3;

datalines;
001 68 150 110 70
002 73 240 150 90
003 62 101 120 80
;
title "Listing of PROB2";
proc print data=prob2;
run;
