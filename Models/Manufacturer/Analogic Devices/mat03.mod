* MAT-03 SPICE Macro-model                 10/88, Rev. B
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
.SUBCKT MAT-03 1 2 3 5 6 7
Q1   1  2  3   PMAT
Q2   7  6  5   PMAT
D1   2  3      DMAT1
D2   6  5      DMAT1
D3   3  4      DMAT1
D4   5  4      DMAT1
D5   1  4      DMAT2
D6   7  4      DMAT2
.MODEL    DMAT1  D(IS=7.2E-16 RS=20)
.MODEL    DMAT2  D(IS=1E-14 VJ=0.6 CJO=68P)
.MODEL    PMAT PNP(BF=160 IS=1.4E-13 VAF=60 BR=5 VAR=7 RB=16
+ RC=12 RE=0.35 CJE=57P VJE=0.7 MJE=0.4 TF=1.08E-9 
+ TR=3E-8 CJC=40P VJC=0.55 MJC=0.5 CJS=0 IKF=160M)
.ENDS MAT-03