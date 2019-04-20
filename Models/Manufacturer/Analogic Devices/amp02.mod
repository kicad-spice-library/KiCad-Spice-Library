* AMP-02 SPICE Macro-model                 2/90, Rev. A
*                                          DFB / PMI
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
*
*              rg1
*              |   inverting input
*              |   |   non-inverting input
*              |   |   |   negative supply
*              |   |   |   |  reference (ground usually)
*              |   |   |   |  |   output
*              |   |   |   |  |   |  positive supply
*              |   |   |   |  |   |  |  rg2                         
*              |   |   |   |  |   |  |  |
.SUBCKT AMP-02 207 202 203 50 205 32 99 208
*
*input protection network
*
J201 215 217 202 JX 40
J202 217 217 215 JX 40
J203 218 218 216 JX 40
J204 216 218 203 JX 40 
D201 215 220 DX
D202 219 215 DX
D203 219 216 DX
D204 216 220 DX
V202 219 50 3.6
V203 99 220 3.6
*
*input offset voltage
*
IVOS 215 50 100N 
*(this saves a node by using the protection FET's
*as offset voltage generators)
*
*input currents
*
IB1 99 202 97N 
*(the latter term is mostly compensation for IVOS)
IB2 203 50 1.8N
*
*input stage
*
Q201 210 213 207 50 NX
Q202 211 214 208 50 NX
E203 213 0 215 207 10K
E204 214 0 216 208 10K
I201 207 50 50U
I202 208 50 50.04U 
*(the 0.04U models the output offset voltage
*and saves yet another node)
*
*differential gain stage and pole
*
R201 251 207 25K
R202 250 208 25K
R203 99 210 20K
R204 99 211 20K
V201 99 212 1
RV201 99 212 1MEG
E201 251 32 212 210 1MEG
E202 250 32 212 211 1MEG
C210 251 210 8P
C211 250 211 8P
*
*output resistor network
*
R208 32 2 25.002K
*(R208 is  imbalanced to model CMRR)
R207 2 221 24K
R210 251 221 1K
R205 222 3 24K
R211 250 222 1K
R206 3 205 25K
V204 99 223 3
V205 224 50 3
D205 221 223 DX
D206 222 223 DX
D207 224 221 DX
D208 224 222 DX
*
* output amplifier
*
R3 5 50 1K
R4 6 50 1K
I1 99 4 200u
J1 5 2 4 JX
J2 6 3 4 JX
C2 5 6 30P
*
R5 9 99 180MEG
R6 9 50 180MEG
C3 9 99 40P
C4 9 50 40P
G1 99 9 POLY(1) 5 6 4.5M 1.4M
G2 9 50 POLY(1) 6 5 4.5M 1.4M
V2 99 8 2.5
V3 10 50 2.5
D1 9 8 DX
D2 10 9 DX
*
D5 9 28 DX
D6 29 9 DX
*
R26 26 99 111E3
R27 26 50 111E3
R28 27 99 300
R29 27 50 300
L3 27 32 1.1U
G17 30 50 9 27 3.333E-3
G18 31 50 27 9 3.333E-3
G19 27 99 99 9 3.333E-3
G20 50 27 9 50 3.333E-3
V6 28 27 2.6
V7 27 29 2.6
D7 99 30 DX
D8 99 31 DX
D9 50 30 DY
D10 50 31 DY
*
* non-linear models
*
.MODEL JX PJF (BETA=20E-6 VTO=-2.0 IS=1E-16)
.MODEL DX D (IS=1E-15)
.MODEL DY D (IS=1E-15 BV=50)
.MODEL NX NPN (IS=1E-16 BF=10000 RE=50)
.ENDS AMP-02
