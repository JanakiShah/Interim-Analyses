*q1;
proc seqdesign errspend bscale=pvalue;
TwoSidedObrienFleming: design nstages=5 alpha=0.05
alt=twosided info=cum(0.4 0.56 0.72 0.88 1) method=errfuncobf
stop=reject;
run;

proc seqdesign errspend;
TwoSidedObrienFleming: design nstages=5 alpha=0.05
alt=twosided info=cum(0.4 0.56 0.72 0.88 1) method=errfuncobf
stop=reject;
run;

*q2;
proc seqdesign errspend bscale=pvalue;
TwoSidedObrienFleming: design nstages=5 alpha=0.05
alt=twosided info=cum(0.36 0.56 0.72 0.88 1) method=errfuncobf
stop=reject;
run;
proc seqdesign errspend ;
TwoSidedObrienFleming: design nstages=5 alpha=0.05
alt=twosided info=cum(0.36 0.56 0.72 0.88 1) method=errfuncobf
stop=reject;
run;

*q3;
proc seqdesign errspend;
TwoSidedObrienFleming: design nstages=5 alpha=0.05 alt=twosided 
info=cum(0.257 0.4 0.514 0.629 1)
method=errspend(0.00038 0.00548 0.0165 0.03376 0.05) 
stop=reject;
run;

proc seqdesign errspend bscale=pvalue;
TwoSidedObrienFleming: design nstages=5 alpha=0.05 alt=twosided 
info=cum(0.257 0.4 0.514 0.629 1)
method=errspend(0.00038 0.00548 0.0165 0.03376 0.05) 
stop=reject;
run;


*q4;
data interim2;
input group svr $ count;
cards;
1 Yes 158
1 No 192
0 Yes 122
0 No 228
;
run;

proc freq data=interim2;
weight count;
tables group*svr / chisq;
run;