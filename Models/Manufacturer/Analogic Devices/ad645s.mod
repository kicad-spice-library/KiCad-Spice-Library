* AD645S SPICE Macro-model                   1/91, Rev. A
*                                            JCB / PMI
*
* This version of the AD645 model simulates the worst case 
* parameters of the 'S' grade.  The worst case parameters
* used correspond to those in the data sheet.
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
.SUBCKT AD645S   1 2 99 50 30
*
* INPUT STAGE & POLE AT 40 MHZ
*
R1   1   3    5E11
R2   2   3    5E11
R3   5  50    104.9
R4   6  50    104.9
CIN  1   2    1E-12
C2   5   6    18.97E-12
I1   99  4    1E-3
IOS  1   2    1.0E-12
EOS  7   1    POLY(1)  17 24  500E-6  1
J1   5   2    4   JX
J2   6   7    4   JX
*
EREF 98  0    24  0   1
*  
* SECOND STAGE & POLE AT 3 HZ
*
R5   9  98    52.55E6
C3   9  98    1000E-12
G1   98  9    5  6  9.537E-3
V2   99  8    4.7
V3   10 50    4.7
D1   9   8    DX
D2   10  9    DX
*
* NEGATIVE ZERO AT 15 MHZ
*
R6   11 12     1E6
C4   11 12     -10.6E-15
R7   12 98     1
E2   11 98     9  24  1E6
*
* POLE AT 40 MHZ
*
R8   13 98     1E6
C5   13 98     3.98E-15
G2   98 13     12 24  1E-6
*
* POLE AT 40 MHZ
*
R9   14 98     1E6
C6   14 98     3.98E-15
G3   98 14     13 24  1E-6
*
* POLE AT 40 MHZ
*
R10  15 98     1E6
C7   15 98     3.98E-15
G4   98 15     14 24  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 600 HZ
*
R11  16 17     1E6
C8   16 17     0.265E-9
R12  17 98     1
E3   16 98     3  24  31.6
*
* POLE AT 40 MHZ
*
R13  18 98     1E6
C9   18 98     3.98E-15
G5   98 18     15 24  1E-6
*
* OUTPUT STAGE
*
R14  24 99     500E3
R15  24 50     500E3
ISY  99 50     2.5E-3
R16  29 99     360
R17  29 50     360
L1   29 30     1E-8
G6   27 50     18 29  2.78E-3
G7   28 50     29 18  2.78E-3
G8   29 99     99 18  2.78E-3
G9   50 29     18 50  2.78E-3
V4   25 29     2.0
V5   29 26     2.0
D3   18 25     DX
D4   26 18     DX
D5   99 27     DX
D6   99 28     DX
D7   50 27     DY
D8   50 28     DY
*
* MODELS USED
*
.MODEL JX PJF(BETA=45.48E-3  VTO=-2.000  IS=5.0E-12)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS AD645S