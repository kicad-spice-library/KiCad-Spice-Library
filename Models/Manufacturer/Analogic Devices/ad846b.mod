* AD846B SPICE Macro-model                  1/91, Rev. A   
*                                           JCB / PMI
*
* This version of the AD846 model simulates the worst case 
* parameters of the 'B' grade.  The worst case parameters
* used correspond to those in the data sheet.
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
*              non-inverting input
*              | inverting input
*              | | positive supply
*              | | |  negative supply
*              | | |  |  output
*              | | |  |  |  compensation pin
*              | | |  |  |  |     
.SUBCKT AD846B 1 2 99 50 28 12
*
* INPUT STAGE
*
R1   99  8     1K
R2   10 50     1K
V1   99  9     1.7
D1   9   8     DX
V2   11 50     1.7
D2   10 11     DX
I1   99  5     275U
I2   4  50     275U
Q1   50  3  5  QP
Q2   99  3  4  QN
Q3   8   6 30  QN
Q4   10  7 30  QP
R3   5   6     300K
R4   4   7     300K
*
* INPUT ERROR SOURCES
* 
GB1  99  1     POLY(1)  1  22  5E-6    10E-9
GB2  99 30     POLY(1)  1  22  250E-9  5E-9
VOS  3   1     75E-6
LS1  30  2     50E-9
CS1  99  2     2.0E-12
CS2  99  1     2.0E-12
*
EREF 97  0     22  0  1
*
* TRANSCONDUCTANCE STAGE
*
R5   12 97     150E6
C3   12 97     5.5P
G1   97 12     99  8  1E-3
G2   12 97     10 50  1E-3
V3   99 13     5.0
V4   14 50     5.0
D3   12 13     DX
D4   14 12     DX
*
* POLE AT 100 MHZ
*
R8  17 97     1E6
C4  17 97     1.59E-15
G4  97 17     12 22  1E-6
*
* POLE AT 100 MHZ
*
R9  18 97     1E6
C5  18 97     1.59E-15
G5  97 18     17 22  1E-6
*
* POLE AT 200 MHZ
*
R10 19 97     1E6
C6  19 97     0.795E-15
G6  97 19     18 22  1E-6
*
* POLE AT 500 MHZ
*
R11 20 97     1E6
C7  20 97     0.318E-15
G7  97 20     19 22  1E-6
*
* POLE AT 500 MHZ
*
R12 21 97     1E6
C8  21 97     0.318E-15
G8  97 21     20 22  1E-6
*
* OUTPUT STAGE
*
ISY 99 50     5.05E-3
R13 22 99     16.67E3
R14 22 50     16.67E3
R15 27 99     60
R16 27 50     60
L2  27 28     1E-8
G9  25 50     21 27  16.67E-3
G10 26 50     27 21  16.67E-3
G11 27 99     99 21  16.67E-3
G12 50 27     21 50  16.67E-3
V5  23 27     1.35
V6  27 24     1.35
D5  21 23     DX
D6  24 21     DX
D7  99 25     DX
D8  99 26     DX
D9  50 25     DY
D10 50 26     DY
*
* MODELS USED
*
.MODEL QN   NPN(BF=1E9 IS=1E-15 VAF=16.3K)
.MODEL QP   PNP(BF=1E9 IS=1E-15 VAF=16.3K)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS AD846B
