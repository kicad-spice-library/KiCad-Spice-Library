* AD829 SPICE Macro-model                   9/90, Rev. A
*                                           JCB / PMI
*
* Copyright 1990 by Analog Devices
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
*               non-inverting input
*               | inverting input
*               | | positive supply
*               | | |  negative supply
*               | | |  |  output
*               | | |  |  |  compensation node
*			 | | |  |  |  |
.SUBCKT AD829   1 2 99 50 30 12
*
* INPUT STAGE & POLE AT 200 MHZ
*
R1   2  3     17.8k
R2   1  3     17.8k
R3   5 99     56.4
R4   6 99     56.4
CIN  1  2     5E-12
C2   5  6     7.18E-12
I1   4  50    1.2E-3
IOS  1  2     25E-9
EOS  9  1     POLY(1)  19 23  0.2E-3  1
Q1   5  2 10  QX
Q2   6  9 11  QX
R5   10 4     13.4
R6   11 4     13.4
*
EREF 98 0     23  0  1
*
* GAIN STAGE & DOMINANT POLE AT 5.4 KHZ
*
R7  12 98     5.64E6
C3  12 98     5.2E-12
G1  98 12     5  6  17.73E-3
V2  99 13     2.1
V3  14 50     2.1
D3  12 13     DX
D4  14 12     DX
*
* ZERO/POLE PAIR AT 50MHz/100MHz
*
R8  15 16     1E6
R9  16 98     1E6
L1  16 98     1.59E-3
G2  98 15     12 23  1E-6
*
* POLE AT 400 MHZ
*
R41 41 98     1E6
C41 41 98     398E-18
G41 98 41     15 23  1E-6
*
* POLE AT 400 MHZ
*
R42 42 98     1E6
C42 42 98     398E-18
G42 98 42     41 23  1E-6
*
* POLE AT 200 MHZ
*
R43 43 98     1E6
C43 43 98     796E-18
G43 98 43     42 23  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 3 kHZ
*
R11 18 19     1E6
C6  18 19     53.1E-12
R12 19 98     1
E2  18 98     3  23  1
*
* POLE AT 400 MHZ
*
R15 22 98     1E6
C8  22 98     398E-18
G3  98 22     43 23  1E-6
*
* OUTPUT STAGE
*
RF  25 60     500
CF  60 12     12.5p
R16 23 99     100k
R17 23 50     100k
ISY 99 50     3.95E-3
R18 25 99     30
R19 25 50     30
L2  25 30     1E-8
G4  28 50     22 25  33.33E-3
G5  29 50     25 22  33.33E-3
G6  25 99     99 22  33.33E-3
G7  50 25     22 50  33.33E-3
V4  26 25     -0.2
V5  25 27     -0.2
D5  22 26     DX
D6  27 22     DX
D7  99 28     DX
D8  99 29     DX
D9  50 28     DY
D10 50 29     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=181.8)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS AD829