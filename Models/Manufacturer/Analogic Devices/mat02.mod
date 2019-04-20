* MAT-02 SPICE Macro-model                 4/90, Rev. A
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
*              | | | E2
*              | | | | B2
*              | | | | | C2
*              | | | | | |
.SUBCKT MAT-02 1 2 3 5 6 7
Q1   1  2  3   NMAT
Q2   7  6  5   NMAT
D1   3  2      DMAT1
D2   5  6      DMAT1
D3   4  3      DMAT1
D4   4  5      DMAT1
D5   4  1      DMAT2
D6   4  7      DMAT2
.MODEL    DMAT1  D(IS=2E-16 RS=20)
.MODEL    DMAT2  D(IS=1E-14 VJ=0.6 CJO=40P)
.MODEL    NMAT NPN(BF=500 IS=6E-13 VAF=150 BR=0.5 VAR=7
+ RB=13 RC=10 RE=0.3 CJE=82P VJE=0.7 MJE=0.4 TF=0.3E-9 
+ TR=5E-9 CJC=33P VJC=0.55 MJC=0.5 CJS=0 IKF=0.300 PTF=25)
.ENDS MAT-02