* LM324 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 09/08/89 at 10:54
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt LM324    1 2 3 4 5
*
  c1   11 12 5.544E-12
  c2    6  7 20.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 15.91E6 -20E6 20E6 20E6 -20E6
  ga    6  0 11 12 125.7E-6
  gcm   0  6 10 99 7.067E-9
  iee   3 10 dc 10.04E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   4 11 7.957E3
  rc2   4 12 7.957E3
  re1  13 10 2.773E3
  re2  14 10 2.773E3
  ree  10 99 19.92E6
  ro1   8  5 50
  ro2   7 99 50
  rp    3  4 30.31E3
  vb    9  0 dc 0
  vc	3 53 dc 2.100
  ve   54  4 dc .6
  vlim  7  8 dc 0
  vlp  91  0 dc 40
  vln   0 92 dc 40
.model dx D(Is=800.0E-18)
.model qx PNP(Is=800.0E-18 Bf=250)
.ends
