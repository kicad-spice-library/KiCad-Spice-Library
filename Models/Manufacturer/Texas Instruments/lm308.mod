* LM308 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 08/30/89 at 09:24
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |  compensation
*                | | | | | / \
.subckt LM308    1 2 3 4 5 6 7
*
  c1   11 12 6.887E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 19.59E6 -20E6 20E6 20E6 -20E6
  ga    6  0 11 12 122.5E-6
  gcm   0  6 10 99 6.891E-9
  iee  10  4 dc 6.003E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 8.161E3
  rc2   3 12 8.161E3
  re1  13 10 -460.3
  re2  14 10 -460.3
  ree  10 99 33.32E6
  ro1   8  5 125
  ro2   7 99 125
  rp    3  4 102.0E3
  vb    9  0 dc 0
  vc    3 53 dc 2.600
  ve   54  4 dc 2.600
  vlim  7  8 dc 0
  vlp  91  0 dc 6
  vln   0 92 dc 6
.model dx D(Is=800.0E-18)
.model qx NPN(Is=800.0E-18 Bf=2.000E3)
.ends
