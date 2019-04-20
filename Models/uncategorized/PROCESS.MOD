.model BSIM_du2 r rsh = 120 defw = 0 narrow = 0
.model BSIM_du2 c cj = 0.00031 cjsw = 3e-10 defw = 0 narrow = 0
.model BSIM_du1 r rsh = 35 defw = 0 narrow = 0
.model BSIM_du1 c cj = 0.000275 cjsw = 1.9e-10 defw = 0 narrow = 0
.model BSIM_py1 r rsh = 30 defw = 0 narrow = 0
.model BSIM_py1 c cj = 7e-05 cjsw = 0 defw = 0 narrow = 0
.model BSIM_ml2 r rsh = 0.03 defw = 0 narrow = 0
.model BSIM_ml2 c cj = 1.3e-05 cjsw = 0 defw = 0 narrow = 0
.model BSIM_ml1 r rsh = 0.04 defw = 0 narrow = 0
.model BSIM_ml1 c cj = 2.6e-05 cjsw = 0 defw = 0 narrow = 0
.model BSIM_pm2_du2 pmos level=4
+ vfb = -0.21389 lvfb = 0.0336471 wvfb = 0.220237
+ phi = 0.697239 lphi = 0 wphi = 0
+ k1 = 0.595618 lk1 = -0.097957 wk1 = -0.081902
+ k2 = -0.020029 lk2 = 0.0197751 wk2 = -0.040038
+ eta = -0.01403 leta = 0.0362814 weta = 0.014472
+ muz = 182.193 dl = 0.8656 dw = 0.57444
+ u0 = 0.112067 lu0 = 0.0928463 wu0 = -0.088985
+ u1 = 0.0239431 lu1 = 0.0889483 wu1 = 0.0105634
+ x2mz = 7.51914 lx2mz = -1.8327 wx2mz = 3.98658
+ x2e = -0.0013199 lx2e = 0.00400836 wx2e = 0.000197847
+ x3e = 0.000570255 lx3e = -0.0012309 wx3e = -0.0023082
+ x2u0 = 0.00507623 lx2u0 = -0.00018537 wx2u0 = 0.00176966
+ x2u1 = -0.012781 lx2u1 = 0.011442 wx2u1 = 0.00636308
+ mus = 189.043 lmus = 86.4555 wmus = -34.304
+ x2ms = 4.09098 lx2ms = 3.51921 wx2ms = 4.49145
+ x3ms = 0.671879 lx3ms = 7.66627 wx3ms = -1.5826
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.032 temp = 27 vdd = 5
+ cgdo = 4.39e-10 cgso = 4.39e-10 cgbo = 2.34e-10
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 120 cj = 0.00031 cjsw = 3e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_pm2_du1 pmos level=4
+ vfb = -0.21389 lvfb = 0.0336471 wvfb = 0.220237
+ phi = 0.697239 lphi = 0 wphi = 0
+ k1 = 0.595618 lk1 = -0.097957 wk1 = -0.081902
+ k2 = -0.020029 lk2 = 0.0197751 wk2 = -0.040038
+ eta = -0.01403 leta = 0.0362814 weta = 0.014472
+ muz = 182.193 dl = 0.8656 dw = 0.57444
+ u0 = 0.112067 lu0 = 0.0928463 wu0 = -0.088985
+ u1 = 0.0239431 lu1 = 0.0889483 wu1 = 0.0105634
+ x2mz = 7.51914 lx2mz = -1.8327 wx2mz = 3.98658
+ x2e = -0.0013199 lx2e = 0.00400836 wx2e = 0.000197847
+ x3e = 0.000570255 lx3e = -0.0012309 wx3e = -0.0023082
+ x2u0 = 0.00507623 lx2u0 = -0.00018537 wx2u0 = 0.00176966
+ x2u1 = -0.012781 lx2u1 = 0.011442 wx2u1 = 0.00636308
+ mus = 189.043 lmus = 86.4555 wmus = -34.304
+ x2ms = 4.09098 lx2ms = 3.51921 wx2ms = 4.49145
+ x3ms = 0.671879 lx3ms = 7.66627 wx3ms = -1.5826
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.032 temp = 27 vdd = 5
+ cgdo = 4.39e-10 cgso = 4.39e-10 cgbo = 2.34e-10
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 35 cj = 0.000275 cjsw = 1.9e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_pm1_du2 pmos level=4
+ vfb = -1.0087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 182.193 dl = 0.27226 dw = 0.16288
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 2.81626 lx2mz = -8.255 wx2mz = 6.6768
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 184.449 lmus = 212.012 wmus = -65.47
+ x2ms = -4.433 lx2ms = -22.143 wx2ms = 14.6383
+ x3ms = -3.2083 lx3ms = 40.341 wx3ms = -10.149
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 120 cj = 0.00031 cjsw = 3e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_pm1_du1 pmos level=4
+ vfb = -1.0087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 182.193 dl = 0.27226 dw = 0.16288
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 2.81626 lx2mz = -8.255 wx2mz = 6.6768
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 184.449 lmus = 212.012 wmus = -65.47
+ x2ms = -4.433 lx2ms = -22.143 wx2ms = 14.6383
+ x3ms = -3.2083 lx3ms = 40.341 wx3ms = -10.149
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 35 cj = 0.000275 cjsw = 1.9e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm3_du2 nmos level=4
+ vfb = -5.6087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 534.334 dl = 0.79799 dw = 0.4774
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 8.25434 lx2mz = -24.197 wx2mz = 19.5696
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 540.612 lmus = 621.401 wmus = -191.9
+ x2ms = -12.992 lx2ms = -64.9 wx2ms = 42.9043
+ x3ms = -9.4035 lx3ms = 118.239 wx3ms = -29.747
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 120 cj = 0.00031 cjsw = 3e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm3_du1 nmos level=4
+ vfb = -5.6087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 534.334 dl = 0.79799 dw = 0.4774
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 8.25434 lx2mz = -24.197 wx2mz = 19.5696
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 540.612 lmus = 621.401 wmus = -191.9
+ x2ms = -12.992 lx2ms = -64.9 wx2ms = 42.9043
+ x3ms = -9.4035 lx3ms = 118.239 wx3ms = -29.747
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 35 cj = 0.000275 cjsw = 1.9e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm2_du2 nmos level=4
+ vfb = -1.0682 lvfb = -0.067765 wvfb = 0.415888
+ phi = 0.793602 lphi = 0 wphi = 0
+ k1 = 1.3821 lk1 = 0.156889 wk1 = -0.63435
+ k2 = 0.160163 lk2 = 0.141849 wk2 = -0.20333
+ eta = -0.011885 leta = 0.0133579 weta = 0.0213053
+ muz = 544.582 dl = 0.94444 dw = 0.44423
+ u0 = 0.0402955 lu0 = 0.0536003 wu0 = -0.051224
+ u1 = 0.201256 lu1 = 0.430621 wu1 = -0.15909
+ x2mz = -1.1522 lx2mz = -2.536 wx2mz = 24.8135
+ x2e = -0.0030525 lx2e = 0.0140355 wx2e = -0.0021259
+ x3e = 0.00233703 lx3e = -0.0019621 wx3e = -0.0030147
+ x2u0 = -0.0015014 lx2u0 = -0.0017938 wx2u0 = 0.00504494
+ x2u1 = -0.096961 lx2u1 = 0.0968463 wx2u1 = 0.0656404
+ mus = 595.572 lmus = 475.833 wmus = -230.62
+ x2ms = -77.819 lx2ms = 77.511 wx2ms = 81.9963
+ x3ms = -18.177 lx3ms = 123.358 wx3ms = -19.316
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.032 temp = 27 vdd = 5
+ cgdo = 2.69e-10 cgso = 2.69e-10 cgbo = 2.34e-10
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 120 cj = 0.00031 cjsw = 3e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm2_du1 nmos level=4
+ vfb = -1.0682 lvfb = -0.067765 wvfb = 0.415888
+ phi = 0.793602 lphi = 0 wphi = 0
+ k1 = 1.3821 lk1 = 0.156889 wk1 = -0.63435
+ k2 = 0.160163 lk2 = 0.141849 wk2 = -0.20333
+ eta = -0.011885 leta = 0.0133579 weta = 0.0213053
+ muz = 544.582 dl = 0.94444 dw = 0.44423
+ u0 = 0.0402955 lu0 = 0.0536003 wu0 = -0.051224
+ u1 = 0.201256 lu1 = 0.430621 wu1 = -0.15909
+ x2mz = -1.1522 lx2mz = -2.536 wx2mz = 24.8135
+ x2e = -0.0030525 lx2e = 0.0140355 wx2e = -0.0021259
+ x3e = 0.00233703 lx3e = -0.0019621 wx3e = -0.0030147
+ x2u0 = -0.0015014 lx2u0 = -0.0017938 wx2u0 = 0.00504494
+ x2u1 = -0.096961 lx2u1 = 0.0968463 wx2u1 = 0.0656404
+ mus = 595.572 lmus = 475.833 wmus = -230.62
+ x2ms = -77.819 lx2ms = 77.511 wx2ms = 81.9963
+ x3ms = -18.177 lx3ms = 123.358 wx3ms = -19.316
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.032 temp = 27 vdd = 5
+ cgdo = 2.69e-10 cgso = 2.69e-10 cgbo = 2.34e-10
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 35 cj = 0.000275 cjsw = 1.9e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm1_du2 nmos level=4
+ vfb = -1.0087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 534.334 dl = 0.79799 dw = 0.4774
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 8.25434 lx2mz = -24.197 wx2mz = 19.5696
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 540.612 lmus = 621.401 wmus = -191.9
+ x2ms = -12.992 lx2ms = -64.9 wx2ms = 42.9043
+ x3ms = -9.4035 lx3ms = 118.239 wx3ms = -29.747
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 120 cj = 0.00031 cjsw = 3e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
.model BSIM_nm1_du1 nmos level=4
+ vfb = -1.0087 lvfb = -0.21402 wvfb = 0.344354
+ phi = 0.796434 lphi = 0 wphi = 0
+ k1 = 1.31191 lk1 = 0.323395 wk1 = -0.57698
+ k2 = 0.14664 lk2 = 0.168585 wk2 = -0.18796
+ eta = -0.0010027 leta = -0.0094847 weta = 0.0147316
+ muz = 534.334 dl = 0.79799 dw = 0.4774
+ u0 = 0.0438497 lu0 = 0.0638105 wu0 = -0.061053
+ u1 = -0.057332 lu1 = 1.01174 wu1 = 0.0162706
+ x2mz = 8.25434 lx2mz = -24.197 wx2mz = 19.5696
+ x2e = -0.00076911 lx2e = 0.00962411 wx2e = -0.0037951
+ x3e = 0.000786777 lx3e = 0.000735448 wx3e = -0.0017796
+ x2u0 = 0.00106821 lx2u0 = -0.0080958 wx2u0 = 0.00403379
+ x2u1 = -0.019209 lx2u1 = -0.074573 wx2u1 = 0.014752
+ mus = 540.612 lmus = 621.401 wmus = -191.9
+ x2ms = -12.992 lx2ms = -64.9 wx2ms = 42.9043
+ x3ms = -9.4035 lx3ms = 118.239 wx3ms = -29.747
+ x3u1 = 0 lx3u1 = 0 wx3u1 = 0
+ tox = 0.03 temp = 27 vdd = 5
+ cgdo = 0 cgso = 0 cgbo = 0
+ xpart = 1 
+ n0 = 0 ln0 = 0 wn0 = 0
+ nb = 0 lnb = 0 wnb = 0
+ nd = 0 lnd = 0 wnd = 0
+ rsh = 35 cj = 0.000275 cjsw = 1.9e-10
+ js = 1e-05 pb = 0.7 pbsw = 0.8
+ mj = 0.5 mjsw = 0.33 wdf = 0
+ dell = 0
