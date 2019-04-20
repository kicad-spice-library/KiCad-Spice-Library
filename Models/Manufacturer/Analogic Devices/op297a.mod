* OP-297A SPICE Macro-model                 12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV B.
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 100E-12 to 50E-12
*
*
* This version of the OP-297 model simulates the worst case 
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
.SUBCKT OP-297A  1 2 99 50 30
*
* INPUT STAGE & POLE AT 6 MHZ
*
RIN1 1  7     2500
RIN2 2  8     2500
R1   8  3     5E11
R2   7  3     5E11
R3   5 99     612
R4   6 99     612 
CIN  7  8     3E-12
C2   5  6     21.67E-12
I1   4  50    0.1E-3
IOS  7  8     50E-12
EOS  9  7     POLY(1)  19 23  50E-6  1
Q1   5  8 10  QX
Q2   6  9 11  QX
R5   10 4     96
R6   11 4     96
D1   8  9     DX
D2   9  8     DX
*
EREF 98 0     23  0  1
*
* FIRST GAIN STAGE
*
RG1  40 98     1E6
GG1  98 40     5  6  196.7E-6
DG3  40 41     DX
DG4  42 40     DX
EG1  99 41     POLY(1)  99  23  -2.1  1
EG2  42 50     POLY(1)  99  23  -2.1  1
*
* GAIN STAGE & DOMINANT POLE AT 0.26 HZ
*
R7  12 98     1.22E9
C3  12 98     500E-12
G1  98 12     40  23  8.333E-6
V2  99 13     2.0
V3  14 50     2.0
D3  12 13     DX
D4  14 12     DX
*
* NEGATIVE ZERO AT -1.8 MHZ
*
R8  15 16     1E6
C4  15 16     -88.4E-15
R9  16 98     1
E1  15 98     12 23  1E6
*
* POLE AT 1.8 MHZ
*
R10 17 98     1E6
C5  17 98     88.4E-15
G2  98 17     16 23  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 500 HZ
*
R11 18 19     1E6
C6  18 19     0.3183E-9
R12 19 98     1
E2  18 98     3  23  1
*
* POLE AT 6 MHZ
*
R15 22 98     1E6
C8  22 98     26.53E-15
G3  98 22     17 23  1E-6
*
* OUTPUT STAGE
*
R16 23 99     160k
R17 23 50     160k
ISY 99 50     431E-6
R18 25 99     200
R19 25 50     200
L1  25 30     1E-7
G4  28 50     22 25  5E-3
G5  29 50     25 22  5E-3
G6  25 99     99 22  5E-3
G7  50 25     22 50  5E-3
V4  26 25     1.8
V5  25 27     1.3
D5  22 26     DX
D6  27 22     DX
D7  99 28     DX
D8  99 29     DX
D9  50 28     DY
D10 50 29     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=500E3)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-297A