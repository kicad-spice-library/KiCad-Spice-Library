* OP-177A SPICE Macro-model                 12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 1E-9 to 0.5E-9
*     Added F1 and F2 to fix short circuit current limit.
*
*
* This version of the OP-177 model simulates the worst case 
* parameters of the 'A' grade.  The worst case parameters
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
.SUBCKT OP-177A  1 2 99 50 39
*
* INPUT STAGE & POLE AT 6 MHZ
*
R1   2   3    5E11
R2   1   3    5E11
R3   5  97    0.0606
R4   6  97    0.0606
CIN  1   2    4E-12
C2   5   6    218.9E-9
I1   4  51    1
IOS  1   2    0.5E-9
EOS  9  10    POLY(1)  30 33  10E-6  1
Q1   5  2  7  QX
Q2   6  9  8  QX
R5   7   4    0.009
R6   8   4    0.009
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
DN5  17  18   DIN
DN6  18  19   DIN
VN5  17   0   DC 2
VN6  0   19   DC 2
*
* FIRST GAIN STAGE
*
R7   20 98     1
G1   98 20     5  6  119.8
D3   20 21     DX
D4   22 20     DX
E1   97 21     POLY(1) 97 33 -2.4 1
E2   22 51     POLY(1) 33 51 -2.4 1
*
* GAIN STAGE & DOMINANT POLE AT 0.127 HZ
*
R8   23 98     1.253E9
C3   23 98     1E-9
G2   98 23     20 33  33.3E-6
V1   97 24     1.8
V2   25 51     1.8
D5   23 24     DX
D6   25 23     DX
*
* NEGATIVE ZERO AT -4MHZ
*
R9   26 27     1
C4   26 27     -39.75E-9
R10  27 98     1E-6
E3   26 98     23 33  1E6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 63 HZ
*
R13  30 31     1
L2   31 98     2.52E-3
G4   98 30     3  33  0.316E-6
D7   30 97     DX
D8   51 30     DX
*
* POLE AT 2 MHZ
*
R14  32 98     1
C5   32 98     79.5E-9
G5   98 32     27 33  1
*
* OUTPUT STAGE
*
R15  33 97     1
R16  33 51     1
GSY  99 50     POLY(1) 99 50 0.725E-3 0.0425E-3
F1   34  0     V3  1
F2   0  34     V4  1
R17  34 99     400
R18  34 50     400
L3   34 39     2E-7
G6   37 50     32 34  2.5E-3
G7   38 50     34 32  2.5E-3
G8   34 99     99 32  2.5E-3
G9   50 34     32 50  2.5E-3
V3   35 34     6.8
V4   34 36     4.4
D9   32 35     DX
D10  36 32     DX
D11  99 37     DX
D12  99 38     DX
D13  50 37     DY
D14  50 38     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=333.3E6)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.MODEL DEN  D(IS=1E-12, RS=14.61K, KF=2E-17, AF=1)
.MODEL DIN  D(IS=1E-12, RS=7.55E-6, KF=3E-15, AF=1)
.ENDS OP-177A
