* OP-215G SPICE Macro-model                 10/90, Rev. A
*                                           AN / PMI
*
* This version of the OP-215 model simulates the worst case 
* parameters of the 'G' grade.  The worst case parameters
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
*                non-inverting input
*                | inverting input
*                | | positive supply
*                | | |  negative supply
*                | | |  |  output
*                | | |  |  |
.SUBCKT OP-215G  1 2 99 50 26
*
* INPUT STAGE & POLE AT 150 MHZ
*
R1   1  3     5E11
R2   2  3     5E11
R3   5 50     159
R4   6 50     159
CIN  1  2     3E-12
C2   5  6     3.33E-12
I1  99  4     1E-3
IOS  1  2     5E-11
EOS  7  1     POLY(1)  18 20  6E-3  1
J1   5  2  4  JX
J2   6  7  4  JX
*
EREF 98 0    20  0  1
*
* SECOND STAGE & POLE AT 100 HZ
*
R5   9 98     7.96E6
C3   9 98     200E-12
G1  98  9     5  6  6.28E-3
V2  99  8     4.12
V3  10 50     4.12
D1   9  8     DX
D2  10  9     DX
*
* NEGATIVE ZERO AT 30 MHZ
*
R6  11 12    1E6
R7  12 98    1
E1  11 98    9  98  1E6
C4  11 12    -5.305E-15
*
* POLE AT 200 MHZ
*
R8  13 98     1E6
C5  13 98     7.95E-16
G2  98 13     12 20  1E-6
*
* POLE AT 100 MHZ
*
R9  14 98     1E6
C6  14 98     1.59E-15
G3  98 14     13 20  1E-6
*
* POLE AT 150 MHZ
*
R10 15 98     1E6
C7  15 98     1.061E-15
G4  98 15     14 20  1E-6
*
* POLE AT 100 MHZ
*
R11 16 98     1E6
C8  16 98     1.59E-15
G5  98 16     15 20  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 4 KHZ
*
R12 17 18     1E6
R13 18 98     1
C9  17 18     39.8E-12
E2  17 98     3  20  100
*
* POLE AT 100 MHZ
*
R14 19 98     1E6
C10 19 98     1.59E-15
G6  98 19     16 20  1E-6
*
* OUTPUT STAGE
*
R15 20 99     135E3
R16 20 50     135E3
ISY 99 50     10.9E-3
R17 25 99     172.78
R18 25 50     172.78
L2  25 26     4E-11
G7  23 50     19 25  5.79E-3
G8  24 50     25 19  5.79E-3
G9  25 99     99 19  5.79E-3
G10 50 25     19 50  5.79E-3
V4  21 25     1.4
V5  25 22     1.4
D3  19 21     DX
D4  22 19     DX
D5  99 23     DX
D6  99 24     DX
D7  50 23     DY
D8  50 24     DY
*
* MODELS USED
*
.MODEL JX PJF(BETA=19.7E-3  VTO=-2.000  IS=300E-12)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-215G