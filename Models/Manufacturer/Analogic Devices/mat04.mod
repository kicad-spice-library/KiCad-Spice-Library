* MAT-04 SPICE Macro-model                 4/90, Rev. A
*                                          DFB / PMI
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
*
* Node assignments
*              C1
*              | B1
*              | | E1
*              | | | SUBSTRATE (MAY BE FLOATED,OR
*              | | | | E2       PREFERABLY, CONNECTED
*              | | | | | B2     TO V-)
*              | | | | | | C2
*              | | | | | | | C3
*              | | | | | | | | B3
*              | | | | | | | | | E3
*              | | | | | | | | | |  E4
*              | | | | | | | | | |  |  B4
*              | | | | | | | | | |  |  |  C4
*              | | | | | | | | | |  |  |  |
.SUBCKT MAT-04 1 2 3 4 5 6 7 8 9 10 12 13 14
Q1   1  2  3   NMAT
Q2   7  6  5   NMAT
Q3   8  9  10  NMAT
Q4   14 13 12  NMAT
D1   3  2      DMAT1
D2   5  6      DMAT1
D3   10 9      DMAT1
D4   12 13     DMAT1
D5   4  3      DMAT1
D6   4  5      DMAT1
D7   4 10      DMAT1
D8   4 12      DMAT1
D9   4  1      DMAT2
D10  4  7      DMAT2
D11  4  8      DMAT2
D12  4  14     DMAT2
.MODEL    DMAT1  D(IS=2E-16 RS=20)
.MODEL    DMAT2  D(IS=5E-15 VJ=0.6 CJO=25P)
.MODEL    NMAT NPN(BF=500 IS=3E-13 VAF=150 BR=0.5 VAR=7 
+ RB=26 RC=16 RE=0.4 CJE=41P VJE=0.7 MJE=0.4 TF=0.3E-9 
+ TR=5E-9 CJC=17P VJC=0.55 MJC=0.5 CJS=0 IKF=0.150 PTF=25)
.ENDS MAT-04