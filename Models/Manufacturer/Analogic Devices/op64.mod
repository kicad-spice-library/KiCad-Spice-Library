* OP-64 SPICE Macro-model                  12/90, Rev. C  
*                                          JCB / PMI
*
* Revision History:
*   REV. C
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 1E-7 to 0.5E-7
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
*              non-inverting input
*              | inverting input
*              | | positive supply
*              | | |  negative supply
*              | | |  |  output
*              | | |  |  |
.SUBCKT OP-64  1 2 99 50 38
*
* INPUT STAGE & POLE AT 39.8 MHZ
*
R1   2  3     5E11
R2   1  3     5E11
R3   5 99     474.86
R4   6 99     474.86
R5   4  7     423.26
R6   4  8     423.26
CIN  1  2     1E-15
C2   5  6     4.2106E-12
I1   4  50    1E-3
IOS  1  2     0.5E-7
EOS  9  1     POLY(1)  26 32  4E-4  1
Q1   5  2  7  QX
Q2   6  9  8  QX
*
* SECOND STAGE & POLE AT 3.8 KHZ
*
R7  11 99     7.1229E6
R8  11 50     7.1229E6
C3  11 99     5.88E-12
C4  11 50     5.88E-12
G1  99 11     POLY(1)  5  6  4.31E-3  2.1059E-3
G2  11 50     POLY(1)  6  5  4.31E-3  2.1059E-3
V2  99 10     2.25
V3  12 50     2.25
D1  11 10     DX
D2  12 11     DX
*
* POLE AT 39.8 MHZ
*
R9  13 99     1E6
R10 13 50     1E6
C5  13 99     4E-15
C6  13 50     4E-15
G3  99 13     11 32  1E-6
G4  13 50     32 11  1E-6
*
* ZERO-POLE PAIR AT 26.5 MHZ / 159 MHZ
*
R13 16 17     1E6
R14 16 18     1E6
R15 17 99     5E6
R16 18 50     5E6
L1  17 99     5.005E-3
L2  18 50     5.005E-3
G5  99 16     13 32  1E-6
G6  16 50     32 13  1E-6
*
* ZERO-POLE PAIR AT 31.8 MHZ / 39.8 MHZ
*
R17 19 20     1E6
R18 19 21     1E6
R19 20 99     2.5157E5
R20 21 50     2.5157E5
L3  20 99     1.006E-3
L4  21 50     1.006E-3
G7  99 19     16 32  1E-6
G8  19 50     32 16  1E-6
*
* POLE AT 100 MHZ
*
R21 22 99     1E6
R22 22 50     1E6
C7  22 99     1.59E-15
C8  22 50     1.59E-15
G9  99 22     19 32  1E-6
G10 22 50     32 19  1E-6
*
* POLE AT 159 MHZ
*
R23 23 99     1E6
R24 23 50     1E6
C9  23 99     1E-15
C10 23 50     1E-15
G11 99 23     22 32  1E-6
G12 23 50     32 22  1E-6
*
* POLE AT 159 MHZ
*
R25 24 99     1E6
R26 24 50     1E6
C11 24 99     1E-15
C12 24 50     1E-15
G13 99 24     23 32  1E-6
G14 24 50     32 23  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 20 KHZ
*
R29 26 27     1E6
R30 26 28     1E6
L5  27 99     7.9575
L6  28 50     7.9575
G17 99 26     3 32  1E-11
G18 26 50     32 3  1E-11
*
* POLE AT 159 MHZ
*
R32 31 99     1E6
R33 31 50     1E6
C15 31 99     1E-15
C16 31 50     1E-15
G19 99 31     24 32  1E-6
G20 31 50     32 24  1E-6
*
* OUTPUT STAGE
*
R34 32 99     20.0E3
R35 32 50     20.0E3
R36 33 99     60
R37 33 50     60
L7  33 38     2.9E-7
G21 36 50     31 33  16.6666667E-3
G22 37 50     33 31  16.6666667E-3
G23 33 99     99 31  16.6666667E-3
G24 50 33     31 50  16.6666667E-3
V6  34 33     1.7
V7  33 35     1.7
D5  31 34     DX
D6  35 31     DX
D7  99 36     DX
D8  99 37     DX
D9  50 36     DY
D10 50 37     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=5000)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-64
