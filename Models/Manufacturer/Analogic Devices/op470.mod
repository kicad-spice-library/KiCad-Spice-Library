* OP-470 SPICE Macro-model                 12/90, Rev. B
*                                          JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 3E-9 to 1.5E-9
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
.SUBCKT OP-470   1 2 99 50 35
*
* INPUT STAGE & POLE AT 60 MHZ
*
R1  2   3     2E5
R2  1   3     2E5
R3  7  99     57.875
R4  8  99     57.875
CIN 1   2     2E-12
C2  7   8     22.92E-12
I1  11 50     1E-3
IOS 1   2     1.5E-9
EOS 6   1     POLY(1)  25 29  1E-4  1
Q1  7   2  9  QX
Q2  8   6 10  QX
R5  9  11     6.275
R6  10 11     6.275
D1  2   4     DX
V1  4   6     0.7
V2  6   5     0.7
D2  5   2     DX
*
* FIRST GAIN STAGE & DOMINANT POLE AT 5.5 HZ
*
R7  12 99     57.875E6
R8  12 50     57.875E6
C3  12 99     500E-12
C4  12 50     500E-12
G1  99 12     POLY(1)  7  8  380E-6  17.279E-3
G2  12 50     POLY(1)  8  7  380E-6  17.279E-3
V3  99 13     1.9
V4  14 50     1.9
D3  12 13     DX
D4  14 12     DX
*
* POLE-ZERO AT 2MHZ / 6 MHZ
*
R9  15 99     1E6
R10 15 50     1E6
R11 15 16     5E5
R12 15 17     5E5
C5  16 99     53.05E-15
C6  17 50     53.05E-15
G3  99 15     12 29  1E-6
G4  15 50     29 12  1E-6
*
* ZERO-POLE AT 5MHZ / 60 MHZ
*
R13 99 19     11E6
R14 18 19     1E6
R15 18 20     1E6
R16 20 50     11E6
L1  99 19     29.18E-3
L2  50 20     29.18E-3
G5  99 18     15 29  1E-6
G6  18 50     29 15  1E-6
*
* POLE AT 30 MHZ
*
R17 21 99     1E6
R18 21 50     1E6
C7  21 99     5.305E-15
C8  21 50     5.305E-15
G7  99 21     18 29  1E-6
G8  21 50     29 18  1E-6
*
* POLE AT 50 MHZ
*
R19 22 99     1E6
R20 22 50     1E6
C9  22 99     3.18E-15
C10 22 50     3.18E-15
G9  99 22     21 29  1E-6
G10 22 50     29 21  1E-6
*
* POLE AT 50 MHZ
*
R21 23 99     1E6
R22 23 50     1E6
C11 23 99     3.18E-15
C12 23 50     3.18E-15
G11 99 23     22 29  1E-6
G12 23 50     29 22  1E-6
*
* POLE AT 50 MHZ
*
R23 24 99     1E6
R24 24 50     1E6
C13 24 99     3.18E-15
C14 24 50     3.18E-15
G13 99 24     23 29  1E-6
G14 24 50     29 23  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 100 HZ
*
R25 25 26     1E6
R26 25 27     1E6
L3  26 99     1.592E3
L4  27 50     1.592E3
G15 99 25     3  29  1E-12
G16 25 50     29  3  1E-12
D5  25 99     DX
D6  50 25     DX
*
* POLE AT 50 MHZ
*
R27 28 99     1E6
R28 28 50     1E6
C15 28 99     3.18E-15
C16 28 50     3.18E-15
G17 99 28     24 29  1E-6
G18 28 50     29 24  1E-6
*
* OUTPUT STAGE
*
R29 29 99     20E3
R30 29 50     20E3
R31 34 99     250
R32 34 50     250
L5  34 35     7E-7
G19 32 50     28 34  4E-3
G20 33 50     34 28  4E-3
G21 34 99     99 28  4E-3
G22 50 34     28 50  4E-3
V5  30 34     1.3
V6  34 31     1.3
D7  28 30     DX
D8  31 28     DX
D9  99 32     DX
D10 99 33     DX
D11 50 32     DY
D12 50 33     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=166667)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-470