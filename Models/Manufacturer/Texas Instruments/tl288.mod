* TL288 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 06/28/89 at 14:04
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TL288	 1 2 3 4 5
*
  c1   11 12 3.887E-12
  c2	6  7 12.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 6.189E6 -6E6 6E6 6E6 -6E6
  ga    6  0 11 12 282.8E-6
  gcm   0  6 10 99 3.560E-9
  iss   3 10 dc 270.0E-6
  hlim 90  0 vlim 1K
  j1   11  2 10 jx
  j2   12  1 10 jx
  r2    6  9 100.0E3
  rd1   4 11 3.536E3
  rd2   4 12 3.536E3
  ro1   8  5 60
  ro2   7 99 60
  rp    3  4 11.54E3
  rss  10 99 740.7E3
  vb    9  0 dc 0
  vc    3 53 dc 2.200
  ve   54  4 dc 2.200
  vlim  7  8 dc 0
  vlp  91  0 dc 30
  vln   0 92 dc 30
.model dx D(Is=800.0E-18)
.model jx PJF(Is=15.00E-12 Beta=165.3E-6 Vto=-1)
.ends
