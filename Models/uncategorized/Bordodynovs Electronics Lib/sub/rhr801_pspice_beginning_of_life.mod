***************************************************************************
*
* WARNING : please consider following remarks before usage
*
* 1) All models are a tradeoff between accuracy and complexity (ie. simulation
*    time).
* 2) Macromodels are not a substitute to breadboarding, they rather confirm the
*    validity of a design approach and help to select surrounding component values.
* 3) A macromodel emulates the NOMINAL performance of a TYPICAL device within
*    SPECIFIED OPERATING CONDITIONS (ie. temperature, supply voltage, etc.).
*    Thus the macromodel is often not as exhaustive as the datasheet, its goal
*    is to illustrate the main parameters of the product.
* 4) Data issued from macromodels used outside of its specified conditions
*    (Vcc, Temperature, etc) or even worse: outside of the device operating
*    conditions (Vcc, Vicm, etc) are not reliable in any way.
*
***********************************************************************************  RHR801  Spice macromodel subckt***
***  October 2014
***  
****                      
************ CONNECTIONS: 
****                 NON-INVERTING INPUT
****                   |  INVERTING INPUT
****                   |    |     POSITIVE POWER SUPPLY
****                   |    |       |     NEGATIVE POWER SUPPLY
****                   |    |       |       |   OUTPUT  
****                   |    |       |       |     |     
****                   |    |       |       |     |  
.SUBCKT RHR801   VP  VM  VCCP VCCN  VS
X_C_FALL V_VALORI_C_FALL 0 VREF V_C_FALL VCCAP_PSPICE
+PARAMS: CAP_scale={CAP_SCALE__C_FALL} Rserie=1
X_C_VOD V_VALORI_C_VOD 0 NET0209 VREF VCCAP_PSPICE
+PARAMS: CAP_scale={CAP_SCALE__C_VOD} Rserie=1.0
X_C_RISE V_VALORI_C_RISE 0 V_C_RISE VREF VCCAP_PSPICE
+PARAMS: CAP_scale={CAP_SCALE__C_RISE} Rserie=1
X_C_VCC V_VALORI_C_VCC 0 VB_D_VOD_VCC VREF VCCAP_PSPICE
+PARAMS: CAP_scale={CAP_SCALE__C_VCC} Rserie=1
    M_NMOS2 VO_DIFF_PLUS VM VEE_N VCCN_ENHANCED MOS_N L={L} W={W}
    M_NMOS1 VO_DIFF_MINUS NET0288 VEE_N VCCN_ENHANCED MOS_N L={L} W={W}
    IIN_BIAS_VM VREF VM DC 2.5u
    IEE_N VEE_N VCCN_ENHANCED DC {IEE}
    IIN_BIAS_VP VREF VP DC 2.5u
    V58 NET279 NET214 DC {VD_COMPENSAZIONE}
    V59 NET240 NET287 DC {VD_COMPENSAZIONE}
    VREADIO VB_4 VS DC 0
    VVLIM_LOW_VB NET295 NET220 DC {VD_COMPENSAZIONE}
    VPROT_IN_P_VCCP NET223 NET256 DC {V_DPROT}
    V_ENHANCE_VCCN VCCN_ENHANCED VCCN DC {VCCN_ENHANCE}
    VVLIM_HIGH_VB NET244 NET291 DC {VD_COMPENSAZIONE}
    V_ENHANCE_VCCP VCCP_ENHANCED VCCP DC {VCCP_ENHANCE}
    VPROT_IN_M_VCCN NET231 NET355 DC {V_DPROT}
    VPROT_IN_P_VCCN NET233 NET234 DC {V_DPROT}
    VPROT_IN_M_VCCP NET343 NET246 DC {V_DPROT}
    D40 NET214 VB_D_VOD DIODE_NOVd
    D_ENABLE_RISE VB_D_G_RF V_C_RISE DIODE_rf
    DILIM_SINK VB_3_SINK VB_3 DIODE_ILIM
    D41 VB_D_VOD NET240 DIODE_NOVd
    D_ENABLE_FALL V_C_FALL VB_D_G_RF DIODE_rf
    DILIM_SOURCE VB_3 VB_3_SOURCE DIODE_ILIM
    D3 VB_D_G NET244 DIODE_NOVd
    DPROT_IN_M_VCCP VM NET246 DIODE_VLIM
    D4 NET220 NET0271 DIODE_NOVd
    DPROT_IN_M_VCCN NET231 VM DIODE_VLIM
    DPROT_IN_P_VCCP NET0288 NET256 DIODE_VLIM
    DPROT_IN_P_VCCN NET233 NET0288 DIODE_VLIM
    CSERIE_C_VOD VB_D_VOD NET0209 1u
    C84 VM VP 5p    
    
*    E_C_RISE V_VALORI_C_RISE 0 PWL(1) VCCP VCCN ( 3.3 ,
*+{17.2p/CAP_SCALE__C_RISE} ) ( 5.0 , {17.2p/CAP_SCALE__C_RISE} )
     E_C_RISE V_VALORI_C_RISE 0  VALUE={TABLE( V(VCCP,VCCN) , 3.3 , 17.2p,
+ 5.0 , 17.2p )/CAP_SCALE__C_RISE}

*    E_C_FALL V_VALORI_C_FALL 0 PWL(1) VCCP VCCN ( 3.3 ,
*+{15.5p/CAP_SCALE__C_FALL} ) ( 5.0 , {15.8p/CAP_SCALE__C_FALL} )
    E_C_FALL V_VALORI_C_FALL 0  VALUE={TABLE( V(VCCP,VCCN) , 3.3 , 15.5p,
+ 5.0 , 15.8p )/CAP_SCALE__C_FALL}

    E_VDEP_SOURCE_2 VAL_VDEP_SOURCE_FILTERED 0
+VALUE={IF(V(val_vdep_source)>=0, 0, V(val_vdep_source))}

*    E_RO_3_VAL_VOL RO_3_VAL_VOL 0 PWL(1) VCCP VCCN ( 3.3 , 21.5 ) ( 5.0 ,10 )
    E_RO_3_VAL_VOL RO_3_VAL_VOL 0 VALUE={((V(VCCP,VCCN) - 3.3)/(5.0 - 3.3))*(10 - 21.5) + 21.5}

    E65 NET279 0 VCCN 0 1.0
    E_VDEP_SOURCE_1 VAL_VDEP_SOURCE 0 VALUE={( -113.735294117647 +
+67.6470588235294*V(Vccp,Vccn) )  -5000*I(VreadIo) }
    E_VDEP_SINK_3 VDEP_SINK 0 VALUE={IF( abs(I(VreadIo))<1m , 0 ,
+V(val_vdep_sink_filtered))}

*   E_ICCSAT_LOW ICC_OUT_LOW 0 PWL(1) VCCP VCCN ( 3.3 , {1.63m - IEE} ) (
*+5.0 , {1.81m - IEE} )
   E_ICCSAT_LOW ICC_OUT_LOW 0 VALUE={TABLE( V(VCCP,VCCN) , 3.3 , {1.63m - IEE},
+5.0 , {1.81m - IEE} )}

*    E_C_VOD V_VALORI_C_VOD 0 PWL(1) VP VM ( -100m ,
*+{0.495p/CAP_SCALE__C_VOD} ) ( -50m , {0.3456p/CAP_SCALE__C_VOD} ) ( +50m
*+, {0.3512p/CAP_SCALE__C_VOD} ) ( +100m , {0.502p/CAP_SCALE__C_VOD} )
    E_C_VOD V_VALORI_C_VOD 0 VALUE={TABLE( V(VP,VM) , -100m , 0.495p,
+-50m , 0.3456p , +50m , 0.3512p , +100m , 0.502p )/CAP_SCALE__C_VOD}

    E_VOL VB_D_G NET0271 VALUE={0}
    E_VDEP_SINK_2 VAL_VDEP_SINK_FILTERED 0
+VALUE={IF(V(val_vdep_sink)<=0 , 0 , V(val_vdep_sink))}

*    E_ICCSAT_HIGH ICC_OUT_HIGH 0 PWL(1) VCCP VCCN ( 3.3 , {1.44m - IEE} )
*+( 5.0 , {1.59m - IEE} )
    E_ICCSAT_HIGH ICC_OUT_HIGH 0 VALUE={TABLE( V(VCCP,VCCN) , 3.3 , {1.44m - IEE},
+5.0 , {1.59m - IEE} )}

*    E_HYST_VAL HYST_VAL 0 PWL(1) VCCP VCCN ( 3.3 , {2.6m} ) ( 5.0 , {2.6m})
    E_HYST_VAL HYST_VAL 0 VALUE={2.6m}

    E66 NET287 0 VCCP 0 1.0
    E_RO_3 VB_3 VB_4 VALUE={IF( I(VreadIo)>0 ,
+I(VreadIo)*V(Ro_3_val_VOH) , I(VreadIo)*V(Ro_3_val_VOL) )}
    EVLIM_HIGH_VB NET291 0 VCCP 0 1.0
    
*    E_C_VCC V_VALORI_C_VCC 0 TABLE {VALIF(V(VP,VM)>0,V(Vccp,Vccn),
*+-V(Vccp,Vccn))}=(-5 {0.0062p/CAP_scale__C_VCC}) (-3.3
*+{1f/CAP_scale__C_VCC}) (3.3 {1f/CAP_scale__C_VCC}) (5
*+{0.0095p/CAP_scale__C_VCC})
*
*Spice: (al posto della "Vcc negativa fittizia" c'e' un IF V(VP,VM) 
*        sulle due tabelle dei valori di capacita' cioe' se V(VP,VM)>0, caso cioe' di 
*        low-to-high cioe' rise, si considera' la tabella dei valori definiti per 
*        "Vcc positiva" mentre se V(VP,VM)<= 0, caso cioe' di 
*        high-to-low cioe' fall, si considera' la tabella dei valori definiti per
*        "Vcc negativa":
    E_C_VCC  V_VALORI_C_VCC 0  VALUE={ IF(V(VP,VM)>0, 
    +TABLE( V(VCCP,VCCN), 3.3 , 1f , 5 , 0.0095p),
    +TABLE( V(VCCP,VCCN), 3.3 , 1f , 5 , 0.0062p ))/CAP_scale__C_VCC}    
    
    EILIM_SOURCE VB_3_SOURCE VDEP_SOURCE VB_3 0 1.0
    EVLIM_LOW_VB NET295 0 VCCN 0 1.0
    E2_REF NET357 0 VCCN 0 1.0

*    E_VIO VP NET0390 PWL(1) VCCP VCCN ( 3.3 , -0.2m ) ( 5.0 , -0.2m )
    E_VIO VP NET0390  VALUE={-0.2m}
    
    EILIM_SINK VB_3_SINK VDEP_SINK VB_3 0 1.0
    E_VREF VREF 0 NET351 0 1.0
    E_VDEP_SOURCE_3 VDEP_SOURCE 0 VALUE={IF( abs(I(VreadIo))<1m , 0 ,
+V(val_vdep_source_filtered))}
    E1_REF NET319 0 VCCP 0 1.0
    E_VDEP_SINK_1 VAL_VDEP_SINK 0 VALUE={( 46.0882352941176
+-44.11764705882352*V(Vccp,Vccn) ) -5000*I(VreadIo) }

*    E_RO_3_VAL_VOH RO_3_VAL_VOH 0 PWL(1) VCCP VCCN ( 3.3 , 18.5 ) ( 5.0 , 4 )
    E_RO_3_VAL_VOH RO_3_VAL_VOH 0 VALUE={((V(VCCP,VCCN) - 3.3)/(5.0 - 3.3))*(4 - 18.5) + 18.5}  

    E_HYST NET0288 NET0390 VALUE={IF( V(Vccp,Vccn)>=VCCMIN ,
++V(VS,Vref)/( V(Vccp,Vccn)/V(Hyst_val)) , 0 )}
    R_RISE_FALL VREF VB_D_G_RF {R_RISE_FALL}
    R_DELAY_VOD VREF VB_D_VOD {R_DELAY}
    R_ICCSAT_HIGH ICC_OUT_HIGH 0 1K
    RO_2 VB_3 VB_2 1m
    RO_1 VREF VB_2 {RO_1}
    RPROT_IN_P_VCCP NET223 VCCP 15K
    RPROT_IN_M_VCCP VCCP NET343 15K
    R_ICCSAT_LOW ICC_OUT_LOW 0 1K
    RD1 VCCP_ENHANCED VO_DIFF_MINUS {RD}
    RD2 VCCP_ENHANCED VO_DIFF_PLUS {RD}
    R_DELAY_VCC VREF VB_D_VOD_VCC {R_DELAY}
    R1_REF NET319 NET351 1Meg
    R_GAIN VB_D_G VREF {R1}
    RPROT_IN_M_VCCN VCCN NET355 15K
    R2_REF NET351 NET357 1Meg
    RPROT_IN_P_VCCN NET234 VCCN 15K
    G_IOUT_SOURCED VCCP 0 VALUE={IF(I(VreadIo)>0, I(VreadIo),0)}
    G_ICCSAT VCCP VCCN VALUE={IF( V(VS)>V(Vccp,Vccn)/2 ,
+V(Icc_out_high), V(Icc_out_low) ) }
    G_RISE_FALL VREF VB_D_G_RF VB_D_G VREF {1/R_RISE_FALL}
    G_GAIN VREF VB_D_G VB_D_VOD_VCC VREF 1
    G_DELAY_VOD VB_D_VOD VREF VO_DIFF_MINUS VO_DIFF_PLUS {1/R_DELAY}
    G_OUT VREF VB_2 VB_D_G_RF VREF {1/RO_1}
    G_IOUT_SINKED VCCN 0 VALUE={IF(I(VreadIo)>0, 0, I(VreadIo))}
    G_DELAY_VCC VB_D_VOD_VCC VREF VREF VB_D_VOD {1/R_DELAY}

.PARAM CAP_scale__C_RISE=15p
.PARAM CAP_scale__C_FALL=15p
.PARAM CAP_scale__C_VOD=0.4p
.PARAM CAP_scale__C_VCC=0.001p
.PARAM VCCMIN=3.0
.PARAM A0=10E+06 
.PARAM IEE=10u
.PARAM W=100u
.PARAM L=10u
.PARAM gm_mos=99.72u
.PARAM RD=20k
.PARAM R_delay={RD}
.PARAM R1={A0/(gm_mos*RD)}
.PARAM Ro_1=30
.PARAM R_rise_fall=100
.PARAM VCCP_enhance=-300m
.PARAM VCCN_enhance=-550m
.PARAM V_DPROT=150m
.PARAM Vd_compensazione=-788.4u

.MODEL MOS_N  NMOS LEVEL=1  VTO=+0.65  KP=100E-6
.MODEL DIODE_rf D LEVEL=1  IS=10E-15 N=1 CJO=10f  T_ABS=27 
.MODEL DIODE_NOVd D LEVEL=1  IS=10E-15 N=0.001  T_ABS=27 
.MODEL DIODE_VLIM D LEVEL=1  IS=0.8E-15    T_ABS=27          
.MODEL DIODE_ILIM D LEVEL=1  IS=0.8E-15    T_ABS=27       

.ENDS RHR801


*******************************************************
******* SUBCKT VOLTAGE CONTROLLED CAPACITOR for SPICE
*******************************************************
.SUBCKT VCCAP_PSPICE Vctrl_plus Vctrl_minus Vout_plus Vout_minus  
+ PARAMS: CAP_scale=1u  Rserie=1
EVin 2 0 VALUE={1/V(Vctrl_plus,Vctrl_minus)}
EV2 8 Vout_plus POLY(2) 6 0 2 0 0 0 0 0 1 0 0 0 0 0
RR1 8 Vout_minus {Rserie}
GI1 0 6 Vout_minus 8 {1/Rserie}
RR2 0 6 100G 
CC1 6 0 {CAP_scale}  
.ENDS VCCAP_PSPICE
*******************************************************


