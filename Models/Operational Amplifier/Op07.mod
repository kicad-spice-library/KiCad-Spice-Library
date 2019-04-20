* 
* Linear Technology OP07 op amp model
* Written: 08-24-1989 12:35:59 Type: Bipolar npn input, internal comp.
* Typical specs: 
* Vos=3.0E-05, Ib=1.0E-09, Ios=4.0E-10, GBP=6.0E+05Hz, Phase mar.= 70 deg, 
* SR(+)=2.5E-01V/us, SR(-)=2.4E-01V/us, Av= 114 dB, CMMR= 126 dB, 
* Vsat(+)=2.00V, Vsat(-)=2.00V, Isc=+/-25.0mA, Iq=2500uA
* (input differential mode clamp active)
* 
* Connections: + - V+V-O 
.subckt OP07 3 2 7 4 6
* input
rc1 7  80 8.842E+03
rc2 7  90 8.842E+03
q1  80 102 10 qm1 
q2  90 103 11 qm2 
rb1  2   102 5.000E+02
rb2  3   103 5.000E+02
ddm1 102 104 dm2 
ddm3 104 103 dm2 
ddm2 103 105 dm2 
ddm4 105 102 dm2 
c1  80 90 5.460E-12
re1 10 12 1.948E+03
re2 11 12 1.948E+03
iee 12 4  7.502E-06
re  12 0  2.666E+07
ce  12 0  1.579E-12
* intermediate 
gcm 0  8  12 0  5.668E-11
ga  8  0  80 90 1.131E-04
r2  8  0  1.000E+05
c2  1  8  3.000E-11
gb  1  0  8  0  1.294E+03
* output 
ro1 1  6  2.575E+01
ro2 1  0  3.425E+01
rc  17 0  6.634E-06
gc  0  17 6  0  1.507E+05
d1  1  17 dm1 
d2  17 1  dm1 
d3  6  13 dm2 
d4  14 6  dm2 
vc  7  13 2.803E+00
ve  14 4  2.803E+00
ip  7  4  2.492E-03
dsub 4  7  dm2 
* models 
.model qm1 npn (is=8.000E-16 bf=3.125E+03)
.model qm2 npn (is=8.009E-16 bf=4.688E+03)
.model dm1 d   (is=1.486E-08)
.model dm2 d   (is=8.000E-16)
.ends OP07
* 
* - - - - - * fini OP07 * - - - - - * [oamm vn1 8/89]
**
*         (C) COPYRIGHT LINEAR TECHNOLOGY CORPORATION 1990
*                       All rights reserved.
* 
*   Linear Technology Corporation hereby grants the users of this
* macromodel a non-exclusive, nontransferrable license to use this
*            macromodel under the following conditions:
* 
* The user agrees that this macromodel is licensed from Linear
* Technology and agrees that the macromodel may be used, loaned,
* given away or included in other model libraries as long as this
* notice and the model in its entirety and unchanged is included.
* No right to make derivative works or modifications to the
* macromodel is granted hereby.  All such rights are reserved.
* 
* This model is provided as is.  Linear Technology makes no
* warranty, either expressed or implied about the suitability or
* fitness of this model for any particular purpose.  In no event
* will Linear Technology be liable for special, collateral,
* incidental or consequential damages in connection with or arising
* out of the use of this macromodel.  It should be remembered that
* models are a simplification of the actual circuit.
* 
* Linear Technology reserves the right to change these macromodels
* without prior notice.  Contact Linear Technology at 1630 McCarthy
* Blvd., Milpitas, CA, 95035-7487 or telephone 408/432-1900 for
* datasheets on the actual amplifiers or the latest macromodels.
* 
* ----------------------------------------------------------------------- *
