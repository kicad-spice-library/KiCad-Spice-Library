* OP-490 SPICE Macro-model			    12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 0.4E-9 to 0.2E-9
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
.SUBCKT OP-490   1 2 99 50 31
*
* INPUT STAGE & POLE AT 10 KHZ
*
R1    2  3     5E11
R2    1  3     5E11
R3    5 51     61.6E3
R4    6 51     61.6E3
CIN   1  2     4E-12
C2    5  6     129.2E-12
I1    97 4     1UA
IOS   1  2     0.2E-9
EOS   9  1     POLY(1)  23 27  2E-4  1
Q1    5  2  7  QX
Q2    6  9  8  QX
R5    7  4     10E3
R6    8  4     10E3
*
EREF  98 0    27  0  1
EPLUS 97 0    99  0  1
ENEG  51 0    50  0  1 
*
* FIRST GAIN STAGE
*
R7   10 98     1E6
G1   98 10     5  6  42.23E-6
D1   10 11     DX
D2   12 10     DX
E1   97 11     POLY(1) 97 27 -1.4 1
E2   12 51     POLY(1) 27 51 -1.4 1
*
* GAIN STAGE & DOMINANT POLE AT 0.035 HZ
*
R8   13 98     54.57E9
C3   13 98     83.333E-12
G2   98 13     10 27  0.5E-6
V1   97 14     -2.9
V2   15 51     -2.9
D3   13 14     DX
D4   15 13     DX
*
* ZERO-IN ZERO-OUT CLAMP
*
D5   16 13     DX
H1   16 51     POLY(1) VS1 1.05 -119E6
F1   51 17     VS2 1
D6   17 18     DX
VS1  18 51     DC 0
D7   51 17     DX
*
* NEGATIVE ZERO AT -100 KHZ
*
R9   19 20     1E6
C4   19 20     -1.59E-12
R10  20 98     1
E3   19 98     13 27  1E6
*
* ZERO - POLE PAIR AT 28 KHZ / 100 KHZ
*
R11  21 22     1E6
L1   22 98     4.09
R12  22 98     2.57E6
G3   98 21     20 27  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 4 HZ
*
R13  23 24     1E6
L2   24 98     39.79E3
G4   98 23     3  27  3.16E-13
D8   23 97     DX
D9   51 23     DX
*
* ZERO - POLE PAIR AT 40 KHZ / 160 KHZ
*
R14  25 26     1E6
L3   26 98     2.98
R15  26 98     3E6
G5   98 25     21 27  1E-6
*
* OUTPUT STAGE
*
ISY  99 50     9.444E-6
R16  27 99     2.7E6
R17  27 50     2.7E6
R18  30 99     6000
R19  30 50     6000
VS2  30 31     DC 0
G6   28 50     25 30  166.7E-6
G7   29 50     30 25  166.7E-6
G8   30 99     99 25  166.7E-6
G9   50 30     25 50  166.7E-6
D10  99 28     DX
D11  99 29     DX
D12  50 28     DY
D13  50 29     DY
*
* MODELS USED
*
.MODEL QX PNP(BF=119)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-490
