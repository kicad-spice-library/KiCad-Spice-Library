* TLE2022 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 08/17/89 at 12:52
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TLE2022  1 2 3 4 5
*
  c1   11 12 6.814E-12
  c2    6  7 20.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 45.47E6 -50E6 50E6 50E6 -50E6
  ga	6  0 11 12 377.9E-6
  gcm	0  6 10 99 7.84E-10
  iee   3 10 dc 18.07E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   4 11 2.842E3
  rc2   4 12 2.842E3
  re1  13 10 -31.95
  re2  14 10 -31.95
  ree  10 99 11.07E6
  ro1   8  5 250
  ro2   7 99 250
  rp    3  4 137.2E3
  vb    9  0 dc 0
  vc	3 53 dc 1.300
  ve   54  4 dc 1.500
  vlim  7  8 dc 0
  vlp  91  0 dc 3
  vln   0 92 dc 3
.model dx D(Is=800.0E-18)
.model qx PNP(Is=800.0E-18 Bf=257.1)
.ends
