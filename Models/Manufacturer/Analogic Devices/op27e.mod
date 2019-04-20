* OP-27E SPICE Macro-model                  12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 35E-9 to 17.5E-9
*     Added F1 and F2 to fix short circuit current limit.
*
*
* This version of the OP-27 model simulates the worst case 
* parameters of the 'E' grade.  The worst case parameters
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
*              non-inverting input
*              | inverting input
*              | | positive supply
*              | | |  negative supply
*              | | |  |  output
*              | | |  |  |
.SUBCKT OP-27E 1 2 99 50 39
*
* INPUT STAGE & POLE AT 80 MHZ
*
R3   5  97    0.0619
R4   6  97    0.0619
CIN  1   2    4E-12
C2   5   6    16.07E-9
I1   4  51    1
IOS  1   2    17.5E-9
EOS  9  10    POLY(1)  30 33  25E-6  1
Q1   5  2  7  QX
Q2   6  9  8  QX
R5   7   4    0.0107
R6   8   4    0.0107
D1   2   1    DX
D2   1   2    DX
EN   10  1    12  0  1
GN1  0   2    15  0  1
GN2  0   1    18  0  1
*
EREF  98 0    33  0  1
EPLUS 97 0    99  0  1
ENEG  51 0    50  0  1 
*
* VOLTAGE NOISE SOURCE WITH FLICKER NOISE
*
DN1  11  12   DEN
DN2  12  13   DEN
VN1  11   0   DC 2
VN2  0   13   DC 2
*
* CURRENT NOISE SOURCE WITH FLICKER NOISE
*
DN3  14  15   DIN
DN4  15  16   DIN
VN3  14   0   DC 2
VN4  0   16   DC 2
*
* SECOND CURRENT NOISE SOURCE
*
DN5  17  18    DIN
DN6  18  19    DIN
VN5  17   0    DC 2
VN6  0   19    DC 2
*
* FIRST GAIN STAGE
*
RG1  40 98     1
GG1  98 40     5  6  79.86
DG3  40 41     DX
DG4  42 40     DX
EG1  97 41     POLY(1)  97  33  -2.1  1
EG2  42 51     POLY(1)  97  33  -2.1  1
*
* GAIN STAGE & DOMINANT POLE AT 7.2 HZ
*
R7   20 98     37.58E3
C3   20 98     588E-9
G1   98 20     40  33  0.333
V1   97 21     1.9
V2   22 51     1.9
D5   20 21     DX
D6   22 20     DX
*
* POLE - ZERO AT 2.9MHZ / 6MHZ
*
R8   23 98     1
R9   23 24     0.935
C4   24 98     28.4E-9
G2   98 23     20 33  1
*
* ZERO - POLE AT 6.8MHZ / 40MHZ
*
R10  25 26     1
R11  26 98     4.88
L1   26 98     19.4E-9
G3   98 25     23 33  1
*
* POLE AT 60 MHZ
*
R12  27 98     1
C5   27 98     2.65E-9
G4   98 27     25 33 1
*
* ZERO AT 28 MHZ
*
R13  28 29     1
C6   28 29     -5.68E-9
R14  29 98     1E-6
E1   28 98     27 33  1E6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 11.9 KHZ
*
R15  30 31     1
L2   31 98     13.3E-6
G5   98 30     POLY(2) 1  33  2  33  0  997.6E-9  997.6E-9
D7   30 97     DX
D8   51 30     DX
*
* POLE AT 80 MHZ
*
R16  32 98     1
C7   32 98     1.99E-9
G6   98 32     29 33  1
*
* OUTPUT STAGE
*
R17  33 97     1
R18  33 51     1
GSY  99 50     POLY(1) 99 50 3.47E-3 40E-6
F1   34  0     V3  1
F2   0  34     V4  1
R19  34 99     180
R20  34 50     180
L3   34 39     1E-7
G7   37 50     32 34  5.56E-3
G8   38 50     34 32  5.56E-3
G9   34 99     99 32  5.56E-3
G10  50 34     32 50  5.56E-3
V3   35 34     2.5
V4   34 36     3.1
D9   32 35     DX
D10  36 32     DX
D11  99 37     DX
D12  99 38     DX
D13  50 37     DY
D14  50 38     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=12.5E6)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.MODEL DEN  D(IS=1E-12, RS=1.74K, KF=4.01E-16, AF=1)
.MODEL DIN  D(IS=1E-12, RS=43.5E-6, KF=11.1E-15, AF=1)
.ENDS OP-27E
