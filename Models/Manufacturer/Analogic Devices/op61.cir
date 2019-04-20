* OP-61 SPICE Macro-model                  12/90, Rev. B
*                                          ARG / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 2E-7 to 1E-7
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
.SUBCKT OP-61  1 2 99 50 38
*
* INPUT STAGE & POLE AT 300 MHZ
*
R1   2  3     5E11
R2   1  3     5E11
R3   5 99     51.6
R4   6 99     51.6 
CIN  1  2     5E-12
C2   5  6     5.141E-12
I1   4  50    1E-3
IOS  1  2     1E-7
EOS  9  1     POLY(1)  26 32  400E-6  1
Q1   5  2  4  QX
Q2   6  9  4  QX
*
* FIRST GAIN STAGE
*
R7  11 99     1E6
R8  11 50     1E6
D11 11 10     DX
D12 12 11     DX
G1  99 11     5 6 2E-4
G2  11 50     6 5 2E-4
E1  99 10     POLY(1)  99  32  -4.4  1
E2  12 50     POLY(1)  32  50  -4.4  1
*
* SECOND GAIN STAGE & POLE AT 2.5 KHZ
*
R9  13 99     5.1598E6
R10 13 50     5.1598E6
C3  13 99     12.338E-12
C4  13 50     12.338E-12
G3  99 13     POLY(1)  11 32  4.24E-3  9.69E-5
G4  13 50     POLY(1)  32 11  4.24E-3  9.69E-5
V2  99 14     2.3
V3  15 50     2.3
D1  13 14     DX
D2  15 13     DX
*
* POLE-ZERO PAIR AT 4 MHZ / 8 MHZ
*
R11 16 99     1E6
R12 16 50     1E6
R13 16 17     1E6
R14 16 18     1E6
C5  17 99     19.89E-15
C6  18 50     19.89E-15
G5  99 16     13 32  1E-6
G6  16 50     32 13  1E-6
*
* ZERO-POLE PAIR AT 85 MHZ / 300 MHZ
*
R17 19 20     1E6
R18 19 21     1E6
R19 20 99     2.529E6
R20 21 50     2.529E6
L3  20 99     1.342E-3
L4  21 50     1.342E-3
G7  99 19     16 32  1E-6
G8  19 50     32 16  1E-6
*
* POLE AT 40 MHZ
*
R21 22 99     1E6
R22 22 50     1E6
C7  22 99     3.979E-15
C8  22 50     3.979E-15
G9  99 22     19 32  1E-6
G10 22 50     32 19  1E-6
*
* POLE AT 200 MHZ
*
R23 23 99     1E6
R24 23 50     1E6
C9  23 99     .796E-15
C10 23 50     .796E-15
G11 99 23     22 32  1E-6
G12 23 50     32 22  1E-6
*
* POLE AT 200 MHZ
*
R25 24 99     1E6
R26 24 50     1E6
C11 24 99     .796E-15
C12 24 50     .796E-15
G13 99 24     23 32  1E-6
G14 24 50     32 23  1E-6
*
* POLE AT 200 MHZ
*
R27 25 99     1E6
R28 25 50     1E6
C13 25 99     .796E-15
C14 25 50     .796E-15
G15 99 25     24 32  1E-6
G16 25 99     32 24  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 40 KHZ
*
R29 26 27     1E6
R30 26 28     1E6
L5  27 99     3.979
L6  28 50     3.979
G17 99 26     3 32  1E-11
G18 26 50     32 3  1E-11
*
* POLE AT 300 MHZ
*
R32 31 99     1E6
R33 31 50     1E6
C15 31 99     .531E-15
C16 31 50     .531E-15 
G19 99 31     25 32  1E-6
G20 31 50     32 25  1E-6
*
* OUTPUT STAGE
*
R34 32 99     20.0E3
R35 32 50     20.0E3
R36 33 99     30
R37 33 50     30
L7  33 38     1.65E-7
G21 36 50     31 33  33.3333333E-3
G22 37 50     33 31  33.3333333E-3
G23 33 99     99 31  33.3333333E-3
G24 50 33     31 50  33.3333333E-3
V6  34 33     .2
V7  33 35     .2
D5  31 34     DX
D6  35 31     DX
D7  99 36     DX
D8  99 37     DX
D9  50 36     DY
D10 50 37     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=1250)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-61
