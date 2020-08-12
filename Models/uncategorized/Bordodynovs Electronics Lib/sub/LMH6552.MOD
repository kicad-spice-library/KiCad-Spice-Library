* BEGIN MODEL LMH6552
* Rev C, 11/2008 - PG. "Flattened" file.
*//////////////////////////////////////////////////////////////////////
* (C) National Semiconductor, Corporation.
* Models developed and under copyright by:
* National Semiconductor, Corporation.  
*/////////////////////////////////////////////////////////////////////
* Legal Notice:  
* The model may be copied, and distributed without any modifications;
* however, reselling or licensing the material is illegal.
* We reserve the right to make changes to the model without prior notice. 
* Pspice Models are provided "AS IS, WITH NO WARRANTY OF ANY KIND" 
*////////////////////////////////////////////////////////////////////
*
*  Model features include: (typical values)
*     closed loop frequency response vs gain
*     output current and voltage limiting
*     input bias current error (common mode)
*     input bias current error (differential mode)
*     input common mode voltage offset
*     slew rate and step response
*     vnoise, referred to the input
*     inoise, referred to the input
*     output balance error vs frequency
*     common mode frequency response
*     harmonic distortion
*     Isupply temco
*     Isupply dependence on supply voltage 
*
*  This model does not capture the enable/disable function
*
*************************************************************
** Top Level Circuit Description
*************************************************************
** Pin Desciptions
*                Positive Input Terminal
*                |   Negative Input Terminal
*                |   |   Positive Supply Voltage
*                |   |   |   Negative Supply Voltage
*                |   |   |   |   Positive Output Terminal
*                |   |   |   |   |   Negative Output Terminal
*                |   |   |   |   |   |   Output Common Mode Reference Input
*                |   |   |   |   |   |   |   Enable/Disable Control Input
*                |   |   |   |   |   |   |   |
.subckt LMH6552 vip vim vcc vee vop vom vcm ven
*
*
* PINOUT ORDER +IN -IN V+ V- +OUT -OUT VCM EN
*
*
g0 a0107 a076 a0186 vee 10e-3
g1 vcc a0186 vcc vee 42e-6
d6 a0149 a083 DIODEideal 1
d5 a0151 a098 DIODEideal 1
d1 vim a0102 DIODEnoisy 1
d3 a0115 vim DIODEnoisy 1
d0 vip a050 DIODEnoisy 1
d4 a0113 vip DIODEnoisy 1
c4 vip vim 2.4e-12
c0 a0175 0 1e-12
c1 a0191 0 1e-12
q12 a0223 a076 a0189 NPNXTR 1
q2 a076 a076 a0126 NPNXTR 1
q0 a050 a076 a0130 NPNXTR 1
q9 a083 vcm a099 NPNXTR 1
q1 a0102 a076 a0128 NPNXTR 1
q10 a098 a0167 a0223 NPNXTR 1
q11 a099 a076 a0185 NPNXTR 1
q3 a0115 a0107 a085 PNPXTR 1
q5 a0107 a0107 a067 PNPXTR 1
q4 a0113 a0107 a070 PNPXTR 1
v4 a079 0 0
v7 a089 0 0
v5 a0124 0 0
v6 a0144 0 0
v2 a0180 a0223 -5e-3
v1 a050 a0102 0
i9 vip vim 2.5e-6
i5 vcc a0167 12e-6
i0 vcc a0186 0.83e-3
f7 a0102 vee v7 1
f4 vcc a0115 v4 1
f5 vcc a0113 v5 1
f6 a050 vee v6 1
f2 0 a0175 v2 1
f3 0 a0191 v2 1
f1 0 a0191 v1 -2
f0 0 a0175 v1 2
rtm 0 a0191 128e3
rtp a0175 0 128e3
r28 a089 0 200
r24 vcc ven 100e3
r25 a079 0 200
r27 a0144 0 200
r29 a0185 vee 250
r30 a0189 vee 250
r26 a0124 0 200
r31 vcc a0149 250
r32 vcc a0151 250
r20 vcc a067 250
r15 vop a0167 2.5e3
r22 vcc a070 250
r16 a0167 vom 2.5e3
r33 a099 a0180 250
rtc a0186 vee 100
r21 vcc a085 250
r19 a0126 vee 262
r17 a0130 vee 250
r18 a0128 vee 250
* P Buffer Stage
q405 a4017 a0107 a4040 PNPXTR
q402 vee a0175 a4017 PNPXTR
q400 vee a4005 a4038 PNPXTR
q407 a4005 a076 a4029 NPNXTR
q403 vcc a0175 a4005 NPNXTR
q401 vcc a4017 a4060 NPNXTR
r405 vop a4038 2
r404 a4060 vop 2
r402 a4029 vee 160
r400 vcc a4040 225
* M Buffer Stage
q505 a5017 a0107 a5040 PNPXTR
q502 vee a0191 a5017 PNPXTR
q500 vee a5005 a5038 PNPXTR
q507 a5005 a076 a5029 NPNXTR
q503 vcc a0191 a5005 NPNXTR
q501 vcc a5017 a5060 NPNXTR
r505 vom a5038 2
r504 a5060 vom 2
r502 a5029 vee 160
r500 vcc a5040 225
*************************************************************
** Model Parameters
*************************************************************

.model DIODEideal d(tnom=25.0 is=1e-18)
.model DIODEnoisy d(tnom=25.0 is=1e-18 af=2.0 kf=80e-12)
.model NPNXTR npn(tnom=25.0             is=14.42e-18            bf=121
+                 vaf=200.0             rb=57.00                re=3.000
+                 rc=7.000              cje=206.3e-15           cjc=81.45e-15
+                 kf=480.0e-12          af=2.000)
.model PNPXTR pnp(tnom=25.0             is=18.92e-18            bf=79
+                 vaf=60.00             rb=35.80                re=1.600
+                 rc=3.500              cje=167.4e-15           cjc=126.8e-15
+                 kf=350.0e-12          af=2.000)

.ends lmh6552