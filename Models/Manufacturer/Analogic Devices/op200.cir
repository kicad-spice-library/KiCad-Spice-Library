* OP-200 SPICE Macro-model                 12/90, Rev. B   
*                                          AAG / PMI
* Revision History:
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 50E-12 to 25E-12
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
* Node assignments
*              non-inverting input
*              | inverting input
*              | | positive supply
*              | | |  negative supply
*              | | |  |  output
*              | | |  |  |
.SUBCKT OP-200 1 2 99 50 25
*
* INPUT STAGE & POLE AT 4.5 MHZ
*
RI1 2  31     1E3
RI2 1  32     1E3
R1  31  3     5E5
R2  32  3     5E5
R3  5  99     516
R4  6  99     516
CIN 32 31     3.2E-12
C2  5   6     34.271E-12
I1  4  50     0.1E-3
IOS 32 31     25E-12
EOS 7  32     POLY(1)  13 19  25E-6  1
Q1  5  31  4  QX
Q2  6   7  4  QX
D21 31  7     DX
D22 7  31     DX
*
* FIRST GAIN STAGE & DOMINANT POLE AT 0.125 HZ
*
R5  8  99     1.9098E9
R6  8  50     1.9098E9
C3  8  99     666.67E-12
C4  8  50     666.67E-12
G1  99  8     POLY(1)  5  6  200E-6  1.938E-3
G2  8  50     POLY(1)  6  5  200E-6  1.938E-3
D1  8  99     DX
D2  50  8     DX
*
* SECOND GAIN STAGE & POLE AT 4.5 MHZ
*
R7  10 99     1E6
R8  10 50     1E6
C5  10 99     35.368E-15
C6  10 50     35.368E-15
G3  99 10     8  19  1.3509E-6
G4  10 50     19  8  1.3509E-6
V2  99  9     2.7
V3  11 50     2.7
D3  10  9     DX
D4  11 10     DX
*
* POLE AT 4.5 MHZ
*
R9  12 99     1E6
R10 12 50     1E6
C7  12 99     35.368E-15
C8  12 50     35.368E-15
G5  99 12     10 19  1E-6
G6  12 50     19 10  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 20 HZ
*
R11 13 14     1E6
R12 13 15     1E6
L1  14 99     7.9578E3
L2  15 50     7.9578E3
G7  99 13     3  19  1.778E-13
G8  13 50     19  3  1.778E-13
D5  13 99     DX
D6  50 13     DX
*
* POLE AT 4.5 MHZ
*
R14 18 99     1E6
R15 18 50     1E6
C9  18 99     35.368E-15
C10 18 50     35.368E-15
G9  99 18     12 19  1E-6
G10 18 50     19 12  1E-6
*
* OUTPUT STAGE
*
R16 19 99     62.22E3
R17 19 50     62.22E3
R18 24 99     250
R19 24 50     250
L3  24 25     7E-7
G11 22 50     18 24  4E-3
G12 23 50     24 18  4E-3
G13 24 99     99 18  4E-3
G14 50 24     18 50  4E-3
V6  20 24     3
V7  24 21     3
D7  18 20     DX
D8  21 18     DX
D9  99 22     DX
D10 99 23     DX
D11 50 22     DY
D12 50 23     DY
*
* MODELS USED
*
.MODEL QX NPN(BF=500000)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-200
