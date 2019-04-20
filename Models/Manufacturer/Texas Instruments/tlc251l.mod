* TLC251L (LOW BIAS) operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 08/24/89 at 09:57
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TLC251L  1 2 3 4 5
*
  c1   11 12 10.73E-12
  c2    6  7 20.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 530.5E6 -500E6 500E6 500E6 -500E6
  ga    6  0 11 12 12.57E-6
  gcm   0  6 10 99 281.4E-12
  iss   3 10 dc 800.0E-9
  hlim 90  0 vlim 1K
  j1   11  2 10 jx
  j2   12  1 10 jx
  r2    6  9 100.0E3
  rd1   4 11 79.57E3
  rd2   4 12 79.57E3
  ro1   8  5 75
  ro2   7 99 75
  rp    3  4 1.000E6
  rss  10 99 250.0E6
  vb    9  0 dc 0
  vc    3 53 dc 1.300
  ve   54  4 dc 1.300
  vlim  7  8 dc 0
  vlp  91  0 dc 15
  vln   0 92 dc 15
.model dx D(Is=800.0E-18)
.model jx PJF(Is=500.0E-15 Beta=197E-6 Vto=-.1)
.ends
