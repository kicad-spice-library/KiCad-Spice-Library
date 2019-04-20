* OP-43G SPICE Macro-model                  12/90, Rev. A
*
*
* This version of the OP-43 model simulates the worst case 
* parameters of the 'G' grade.  The worst case parameters
* used correspond to those in the data book.
*
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
.SUBCKT OP-43G   1 2 99 50 20
*
* INPUT STAGE AND POLE AT 5 MHZ
*
R1   1  3     5E12
R2   2  3     5E12
R3   5 50     2.74K
R4   6 50     2.74K
CIN  1  2     5E-12
C2   5  6     5.81E-12
I1  99  4     1E-4
IOS  1  2     2.5E-12
EOS  7  1     POLY(1)  12 14  1.5E-3  1
J1   5  2  4  JX
J2   6  7  4  JX
*
EREF 98  0    14  0  1
*
* GAIN STAGE & DOMINANT POLE AT 9.7 HZ
*
R5  8  98     822E6
C3  8  98     20.0E-12
G1  98  8     5  6  365E-6
V2  99  9     4.05
V3  10 50     4.05
D1  8   9     DX
D2  10  8     DX
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 3500 HZ
*
R6  11 12     1E6
C4  11 12     45.0E-12
R7  12 98     1
E2  11 98     3  14  31.6
*
* POLE AT 6 MHZ
*
R8   13 98    1E6
C5   13 98    26.5E-15
G2   98 13    8  14  1E-6
*
* OUTPUT STAGE
*
R9  14 99     400E3
R10 14 50     400E3
ISY 99 50     1062.5E-6
R11 15 99     200
R12 15 50     200
L1  15 20     2.5E-7
G3  18 50     13 15  5E-3
G4  19 50     15 13  5E-3
G5  15 99     99 13  5E-3
G6  50 15     13 50  5E-3
V4  16 15     -0.1
V5  15 17     -0.1
D3  13 16     DX
D4  17 13     DX
D5  99 18     DX
D6  99 19     DX
D7  50 18     DY
D8  50 19     DY
*
* MODELS USED
*
.MODEL JX PJF(BETA=667E-6  VTO=-2.000  IS=25.0E-12)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-43G
