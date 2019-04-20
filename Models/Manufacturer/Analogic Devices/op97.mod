* OP-97 SPICE Macro-model                   12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 30E-12 to 15E-12
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
.SUBCKT OP-97  1 2 99 50 38
*
* INPUT STAGE & POLE AT 15 MHZ
*
R1   2  3     5E11
R2   1  3     5E11
R3   5 99     612
R4   6 99     612 
CIN  1  2     4E-12
C2   5  6     8.67E-12
I1   4  50    0.1E-3
IOS  1  2     15E-12
EOS  9  1     POLY(1)  26 32  10E-6  1
Q1   5  2 10  QX
Q2   6  9 11  QX
R5   10 4     96
R6   11 4     96
D12  2  9     DX
D13  9  2     DX
*
* GAIN STAGE & DOMINANT POLE AT 0.26 HZ
*
R9  13 99     1.22E9
R10 13 50     1.22E9
C3  13 99     500E-12
C4  13 50     500E-12
G3  99 13     5  6  1.634E-3
G4  13 50     6  5  1.634E-3
V2  99 14     1.3
V3  15 50     1.3
D1  13 14     DX
D2  15 13     DX
GS  99 50     POLY(1)  99 50  0.28E-3  -3.7E-6
*
* ZERO-POLE PAIR AT 150 KHZ / 285 KHZ
*
R17 19 20     1E6
R18 19 21     1E6
R19 20 99     0.9E6
R20 21 50     0.9E6
L3  20 99     0.503
L4  21 50     0.503
G7  99 19     13 32  1E-6
G8  19 50     32 13  1E-6
*
* POLE AT 4.8 MHZ
*
R21 22 99     1E6
R22 22 50     1E6
C7  22 99     33.2E-15
C8  22 50     33.2E-15
G9  99 22     19 32  1E-6
G10 22 50     32 19  1E-6
*
* POLE AT 8 MHZ
*
R23 23 99     1E6
R24 23 50     1E6
C9  23 99     19.9E-15
C10 23 50     19.9E-15
G11 99 23     22 32  1E-6
G12 23 50     32 22  1E-6
*
* POLE AT 10 MHZ
*
R25 24 99     1E6
R26 24 50     1E6
C11 24 99     15.9E-15
C12 24 50     15.9E-15
G13 99 24     23 32  1E-6
G14 24 50     32 23  1E-6
*
* POLE AT 15 MHZ
*
R27 25 99     1E6
R28 25 50     1E6
C13 25 99     10.6E-15
C14 25 50     10.6E-15
G15 99 25     24 32  1E-6
G16 25 99     32 24  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 50 KHZ
*
R29 26 27     1E6
R30 26 28     1E6
L5  27 99     3.183E3
L6  28 50     3.183E3
RS1 27 99     16E9
RS2 28 50     16E9
G17 99 26     3 32  2.51E-13
G18 26 50     32 3  2.51E-13
D3  26 99     DX
D4  50 26     DX
*
* POLE AT 12 MHZ
*
R32 31 99     1E6
R33 31 50     1E6
C15 31 99     13.2E-15
C16 31 50     13.2E-15 
G19 99 31     25 32  1E-6
G20 31 50     32 25  1E-6
*
* OUTPUT STAGE
*
R34 32 99     1E6
R35 32 50     1E6
R36 33 99     600
R37 33 50     600
L7  33 38     2.65E-7
G21 36 50     31 33  1.6667E-3
G22 37 50     33 31  1.6667E-3
G23 33 99     99 31  1.6667E-3
G24 50 33     31 50  1.6667E-3
V6  34 33     3.6
V7  33 35     3.0
D5  31 34     DX
D6  35 31     DX
D7  99 36     DX
D8  99 37     DX
D9  50 36     DY
D10 50 37     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=1.67E6)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-97