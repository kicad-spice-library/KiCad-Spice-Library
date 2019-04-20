* AD9630 SPICE Macro-Model                    1/91, Rev. A
*                                             BT / IED
*
* Copyright 1990 by Analog Devices, Inc.
*
* The information on this diskette is protected under the
* United States copyright laws.  Analog Devices, Inc.("ADI")
* hereby grants users of these macro-models hereto referred
* to as licensee, a nonexclusive, nontransferable license to
* use these macro-models as long as the licensee abides by
* the terms of this agreement.  Before using the macro-
* models the licensee should read this license.  If the
* licensee does not accept these terms, this diskette should
* be returned to ADI within 30 days.
*
* The licensee may not sell, load, rent, lease, or license
* the macro-models, in whole, in part, or in modified form,
* to anyone outside the licensee's company.  The licensee
* may modify these macro-models to suit his specific
* applications, and the licensee may make copies of this 
* diskette or macromodels for use within his company only.
*
* These macro-models are provided "AS IS, WHERE IS, AND WITH
* NO WARRANTY OF ANY KIND EITHER EXPRESSED OR IMPLIED, 
* INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES OF
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE."
* In no event will ADI be liable for special, collateral,
* incidental, or consequential damages in connection with or
* arising out of the use of these macro-models.  ADI
* reserves the right to make changes to the products and the
* macro-models without prior notice.
*
************************************
*** WRITTEN BY BILL TOLLEY       ***
*** ANALOG DEVICES, IED DIVISION ***
*** GREENSBORO, NORTH CAROLINA   ***
***                              ***
*** PATENT PENDING               ***
***                              ***
*** FOR APPLICATIONS ASSITANCE:  ***
*** CALL (919) 668-9511 AND ASK  ***
*** FOR MARKETING APPLICATIONS   ***
************************************
*
*
.SUBCKT AD9630 1 14 100 110 
*
*** 1=VIN,14=VOUT,100=VCC,110=VEE **
*
C1 100 7 5.0P
C2 5 110 5.0P
C3 2 0 2.4P
C4 3 0 2.7P
C5 8 0 2.4P
C6 6 0 2.7P
F1 100 7 V1 1 
F2 5 110 V2 1  
F3 1 110 V3 1
GM1 4  5    poly(1) (2,6)   -0.027    0.020 
GM2 7 10    poly(1) (3,8)   -0.027   -0.020   
I1 100 2 1.5m
I2 3 110 1.5m
I3 100 8 1.5m
I4 6 110 1.5m
I5 100 7 2m
I6 5 110 2m
I7 100 17 1.5m
I8 18 110 1.5m
Q1 110 1 2 100 QPA
Q2 100 1 3 110 QNA
Q3 100 14 6 110 QNA
Q4 110 14 8 100 QPA
Q5 7 7 11 110 QNA
Q6 5 5 12 100 QPB
Q7 100 7 13 110 QNB 8
Q8 110 5 15 100 QPB 8
Q9 110 16 17 100 QPA
Q10 100 16 18 110 QNA
R1 100 2 45k
R2 3 110 161k  
R3 110 7 53k   
R4 5 110 17k
R5 13 14 6
R6 14 15 6
R7 11 12 24
R8 100 8 45k
R9 6 110 161k
R10 100 17 45K   
R11 18 110 45K   
V1 100 4 0
V2 10 110 0
V3 16 110 dc 5
*
*
*
.MODEL QNA NPN  RB=35, IRB=0, RBM=8, RC=20, RE=0.56, 
+ IS=4E-16, EG=1.2, XTI=2, XTB=2.4, BF=220, IKF=15E-3, 
+ VAF=66, ISE=3E-15, NE=1.7, BR=4, IKR=1E6, VAR=3, 
+ ISC=4.8E-20, NC=1.7, TF=24P, TR=4.4N, CJE=4.3E-13, 
+ VJE=1.11, MJE=0.5, CJC=3.4E-13, VJC=0.642 
+ XCJC=0.18,  CJS=4.9E-13, VJS=0.5,
+ MJS=0.32, ITF=65E-3, VTF=10, XTF=15   
*
.MODEL QNB NPN  RB=6, IRB=0, RBM=1.33, RC=3.1, RE=0.09, 
+ IS=24E-16, EG=1.21, XTI=2, XTB=2.4, BF=220, 
+ IKF=90E-3, VAF=66, ISE=18E-15, NE=1.7, 
+ BR=4, IKR=1E6, VAR=3, ISC=29E-20, NC=1.7, 
+ TF=22P, TR=7.3N, CJE=1.8E-12, VJE=1.11, MJE=0.5, 
+ CJC=1.59E-12, VJC=0.62, MJC=0.34, XCJC=0.23, 
+ CJS=1.28E-12, VJS=0.5, MJS=0.32, 
+ITF=200E-3, VTF=10, XTF=15   
*
.MODEL QPA PNP  RB=36, IRB=0, RBM=13, RC=14, RE=0.3, 
+ IS=2.4E-16, EG=1.21, XTI=1.5, XTB=2.1, BF=115, 
+ IKF=30E-3, VAF=30, ISE=12E-15, NE=1.6, 
+ BR=4, IKR=1E6, VAR=1.4, ISC=5E-18, NC=1.6, 
+ TF=41P, TR=5.3N, CJE=2.4E-13, VJE=0.89, MJE=0.49, 
+ CJC=5.37E-13, VJC=0.53, MJC=0.19, XCJC=0.17, 
+ CJS=1.11E-12, VJS=0.6, MJS=0.35, 
+ITF=150E-3, VTF=10, XTF=5   
*
.MODEL QPB PNP  RB=29, IRB=0, RBM=10, RC=13, RE=0.24, 
+ IS=3.03E-16, EG=1.21, XTI=1.5, XTB=2.1, BF=115, 
+ IKF=38E-3, VAF=30, ISE=15E-15, NE=1.56, 
+ BR=4, IKR=1E6, VAR=1.4, ISC=6E-18, NC=1.63, 
+ TF=39P, TR=5.45N, CJE=3.9E-13, VJE=0.89, MJE=0.49, 
+ CJC=6.41E-13, VJC=0.53, MJC=0.19, XCJC=0.18, 
+ CJS=1E-12, VJS=0.6, MJS=0.35, 
+ITF=150E-3, VTF=10, XTF=5   
*
.MODEL QPC PNP  RB=4.76, IRB=0, RBM=1.71, RC=2.84, RE=0.04, 
+ IS=18.15E-16, EG=1.21, XTI=1.5, XTB=2.1, BF=115, 
+ IKF=225E-3, VAF=30, ISE=92E-15, NE=1.56, 
+ BR=4, IKR=1E6, VAR=1.4, ISC=3.74E-17, NC=1.63, 
+ TF=31P, TR=7.6N, CJE=1.8E-12, VJE=0.89, MJE=0.49, 
+ CJC=3E-12, VJC=0.53, MJC=0.19, XCJC=0.23, 
+ CJS=4.52E-12, VJS=0.6, MJS=0.35, 
+ITF=200E-3, VTF=10, XTF=4   
*
.ENDS AD9630