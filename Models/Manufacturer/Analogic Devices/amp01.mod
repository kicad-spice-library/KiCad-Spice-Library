* AMP-01 SPICE Macro-model                 2/90, Rev. A
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
*              rg(pin1)
*              |   rg(pin2)
*              |   |   inverting input
*              |   |   | sense
*              |   |   | |   reference
*              |   |   | |   |   output
*              |   |   | |   |   |                              
.SUBCKT AMP-01 207 206 2 210 209 32 211 50 99 212 214 216 3
*                                   |   |  |  |   |   |   |
*        output stage negative supply   |  |  |   |   |   |
*                 device negative supply   |  |   |   |   |
*                     device positive supply  |   |   |   |
*                  output stage positive supply   |   |   |
*                                                rs   |   |
*                                                    rs   |
*                                       non-inverting input
*input protection network
*
R201 3 204 250
R202 2 205 250
D202 206 204 DX
D203 207 205 DX
*
*input stage and resistive load
*
Q201 6 204 206 NX
Q202 5 205 207 NX
R3 99 6 30K
R4 99 5 30K
*
*common mode rejection term
*
R207 99 207 8G
R208 50 207 8G
*
*input offset current and input offset voltage
*
I202 99 204 150N
I203 3 50 149.5N
*
*output offset voltage
*
I201 99 201 40N
*
*feedback V-I converter
*
C2 201 202 120P
*c2 provides the second pole before the
*input stage to prevent spurious slew limiting
R203 209 201 47.5K
R204 201 203 2.5K
R205 202 203 2.5K
R206 210 202 47.5K
V203 203 50 0.57
E201 213 50 201 214 100K
Q203 206 213 214 NX
I204 214 50 100U
E202 215 50 202 216 100K
Q204 207 215 216 NX
I205 216 50 100U
D204 208 207 DX
D205 208 206 DX
V201 208 50 4
*
* output amplifier
*
R5 9 99 400MEG
R6 9 50 400MEG
C3 9 99 55P
C4 9 50 55P
G1 99 9 POLY(1) 5 6 1.7M 100u
G2 9 50 POLY(1) 6 5 1.7M 100u
V2 99 8 2.5
V3 10 50 2.5
D1 9 8 DX
D2 10 9 DX
D5 9 28 DX
D6 29 9 DX
R26 26 212 111E3
R27 26 211 111E3
R28 32 212 90
R29 32 211 90
G17 30 211 9 32 11.111E-3
G18 31 211 32 9 11.111E-3
G19 32 212 212 9 11.111E-3
G20 211 32 9 211 11.111E-3
V6 28 32 3
V7 32 29 3
D7 212 30 DX
D8 212 31 DX
D9 211 30 DY
D10 211 31 DY
I1 212 211 600U
*
* non-linear models
*
.MODEL DX D (IS=1E-15)
.MODEL DY D (IS=1E-15 BV=50)
.MODEL NX NPN (IS=1E-14 BF=1E5 RE=50)
.ENDS AMP-01