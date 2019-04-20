* OP-27E operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 09/15/89 at 15:47
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt OP-27E   1 2 3 4 5
*
  c1   11 12 2.730E-12
  c2    6  7 15.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 67.36E6 -70E6 70E6 70E6 -70E6
  ga    6  0 11 12 763.5E-6
  gcm   0  6 10 99 215.2E-12
  iee  10  4 dc 42.02E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 1.310E3
  rc2   3 12 1.310E3
  re1  13 10 78.10
  re2  14 10 78.10
  ree  10 99 4.760E6
  ro1   8  5 35
  ro2	7 99 37
  rp    3  4 9.810E3
  vb    9  0 dc 0
  vc    3 53 dc 1.800
  ve   54  4 dc 1.800
  vlim  7  8 dc 0
  vlp  91  0 dc 30
  vln   0 92 dc 30
.model dx D(Is=800.0E-18)
.model qx NPN(Is=800.0E-18 Bf=2.100E3)
.ends
