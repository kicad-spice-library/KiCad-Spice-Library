*  **********************************************
*  *             TSMC SPICE MODEL               *
*  **********************************************
*  
*    PROCESS :  0.35um SILICIDE (SPQM,3.3V/5V) LOGIC
*    MODEL   :  BSIM3 ( V3.1 )
*    DOC NO. :  TA-1095-6009
*    VERSION :  V2.4
*    DATE    :  June 21, 2000
*    HSPICE VERSION : H98.2
********************************************************************************
*                                                                             
*       SPICE model release notes for H97.2, H97.4 and H98.2 and H98.4:         
*                                                                         
*                                                                             
* (1) New parameter "CALCACM" is added in the H98.2 & H98.4                    
*                                                                             
*
*     In H97.2 & H97.4, the default values of AS/AD and PS/PD are zero when
* Bsim3v3.1 model with ACM=12 is used. This results in zero junction capacitance
* and incorrect junction leakage current, if AS/AD and PS/PD are not specified
* in the netlist. In H98.2 & H98.4, with CALCACM >0, the default calculation of 
* AS/AD and PS/PD will be calculated using HDIF. When CALCACM=0, the default is 
* zero for AS/AD and PS/PD.
*
* (2) New parameter "VFBFLAG" is added in H98.2 & H98.4
*
*     In H97.2 & H97.4, The capacitance model CAPMOD=0 normally uses a
* threshold voltage defined as Vth = vfbc + phi+ k1 * sqrt(phi - vbs), where
* vfbc is derived from the model parameter VFBCV. In this way, the CV will not
* track with VTH0 for corner simulation. In H98.2 and H98.4, VFBFLAG=1 uses
* Vth=vfb + phi + k1 * sqrt(phi - vbs), where vfb is identical to the  
* flatband voltage used in the drain current calculations. The resultant CV
* simulation will track with change in VTH0, which is more physical for corner
* case simulation. The VFBFLAG default value is zero.
*
******************************************************************************
*
******************************************************************************
*                                                                            * 
*       IN THIS MODEL LIB CONTAINS :                                         *  
*                                                                            *
*                                                                            *
*       1.LIB TT                                                             *
*             SS                                                             *
*             FF                                                             *
*             SF                                                             *
*             FS                                                             *
*        ( 3.3V normal devices & 3.3V NMOS with ESD implant with different   *
*          geometric and corner models)                                      *
*                                                                            *
*       2.LIB TT_5V                                                          *
*             SS_5V                                                          *
*             FF_5V                                                          *
*             SF_5V                                                          *
*             FS_5V                                                          *
*        ( 5V normal devices & 5V NMOS with ESD implant with different       *
*          geometric and corner models)                                      *
*                                                                            *
*       3.LIB BIP                                                            *
*        ( P+/NW/PSUB vertical PNP bipolar )                                 *
*                                                                            *
*       4.LIB DIO                                                            *
*        ( P+/NW, N+/PW & NW/PW diode )                                      *
*                                                                            *
*       5.LIB RES                                                            *
*        ( resistor model )                                                  *
*                                                                            *
******************************************************************************
**************************************************************************
*
* 1)To use these models directly by programming in this style: 
*
*     .lib 'lib_path/lib_name' model_name 
*     
*
*  EX: .lib '/home/user/tsmc/LOGIC/logs355v.l' TT   
*        
*             for typical N,PMOS
*      
*      .lib '/home/user/tsmc/LOGIC/logs355v.l' TT_5V   
*        
*             for typical 5V N,PMOS
*      
*  note:
*      corner_name
*       TT : typical model
*       SS : Slow NMOS Slow PMOS model
*       FF : Fast NMOS Fast PMOS model
*       SF : Slow NMOS Fast PMOS model
*       FS : Fast NMOS Slow PMOS model
*      
*       TT_5V : typical model for 5V device
*       SS_5V : Slow NMOS Slow PMOS model for 5V device
*       FF_5V : Fast NMOS Fast PMOS model for 5V device
*       SF_5V : Slow NMOS Fast PMOS model for 5V device
*       FS_5V : Fast NMOS Slow PMOS model for 5V device
*
* 2)HDIF depends on your layout poly spacer to contact center distance.
*   The value listed here is TSMC testkey value. you can change it
*   according to your layout by change the parameters :
*  ( hdifn: NMOS; hdifp: PMOS; hdifn5: 5V NMOS; hdifp5: 5V PMOS )
*
* 3)Please note that AS/AD and PS/PD need to be specified to avoid
*   zero junction capacitance and to result in correct junction leakage
*   current.
*
***************************************************************
*                                                             *
*               NORMAL DEVICES LIB                            *
*                                                             *
***************************************************************
*
* **************** CORNER_LIB OF TYPICAL MODEL ****************************
.LIB TT
.param toxn = 7.5e-9 toxp = 7.7e-9  toxe = 7.5E-09
+dxl = 0 dxw = 0
+dvtn = 0 dvtp = 0  delvtoe= 0
+cjn = 1.01893e-3 cjp = 1.416829e-3  cje = 0.00101893
+cjswn = 3.057956e-10 cjswp = 4.173308e-10  cjswe  = 3.057956E-10
+cgon = 2.79009e-10 cgop = 2.30748e-10  cgoe = 2.79009E-10
+cjswgn = 1.524314e-10 cjswgp = 1.013197e-10  cjswge = 1.524314E-10
+hdifn = 3.8e-07 hdifp = 3.8e-07  hdife = 9.55E-07
.lib 'g:\icdesign\035.l' MOS
.ENDL TT
**************** CORNER_LIB OF  SNSP   MODEL ****************************
.LIB SS
.param toxn = 8.0e-9 toxp = 8.2e-9  toxe = 8E-09 
+dxl = 4e-8 dxw = -6e-8
+dvtn = 0.1 dvtp = -0.1  delvtoe= 0.1
+cjn = 1.120823e-3 cjp = 1.558512e-3  cje = 0.001120823
+cjswn = 3.36375e-10 cjswp = 4.59064e-10  cjswe = 3.363752E-10
+cgon = 3.0691e-10 cgop = 2.53823e-10  cgoe = 3.069099E-10
+cjswgn = 1.67675e-10 cjswgp = 1.11452e-10  cjswge = 1.676745E-10
+hdifn = 3.8e-07 hdifp = 3.8e-07  hdife  = 9.55E-07
.lib 'g:\icdesign\035.l' MOS
.ENDL SS
**************** CORNER_LIB OF  FNFP   MODEL ****************************
.LIB FF
.param toxn = 7.0e-9 toxp = 7.2e-9  toxe = 7E-09
+dxl = -4e-8 dxw = 6e-8  
+dvtn = -0.1 dvtp = 0.1  delvtoe= -0.1
+cjn = 9.17037e-4 cjp = 1.275146e-3  cje = 0.000917037
+cjswn = 2.75216e-10 cjswp = 3.75598e-10  cjswe = 2.75216E-10
+cgon = 2.51108e-10 cgop = 2.07673e-10  cgoe = 2.511081E-10
+cjswgn = 1.37188e-10 cjswgp = 9.11877e-11  cjswge = 1.371883E-10
+hdifn = 3.8e-07 hdifp = 3.8e-07  hdife = 9.55E-07
.lib 'g:\icdesign\035.l' MOS
.ENDL FF
**************** CORNER_LIB OF  SNFP   MODEL ****************************
.LIB SF
.param toxn = 7.5e-9 toxp = 7.7e-9  toxe = 7.5E-09 
+dxl = 0 dxw = 0  
+dvtn = 0.1 dvtp = 0.1  delvtoe= 0.1
+cjn = 1.120823e-3 cjp = 1.275146e-3  cje = 0.001120823 
+cjswn = 3.36375e-10 cjswp = 3.75598e-10  cjswe = 3.363752E-10
+cgon = 2.79009e-10 cgop = 2.30748e-10  cgoe = 2.79009E-10
+cjswgn = 1.67675e-10 cjswgp = 9.11877e-11  cjswge = 1.676745E-10
+hdifn = 3.8e-07 hdifp = 3.8e-07  hdife = 9.55E-07
.lib 'g:\icdesign\035.l' MOS
.ENDL SF
**************** CORNER_LIB OF  FNSP   MODEL ****************************
.LIB FS
.param toxn = 7.5e-9 toxp = 7.7e-9  toxe = 7.5E-09
+dxl = 0 dxw = 0
+dvtn = -0.1 dvtp = -0.1  delvtoe= -0.1
+cjn = 9.17037e-4 cjp = 1.558512e-3  cje = 0.000917037
+cjswn = 2.75216e-10 cjswp = 4.59064e-10  cjswe = 2.75216E-10
+cgon = 2.79009e-10 cgop = 2.30748e-10  cgoe = 2.79009E-10
+cjswgn = 1.37188e-10 cjswgp = 1.11452e-10  cjswge = 1.371883E-10
+hdifn = 3.8e-07 hdifp = 3.8e-07  hdife = 9.55E-07
.lib 'g:\icdesign\035.l' MOS
.ENDL FS
**************************************************************************
*
*
***************************************************************
*                                                             *
*               5V DEVICES LIB                                *
*                                                             *
***************************************************************
*
**************** CORNER_LIB OF TYPICAL MODEL (5V DEVICES) **************
.LIB TT_5V
.param toxn5 = 1.46e-8 toxp5 = 1.48e-8  toxe5 = 1.46E-08
+dxl5 = 0 dxw5 = 0
+dvtn5 = 0 dvtp5 = 0  dvte5 = 0
+cjn5 = 1.03764e-3 cjp5 = 1.428223e-3  cje5= 8.854906E-4 
+cjswn5 = 2.761046e-10 cjswp5 = 3.852659e-10  cjswe5= 6.434521E-10
+cgon5 = 1.665234e-10 cgop5 = 2.00908e-10   cgoe5= 2.5406E-10
+cjswgn5 = 1.391065e-10 cjswgp5 = 9.91118E-11  cjswge5 = 4.849398E-10
+hdifn5 = 3.8e-07 hdifp5 = 3.8e-07  hdife5= 9.55E-07
.lib 'g:\icdesign\035.l' MOS_5V
.ENDL TT_5V
**************** CORNER_LIB OF  SNSP   MODEL (5V DEVICES) **************
.LIB SS_5V
.param toxn5 = 1.56e-8 toxp5 = 1.58e-8  toxe5 = 1.56e-08
+dxl5 = 4e-8 dxw5 = -6e-8  
+dvtn5 = 0.1 dvtp5 = -0.15  dvte5 = 0.1
+cjn5 = 1.141400e-3 cjp5 = 1.57105e-3  cje5= 9.740397e-04 
+cjswn5 = 3.03755e-10 cjswp5 = 4.23792e-10  cjswe5= 7.077973e-10
+cgon5 = 1.83176e-10 cgop5 = 2.20999e-10  cgoe5= 2.794660e-10 
+cjswgn5 = 1.53017e-10 cjswgp5 = 1.09902e-10  cjswge5 = 5.334338e-10
+hdifn5 = 3.8e-07 hdifp5 = 3.8e-07  hdife5= 9.550000e-07
.lib 'g:\icdesign\035.l' MOS_5V
.ENDL SS_5V
**************** CORNER_LIB OF  FNFP   MODEL (5V DEVICES) **************
.LIB FF_5V
.param toxn5 = 1.36e-8 toxp5 = 1.38e-8  toxe5 = 1.360e-08
+dxl5 = -4e-8 dxw5 = 6e-8
+dvtn5 = -0.1 dvtp5 = 0.15  dvte5 = -0.1
+cjn5 = 9.024975e-4 cjp5 = 1.287522e-3  cje5= 7.969416e-04 
+cjswn5 = 2.48527e-10 cjswp5 = 3.46739e-10  cjswe5= 5.791069e-10
+cgon5 = 1.49871e-10 cgop5 = 1.80817e-10  cgoe5= 2.286540e-10 
+cjswgn5 = 1.25196e-10 cjswgp5 = 8.99201e-11  cjswge5 = 4.364458e-10
+hdifn5 = 3.8e-07 hdifp5 = 3.8e-07  hdife5= 9.55e-07
.lib 'g:\icdesign\035.l' MOS_5V
.ENDL FF_5V
**************** CORNER_LIB OF  SNFP   MODEL (5V DEVICES) **************
.LIB SF_5V
.param toxn5 = 1.46e-8 toxp5 = 1.48e-8  toxe5 = 1.460e-08
+dxl5 = 0 dxw5 = 0
+dvtn5 = 0.1 dvtp5 = 0.15  dvte5 = 0.1
+cjn5 = 1.141400e-3 cjp5 = 1.287522e-3  cje5= 9.740397e-04 
+cjswn5 = 3.03755e-10 cjswp5 = 3.46739e-10  cjswe5= 7.077973e-10
+cgon5 = 1.665234e-10 cgop5 = 2.00908e-10  cgoe5= 2.540600e-10
+cjswgn5 = 1.53017e-10 cjswgp5 = 8.99201e-11  cjswge5 = 5.334338e-10
+hdifn5 = 3.8e-07 hdifp5 = 3.8e-07  hdife5= 9.55e-07
.lib 'g:\icdesign\035.l' MOS_5V
.ENDL SF_5V
**************** CORNER_LIB OF  FNSP   MODEL (5V DEVICES) **************
.LIB FS_5V
.param toxn5 = 1.46e-8 toxp5 = 1.48e-8  toxe5 = 1.460e-08 
+dxl5 = 0 dxw5 = 0
+dvtn5 = -0.1 dvtp5 = -0.15  dvte5 = -0.1
+cjn5 = 9.024975e-4 cjp5 = 1.57105e-3  cje5= 7.969416e-04 
+cjswn5 = 2.48527e-10 cjswp5 = 4.23792e-10  cjswe5= 5.791069e-10
+cgon5 = 1.665234e-10 cgop5 = 2.00908e-10  cgoe5= 2.540600e-10 
+cjswgn5 = 1.25196e-10 cjswgp5 = 1.09902e-10  cjswge5 = 4.364458e-10
+hdifn5 = 3.8e-07 hdifp5 = 3.8e-07  hdife5= 9.55e-07
.lib 'g:\icdesign\035.l' MOS_5V
.ENDL FS_5V
**************************************************************************
*
*
***************************************************************
*                                                             *
*                                                             *
*               NORMAL DEVICES MODEL                          *
*                                                             *
*                                                             *
*                                                             *
***************************************************************
*
**************************************************************************
*
*
***************************************************************
*                                                             *
*                 NMOS DEVICES MODEL                          *
*                                                             *
***************************************************************
*
.LIB MOS
*
*
*
.MODEL N.1             NMOS   (                    LMIN    = '1.197E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-05-dxw'
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.584049' LVTH0   = 1.612384E-08    WVTH0   = -2.086162E-08   
+PVTH0   = -1.937772E-14   K1      = 0.5220252       LK1     = 9.809426E-09    
+WK1     = -2.215848E-08   PK1     = -1.081879E-14   K2      = 0.02709618      
+LK2     = -6.58759E-09    WK2     = 5.844335E-09    PK2     = 3.4708E-15      
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250216.5        LVSAT   = -0.004321351    
+WVSAT   = 0.001311575     PVSAT   = -2.617906E-08   UA      = 3.225504E-11    
+LUA     = -3.731902E-17   WUA     = -6.47358E-16    PUA     = 7.48993E-22     
+UB      = 1.830791E-18    LUB     = 1.122256E-24    WUB     = 5.871964E-26    
+PUB     = -2.144195E-30   UC      = 4.717094E-11    LUC     = 1.083152E-16    
+WUC     = -2.836673E-17   PUC     = -1.365643E-22   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04674038      LU0     = 2.895707E-09    WU0     = -1.659836E-08   
+PU0     = -8.598878E-16   A0      = 0.5300233       LA0     = 5.224595E-07    
+WA0     = 9.500091E-08    PA0     = 1.359913E-13    KETA    = -0.008359211    
+LKETA   = 2.404593E-08    WKETA   = 2.47412E-08     PKETA   = -3.134335E-14   
+A1      = 0               A2      = 0.99            AGS     = 0.02004817      
+LAGS    = -9.614005E-10   WAGS    = 3.052623E-09    PAGS    = -6.093041E-14   
+B0      = 0               B1      = 0               VOFF    = -0.1432328      
+LVOFF   = 3.7672E-08      WVOFF   = 2.783267E-08    PVOFF   = -1.658179E-14   
+NFACTOR = 1.071695        LNFACTOR= -3.191425E-07   WNFACTOR= -3.198483E-07   
+PNFACTOR= 4.284332E-13    CIT     = -7.649919E-05   LCIT    = 2.725173E-10    
+WCIT    = 4.707361E-10    PCIT    = -4.079043E-16   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 0.0002182418    
+LETA0   = 4.891615E-10    WETA0   = -2.223897E-10   PETA0   = 3.413627E-16    
+ETAB    = 1.655216E-05    LETAB   = -1.915085E-11   WETAB   = -2.093848E-11   
+PETAB   = 2.422582E-17    DSUB    = 0               PCLM    = 0.1632256       
+LPCLM   = 7.340164E-07    WPCLM   = 7.600176E-09    PPCLM   = -1.516986E-13   
+PDIBLC1 = 1E-05           PDIBLC2 = -0.000118956    LPDIBLC2= 3.047963E-09    
+WPDIBLC2= 7.355327E-12    PPDIBLC2= -6.049224E-16   PDIBLCB = 0.138753        
+DROUT   = 0               PSCBE1  = 4.710407E+08    LPSCBE1 = -47.67879       
+WPSCBE1 = -73.52711       PPSCBE1 = -1.742797E-05   PSCBE2  = 0.0001511273    
+LPSCBE2 = -1.696461E-10   WPSCBE2 = -1.405065E-10   PPSCBE2 = 1.594718E-16    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06   
+BETA0   = 20              KT1     = -0.3129373      LKT1    = 2.640371E-08    
+WKT1    = 3.672218E-08    PKT1    = -8.622526E-14   KT2     = -0.04037788     
+LKT2    = 1.843258E-09    WKT2    = 2.97845E-08     PKT2    = -3.945926E-14   
+AT      = 21995.49        LAT     = -0.002308781    WAT     = 0.0004299513    
+PAT     = -4.974535E-10   UTE     = -2.126477       LUTE    = -4.580592E-07   
+WUTE    = 1.000684E-06    PUTE    = -1.73693E-13    UA1     = 1.352192E-10    
+LUA1    = -2.917594E-15   WUA1    = 2.593646E-15    PUA1    = 1.681139E-22    
+UB1     = -1.722684E-18   LUB1    = 3.583362E-24    WUB1    = -1.313493E-24   
+PUB1    = -1.137493E-30   UC1     = 1.546289E-11    LUC1    = 7.41811E-18     
+WUC1    = -3.63894E-18    PUC1    = 1.873742E-23    KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  ) 
*
*
*
.MODEL N.2             NMOS   (                    LMIN    = '7.97E-07-dxl'  
+LMAX    = '1.197E-06-dxl' WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-05-dxw'
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.576256' LVTH0   = 2.514042E-08    WVTH0   = -4.202987E-08   
+PVTH0   = 5.113948E-15    K1      = 0.5164742       LK1     = 1.6232E-08      
+WK1     = -5.634458E-08   PK1     = 2.873453E-14    K2      = 0.02536446      
+LK2     = -4.583989E-09   WK2     = 1.562382E-08    PK2     = -7.844064E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 474572          LVSAT   = -0.2639007      
+WVSAT   = -0.02525971     PVSAT   = 4.563911E-09    UA      = 0               
+UB      = 3.288819E-18    LUB     = -5.646822E-25   WUB     = -2.361292E-24   
+PUB     = 6.557574E-31    UC      = 1.726304E-10    LUC     = -3.68414E-17    
+WUC     = -1.952483E-16   PUC     = 5.651767E-23    RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.05197671      LU0     = -3.162722E-09   WU0     = -2.055012E-08   
+PU0     = 3.712301E-15    A0      = 1.417161        LA0     = -5.039583E-07   
+WA0     = 4.545693E-07    PA0     = -2.800293E-13   KETA    = 0.02458077      
+LKETA   = -1.406563E-08   WKETA   = -1.026654E-08   PKETA   = 9.160596E-15    
+A1      = 0               A2      = 0.99            AGS     = 0.09343582      
+LAGS    = -8.587092E-08   WAGS    = -1.434963E-07   PAGS    = 1.086267E-13    
+B0      = 0               B1      = 0               VOFF    = -0.1838554      
+LVOFF   = 8.467239E-08    WVOFF   = 1.060771E-07    PVOFF   = -1.071106E-13   
+NFACTOR = -0.03400384     LNFACTOR= 9.601509E-07    WNFACTOR= 1.067981E-06    
+PNFACTOR= -1.177285E-12   CIT     = 0.0004913237    LCIT    = -3.844538E-10   
+WCIT    = -3.322403E-10   PCIT    = 5.211393E-16    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 0.0001217044    
+LETA0   = 6.008551E-10    WETA0   = 1.009042E-09    PETA0   = -1.083404E-15   
+ETAB    = -6.365367E-06   LETAB   = 7.364722E-12    WETAB   = 1.277528E-10    
+PETAB   = -1.4781E-16     DSUB    = 0               PCLM    = 0.7659091       
+LPCLM   = 3.671174E-08    WPCLM   = -3.227764E-07   PPCLM   = 2.30547E-13     
+PDIBLC1 = 1E-05           PDIBLC2 = -0.001092461    LPDIBLC2= 4.174309E-09    
+WPDIBLC2= -5.845379E-10   PPDIBLC2= 7.989786E-17    PDIBLCB = -0.1139965      
+LPDIBLCB= 2.924316E-07    WPDIBLCB= 3.197285E-07    PPDIBLCB= -3.699259E-13   
+DROUT   = 0               PSCBE1  = 4.683486E+08    LPSCBE1 = -44.56396       
+WPSCBE1 = -212.0167       PPSCBE1 = 0.0001428045    PSCBE2  = 3.714656E-06    
+LPSCBE2 = 9.103205E-13    WPSCBE2 = -8.147431E-13   PPSCBE2 = -2.151535E-18   
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06   
+BETA0   = 20              KT1     = -0.1562424      LKT1    = -1.548923E-07   
+WKT1    = -4.077244E-07   PKT1    = 4.279995E-13    KT2     = -0.03425014     
+LKT2    = -5.246532E-09   WKT2    = -7.25403E-08    PKT2    = 7.893054E-14    
+AT      = 19172.5         LAT     = 0.0009574139    WAT     = 0.01660787      
+PAT     = -1.92153E-08    UTE     = -2.707706       LUTE    = 2.144223E-07    
+WUTE    = 1.151636E-06    PUTE    = -3.483443E-13   UA1     = -3.224284E-09   
+LUA1    = 9.693514E-16    WUA1    = 3.732786E-15    PUA1    = -1.149871E-21   
+UB1     = 2.323169E-18    LUB1    = -1.09769E-24    WUB1    = -3.397445E-24   
+PUB1    = 1.273639E-30    UC1     = 2.823518E-11    LUC1    = -7.359427E-18   
+WUC1    = -2.014884E-17   PUC1    = 3.783937E-23    KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1               
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.3             NMOS   (                    LMIN    = 3.5E-07         
+LMAX    = '7.97E-07-dxl'  WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-05-dxw'
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.612366' LVTH0   = -2.195033E-09   WVTH0   = -4.942107E-08   
+PVTH0   = 1.070908E-14    K1      = 0.5217116       LK1     = 1.226722E-08    
+WK1     = 1.62416E-08     PK1     = -2.621321E-14   K2      = 0.04534624      
+LK2     = -1.97102E-08    WK2     = -1.964804E-09   PK2     = 5.470523E-15    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 146269.1        LVSAT   = -0.01537539     
+WVSAT   = -0.03674294     PVSAT   = 1.325671E-08    UA      = 0               
+UB      = 2.953951E-18    LUB     = -3.111866E-25   WUB     = -2.25456E-24    
+PUB     = 5.749616E-31    UC      = 1.660162E-10    LUC     = -3.183445E-17   
+WUC     = -1.799815E-16   PUC     = 4.496069E-23    RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04862441      LU0     = -6.250294E-10   WU0     = -1.535462E-08   
+PU0     = -2.206897E-16   A0      = 0.7345476       LA0     = 1.277984E-08    
+WA0     = -2.539017E-07   PA0     = 2.562833E-13    KETA    = -0.006361756    
+LKETA   = 9.357865E-09    WKETA   = -1.298799E-08   PKETA   = 1.122074E-14    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.07163895     
+LVOFF   = -2.754624E-10   WVOFF   = -6.143033E-08   PVOFF   = 1.969253E-14    
+NFACTOR = 1.373278        LNFACTOR= -1.051615E-07   WNFACTOR= -4.756794E-07   
+PNFACTOR= -8.734273E-15   CIT     = -9.027528E-05   LCIT    = 5.581667E-11    
+WCIT    = 2.888431E-10    PCIT    = 5.097918E-17    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -0.0003502614   
+LETA0   = 9.581334E-10    WETA0   = -1.242287E-09   PETA0   = 6.208521E-16    
+ETAB    = 0.0009891934    LETAB   = -7.462733E-10   WETAB   = -7.833016E-10   
+PETAB   = 5.418582E-16    DSUB    = 0               PCLM    = 0.7913126       
+LPCLM   = 1.748126E-08    WPCLM   = -2.438961E-08   PPCLM   = 4.668212E-15    
+PDIBLC1 = 1E-05           PDIBLC2 = 0.0001653717    LPDIBLC2= 3.222129E-09    
+WPDIBLC2= -4.028251E-11   PPDIBLC2= -3.321032E-16   PDIBLCB = 0.4361967       
+LPDIBLCB= -1.240647E-07   WPDIBLCB= -2.777069E-07   PPDIBLCB= 8.23327E-14     
+DROUT   = 0               PSCBE1  = 3.496988E+08    LPSCBE1 = 45.25388        
+WPSCBE1 = -43.44224       PPSCBE1 = 1.519363E-05    PSCBE2  = 4.063321E-06    
+LPSCBE2 = 6.463813E-13    WPSCBE2 = -5.436765E-12   PPSCBE2 = 1.347336E-18    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06     
+BETA0   = 20              KT1     = -0.4461604      LKT1    = 6.457565E-08    
+WKT1    = 2.40358E-07     PKT1    = -6.259898E-14   KT2     = -0.05914541     
+LKT2    = 1.359918E-08    WKT2    = 6.092503E-08    PKT2    = -2.210271E-14   
+AT      = 20237.79        LAT     = 0.0001509916    WAT     = -0.01024933     
+PAT     = 1.115594E-09    UTE     = -2.519309       LUTE    = 7.180611E-08    
+WUTE    = 1.189467E-06    PUTE    = -3.769821E-13   UA1     = -2.509661E-09   
+LUA1    = 4.28381E-16     WUA1    = 4.42808E-15     PUA1    = -1.676208E-21   
+UB1     = 1.511838E-18    LUB1    = -4.83512E-25    WUB1    = -3.97729E-24    
+PUB1    = 1.712581E-30    UC1     = 1.833753E-11    LUC1    = 1.330973E-19    
+WUC1    = 5.981525E-18    PUC1    = 1.805868E-23    KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.4             NMOS   (                    LMIN    = '1.197E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.571982' LVTH0   = -6.914564E-09   WVTH0   = -5.596558E-09   
+PVTH0   = 9.765864E-15    K1      = 0.5200408       LK1     = -1.94431E-08    
+WK1     = -1.964819E-08   PK1     = 2.618565E-14    K2      = 0.02640612      
+LK2     = 8.159431E-09    WK2     = 6.717265E-09    PK2     = -1.518418E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 245128.2        LVSAT   = 0.09724198      
+WVSAT   = 0.007748332     PVSAT   = -1.546567E-07   UA      = -7.022495E-10   
+LUA     = 8.125026E-16    WUA     = 2.817903E-16    PUA     = -3.260313E-22   
+UB      = 2.24264E-18     LUB     = -6.327575E-25   WUB     = -4.62269E-25    
+PUB     = 7.589682E-32    UC      = 3.872708E-11    LUC     = 1.783356E-17    
+WUC     = -1.768524E-17   PUC     = -2.210508E-23   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03728365      LU0     = -2.869267E-09   WU0     = -4.635589E-09   
+PU0     = 6.432805E-15    A0      = 0.5175889       LA0     = 1.025001E-06    
+WA0     = 1.107304E-07    PA0     = -4.997238E-13   KETA    = 0.01167333      
+LKETA   = -2.834473E-09   WKETA   = -5.999603E-10   PKETA   = 2.660353E-15    
+A1      = 0               A2      = 0.99            AGS     = 0.02246131      
+LAGS    = -4.912773E-08   B0      = 0               B1      = 0               
+VOFF    = -0.1212307      LVOFF   = 2.456386E-08    NFACTOR = 0.8713054       
+LNFACTOR= -1.882175E-08   WNFACTOR= -6.635555E-08   PNFACTOR= 4.852752E-14    
+CIT     = 0.0002544068    LCIT    = -4.382927E-11   WCIT    = 5.213999E-11    
+PCIT    = -7.725936E-18   CDSC    = 0               CDSCB   = 0               
+CDSCD   = 0               ETA0    = -8.590369E-05   LETA0   = 1.005656E-09    
+WETA0   = 1.623542E-10    PETA0   = -3.120026E-16   ETAB    = -3.053082E-05   
+LETAB   = 1.777605E-10    WETAB   = 3.862149E-11    PETAB   = -2.24867E-16    
+DSUB    = 0               PCLM    = 0.1692336       LPCLM   = 6.140966E-07    
+PDIBLC1 = 1E-05           PDIBLC2 = -0.0003509811   LPDIBLC2= 1.421783E-09    
+WPDIBLC2= 3.008671E-10    PPDIBLC2= 1.452196E-15    PDIBLCB = 0.1387533       
+DROUT   = 0               PSCBE1  = 3.510958E+08    LPSCBE1 = -126.0187       
+WPSCBE1 = 78.20322        PPSCBE1 = 8.167206E-05    PSCBE2  = -8.916478E-05   
+LPSCBE2 = 1.00639E-10     WPSCBE2 = 1.634629E-10    PPSCBE2 = -1.824388E-16   
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06         
+BETA0   = 20              KT1     = -0.2903293      LKT1    = -1.294054E-07   
+WKT1    = 8.1231E-09      PKT1    = 1.108733E-13    KT2     = -0.01521824     
+LKT2    = -6.249304E-08   WKT2    = -2.042433E-09   PKT2    = 4.192616E-14    
+AT      = 27385.61        LAT     = -0.008545156    WAT     = -0.006388556    
+PAT     = 7.391559E-09    UTE     = -1.448627       LUTE    = -8.897312E-07   
+WUTE    = 1.432031E-07    PUTE    = 3.723721E-13    UA1     = 2.297519E-09    
+LUA1    = -3.4174E-15     WUA1    = -1.416624E-16   PUA1    = 8.003683E-22    
+UB1     = -3.05281E-18    LUB1    = 2.039652E-24    WUB1    = 3.691152E-25    
+PUB1    = 8.153008E-31    UC1     = -3.353614E-13   LUC1    = 5.56955E-17     
+WUC1    = 1.634585E-17    PUC1    = -4.233348E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.5             NMOS   (                    LMIN    = '7.97E-07-dxl'  
+LMAX    = '1.197E-06-dxl' WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.538233' LVTH0   = 3.213295E-08    WVTH0   = 6.069357E-09    
+PVTH0   = -3.731603E-15   K1      = 0.4151626       LK1     = 1.01901E-07     
+WK1     = 7.181462E-08    PK1     = -7.96368E-14    K2      = 0.07100685      
+LK2     = -4.344361E-08   WK2     = -4.211381E-08   PK2     = 4.131336E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 751694.6        LVSAT   = -0.4888554      
+WVSAT   = -0.3758198      PVSAT   = 2.891316E-07    UA      = 0               
+UB      = 1.454434E-18    LUB     = 2.791962E-25    WUB     = -4.079479E-26   
+PUB     = -4.117488E-31   UC      = 3.686035E-11    LUC     = 1.999337E-17    
+WUC     = -2.349923E-17   PUC     = -1.53783E-23    RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03878254      LU0     = -4.603489E-09   WU0     = -3.8595E-09     
+PU0     = 5.534871E-15    A0      = 2.805783        LA0     = -1.62244E-06    
+WA0     = -1.302039E-06   PA0     = 1.13485E-12     KETA    = 0.03237186      
+LKETA   = -2.678267E-08   WKETA   = -2.012226E-08   PKETA   = 2.524765E-14    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1            
+NFACTOR = 0.7536095       LNFACTOR= 1.173525E-07    WNFACTOR= 7.165022E-08    
+PNFACTOR= -1.111452E-13   CIT     = 0.0002858408    LCIT    = -8.019845E-11   
+WCIT    = -7.23045E-11    PCIT    = 1.362564E-16    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 0.003386452     
+LETA0   = -3.011859E-09   WETA0   = -3.120863E-09   PETA0   = 3.48668E-15     
+ETAB    = 0.0006553425    LETAB   = -6.157948E-10   WETAB   = -7.093076E-10   
+PETAB   = 6.404868E-16    DSUB    = 0               PCLM    = 1.039858        
+LPCLM   = -3.932159E-07   WPCLM   = -6.693219E-07   PPCLM   = 7.744055E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = -0.004204511    LPDIBLC2= 5.880316E-09    
+WPDIBLC2= 3.352205E-09    PPDIBLC2= -2.078201E-15   PDIBLCB = 0.1387533       
+DROUT   = 0               PSCBE1  = 1.062741E+08    LPSCBE1 = 157.24          
+WPSCBE1 = 246.0075        PPSCBE1 = -0.0001124775   PSCBE2  = -5.372212E-06   
+LPSCBE2 = 3.691067E-12    WPSCBE2 = 1.068015E-11    PPSCBE2 = -5.669179E-18   
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06     
+BETA0   = 20              KT1     = -0.821752       LKT1    = 4.854506E-07    
+WKT1    = 4.341452E-07    PKT1    = -3.820343E-13   KT2     = -0.2086612      
+LKT2    = 1.613204E-07    WKT2    = 1.480897E-07    PKT2    = -1.317767E-13   
+AT      = 83867.14        LAT     = -0.07389429     WAT     = -0.06523086     
+PAT     = 7.547211E-08    UTE     = -2.091956       LUTE    = -1.453992E-07   
+WUTE    = 3.727124E-07    PUTE    = 1.068298E-13    UA1     = -5.692394E-10   
+LUA1    = -1.005611E-16   WUA1    = 3.741545E-16    PUA1    = 2.035683E-22    
+UB1     = -6.510533E-19   LUB1    = -7.3918E-25     WUB1    = 3.649467E-25    
+PUB1    = 8.201238E-31    UC1     = 3.935959E-11    LUC1    = 9.768458E-18    
+WUC1    = -3.422121E-17   PUC1    = 1.61726E-23     KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.6             NMOS   (                    LMIN    = 3.5E-07         
+LMAX    = '7.97E-07-dxl'  WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.581882' LVTH0   = -9.092082E-10   WVTH0   = -1.085813E-08   
+PVTH0   = 9.08251E-15     K1      = 0.5856118       LK1     = -2.712899E-08   
+WK1     = -6.459202E-08   PK1     = 2.362301E-14    K2      = 0.03457641      
+LK2     = -1.586577E-08   WK2     = 1.165903E-08    PK2     = 6.073254E-16    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 119025.1        LVSAT   = -0.009924537    
+WVSAT   = -0.002279183    PVSAT   = 6.361378E-09    UA      = -1.414697E-09   
+LUA     = 1.070926E-15    WUA     = 1.789592E-15    PUA     = -1.354721E-21   
+UB      = 2.048355E-18    LUB     = -1.704018E-25   WUB     = -1.108982E-24   
+PUB     = 3.968689E-31    UC      = 2.132472E-11    LUC     = 3.175384E-17    
+WUC     = 3.0532E-18      PUC     = -3.547849E-23   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.02506424      LU0     = 5.781268E-09    WU0     = 1.444899E-08    
+PU0     = -8.324657E-15   A0      = 0.2963715       LA0     = 2.77185E-07     
+WA0     = 3.003911E-07    PA0     = -7.818931E-14   KETA    = -0.05706036     
+LKETA   = 4.091752E-08    WKETA   = 5.114574E-08    PKETA   = -2.870222E-14   
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1416441      
+LVOFF   = 3.152457E-08    WVOFF   = 2.712617E-08    PVOFF   = -2.053451E-14   
+NFACTOR = 1.158405        LNFACTOR= -1.89078E-07    WNFACTOR= -2.038653E-07   
+PNFACTOR= 9.742009E-14    CIT     = 0.000142597     LCIT    = 2.823712E-11    
+WCIT    = -5.740386E-12   PCIT    = 8.586731E-17    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -0.006826099    
+LETA0   = 4.719042E-09    WETA0   = 6.949648E-09    PETA0   = -4.136698E-15   
+ETAB    = 0.0002012202    LETAB   = -2.720243E-10   WETAB   = 2.134844E-10    
+PETAB   = -5.806666E-17   DSUB    = 0               PCLM    = 0.7902654       
+LPCLM   = -2.042742E-07   WPCLM   = -2.306488E-08   PPCLM   = 2.851889E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = 0.005555971     LPDIBLC2= -1.508371E-09   
+WPDIBLC2= -6.859392E-09   PPDIBLC2= 5.65198E-15     PDIBLCB = 0.1326331       
+LPDIBLCB= 4.633002E-09    WPDIBLCB= 1.06301E-07     PPDIBLCB= -8.046988E-14   
+DROUT   = 0               PSCBE1  = 6.472126E+07    LPSCBE1 = 188.6956        
+WPSCBE1 = 317.0544        PPSCBE1 = -0.0001662601   PSCBE2  = -1.062123E-05   
+LPSCBE2 = 7.664572E-12    WPSCBE2 = 1.313919E-11    PPSCBE2 = -7.530675E-18   
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06     
+BETA0   = 20              KT1     = -0.08126103     LKT1    = -7.510103E-08   
+WKT1    = -2.212396E-07   PKT1    = 1.14092E-13     KT2     = 0.01395588      
+LKT2    = -7.20068E-09    WKT2    = -3.15481E-08    PKT2    = 4.209116E-15    
+AT      = -7481.743       LAT     = -0.004743181    WAT     = 0.02481588      
+PAT     = 7.306722E-09    UTE     = -0.807851       LUTE    = -1.117467E-06   
+WUTE    = -9.755286E-07   PUTE    = 1.127448E-12    UA1     = 5.440724E-09    
+LUA1    = -4.650104E-15   WUA1    = -5.629156E-15   PUA1    = 4.748075E-21    
+UB1     = -7.763102E-18   LUB1    = 4.644643E-24    WUB1    = 7.755512E-24    
+PUB1    = -4.774535E-30   UC1     = 2.14897E-11     LUC1    = 2.329596E-17    
+WUC1    = 1.994026E-18    PUC1    = -1.124234E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.7             NMOS   (                    LMIN    = '1.197E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.601548' LVTH0   = -1.420018E-08   WVTH0   = -3.117096E-08   
+PVTH0   = 1.606793E-14    K1      = 0.5489828       LK1     = 2.140216E-08    
+WK1     = -4.4683E-08     PK1     = -9.145492E-15   K2      = 0.01683032      
+LK2     = -1.502104E-08   WK2     = 1.500032E-08    PK2     = 4.866925E-15    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 251867.9        LVSAT   = -0.03728397     
+WVSAT   = 0.001918421     PVSAT   = -3.829173E-08   UA      = -8.141389E-10   
+LUA     = 9.419587E-16    WUA     = 3.785746E-16    PUA     = -4.380108E-22   
+UB      = 2.138028E-18    LUB     = -6.730573E-25   WUB     = -3.717801E-25   
+PUB     = 1.107562E-31    UC      = 2.070568E-11    LUC     = 1.782067E-17    
+WUC     = -2.09673E-18    PUC     = -2.209394E-23   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03098577      LU0     = 5.598194E-09    WU0     = 8.120801E-10    
+PU0     = -8.915489E-16   A0      = 0.558895        LA0     = 5.51956E-07     
+WA0     = 7.500072E-08    PA0     = -9.05398E-14    KETA    = 0.01654126      
+LKETA   = 4.310971E-10    WKETA   = -4.810717E-09   PKETA   = -1.643655E-16   
+A1      = 0               A2      = 0.99            AGS     = 0.02246131      
+LAGS    = -4.912773E-08   B0      = 0               B1      = 0               
+VOFF    = -0.133571       LVOFF   = 3.884161E-08    WVOFF   = 1.067438E-08    
+PVOFF   = -1.235025E-14   NFACTOR = 1.491938        LNFACTOR= -7.725255E-07   
+WNFACTOR= -6.03203E-07    PNFACTOR= 7.004813E-13    CIT     = -0.0006880231   
+LCIT    = 1.056487E-09    WCIT    = 8.673419E-10    PCIT    = -9.594994E-16   
+CDSC    = 0               CDSCB   = 0               CDSCD   = 0               
+ETA0    = 7.050587E-05    LETA0   = 5.980575E-10    WETA0   = 2.705997E-11    
+PETA0   = 4.056988E-17    ETAB    = 2.015653E-05    LETAB   = -4.3476E-10     
+WETAB   = -5.223083E-12   PETAB   = 3.049632E-16    DSUB    = 0               
+PCLM    = 0.1763869       LPCLM   = 4.713191E-07    WPCLM   = -6.187514E-09   
+PPCLM   = 1.235026E-13    PDIBLC1 = 1E-05           PDIBLC2 = 0.000235239     
+LPDIBLC2= 8.00477E-10     WPDIBLC2= -2.06213E-10    PPDIBLC2= 1.989625E-15    
+PDIBLCB = 0.1302587       LPDIBLCB= 1.69553E-07     WPDIBLCB= 7.347864E-09    
+PPDIBLCB= -1.466633E-13   DROUT   = 0               PSCBE1  = 4.230387E+08    
+LPSCBE1 = -59.55318       WPSCBE1 = 15.97266        PPSCBE1 = 2.417935E-05    
+PSCBE2  = 7.643321E-05    LPSCBE2 = -8.721322E-11   WPSCBE2 = 2.022065E-11    
+PPSCBE2 = -1.994661E-17   PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.2E-06         BETA0   = 20              KT1     = -0.2839968      
+LKT1    = -9.79488E-09    WKT1    = 2.645428E-09    PKT1    = 7.410167E-15    
+KT2     = -0.006536828    LKT2    = -3.446636E-08   WKT2    = -9.551853E-09   
+PKT2    = 1.768308E-14    AT      = 8374.999        WAT     = 0.01005563      
+UTE     = -1.233143       LUTE    = -7.322156E-07   WUTE    = -4.319033E-08   
+PUTE    = 2.36121E-13     UA1     = 3.059218E-09    LUA1    = -3.971079E-15   
+WUA1    = -8.005327E-16   PUA1    = 1.279301E-21    UB1     = -3.691174E-18   
+LUB1    = 4.310885E-24    WUB1    = 9.213007E-25    PUB1    = -1.149316E-30   
+UC1     = 2.722772E-11    LUC1    = -3.796761E-18   WUC1    = -7.496219E-18   
+PUC1    = 9.127327E-24    KT1L    = 0               PRT     = 0               
+CJ      = cjn             PB      = 0.6944474       MJ      = 0.3075043       
+CJSW    = cjswn           PBSW    = 0.6944474       MJSW    = 0.1929617       
+CJSWG   = cjswgn          PBSWG   = 0.6944474       MJSWG   = 0.1929617       
+CGDO    = cgon            CGSO    = cgon            CTA     = 0.001047197     
+CTP     = 0.000566277     PTA     = 0.001820458     PTP     = 0.001820458     
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGBO    = 1E-13           CAPMOD  = 0               
+NQSMOD  = 0               XPART   = 1               CF      = 0               
+TLEV    = 1               TLEVC   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.8             NMOS   (                    LMIN    = '7.97E-07-dxl'  
+LMAX    = '1.197E-06-dxl' WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.580674' LVTH0   = 9.951057E-09    WVTH0   = -3.064184E-08   
+PVTH0   = 1.545573E-14    K1      = 0.5715671       LK1     = -4.727854E-09   
+WK1     = -6.347529E-08   PK1     = 1.259718E-14    K2      = -0.01078891     
+LK2     = 1.693441E-08    WK2     = 2.863953E-08    PK2     = -1.091363E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 407330.4        LVSAT   = -0.2171541      
+WVSAT   = -0.07794474     PVSAT   = 5.410996E-08    UA      = 0               
+UB      = 1.52471E-18     LUB     = 3.655192E-26    WUB     = -1.015833E-25   
+PUB     = -2.018614E-31   UC      = 4.816369E-12    LUC     = 3.62046E-17     
+WUC     = 4.218808E-18    PUC     = -2.940101E-23   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03756405      LU0     = -2.012876E-09   WU0     = -2.805499E-09   
+PU0     = 3.29399E-15     A0      = 1.063419        LA0     = -3.177871E-08   
+WA0     = 2.051062E-07    PA0     = -2.410719E-13   KETA    = 0.01210282      
+LKETA   = 5.566369E-09    WKETA   = -2.589539E-09   PKETA   = -2.734268E-15   
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1            
+NFACTOR = 0.6115897       LNFACTOR= 2.460378E-07    WNFACTOR= 1.944973E-07    
+PNFACTOR= -2.224579E-13   CIT     = 0.0003090673    LCIT    = -9.714655E-11   
+WCIT    = -9.239536E-11   PCIT    = 1.509164E-16    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -0.0001063383   
+LETA0   = 8.026663E-10    WETA0   = -9.960004E-11   PETA0   = 1.871155E-16    
+ETAB    = -0.0012046      LETAB   = 9.822833E-10    WETAB   = 8.995427E-10    
+PETAB   = -7.418507E-16   DSUB    = 0               PCLM    = 0.08539463      
+LPCLM   = 5.765971E-07    WPCLM   = 1.56289E-07     PPCLM   = -6.448273E-14   
+PDIBLC1 = 1E-05           PDIBLC2 = -0.009448797    LPDIBLC2= 1.20049E-08     
+WPDIBLC2= 7.888511E-09    PPDIBLC2= -7.375969E-15   PDIBLCB = 0.276804        
+WPDIBLCB= -1.194139E-07   DROUT   = 0               PSCBE1  = 2.095781E+08    
+LPSCBE1 = 187.4206        WPSCBE1 = 156.6495        PPSCBE1 = -0.0001385837   
+PSCBE2  = -4.125244E-06   LPSCBE2 = 5.992901E-12    WPSCBE2 = 9.601517E-12    
+PPSCBE2 = -7.660265E-18   PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.2E-06         BETA0   = 20              KT1     = -0.3272037      
+LKT1    = 4.019558E-08    WKT1    = 6.360941E-09    PKT1    = 3.111318E-15    
+KT2     = -0.04514819     LKT2    = 1.020698E-08    WKT2    = 6.650931E-09    
+PKT2    = -1.063542E-15   AT      = -37929.79       LAT     = 0.05357462      
+WAT     = 0.04012348      PAT     = -3.47885E-08    UTE     = -2.213039       
+LUTE    = 4.015241E-07    WUTE    = 4.77449E-07     PUTE    = -3.662587E-13   
+UA1     = -8.827322E-10   LUA1    = 5.897573E-16    WUA1    = 6.453257E-16    
+PUA1    = -3.935571E-22   UB1     = -3.684595E-19   LUB1    = 4.665043E-25    
+WUB1    = 1.205029E-25    PUB1    = -2.22793E-31    UC1     = 4.688548E-11    
+LUC1    = -2.654079E-17   WUC1    = -4.07311E-17    PUC1    = 4.758009E-23    
+KT1L    = 0               PRT     = 0               CJ      = cjn             
+PB      = 0.6944474       MJ      = 0.3075043       CJSW    = cjswn           
+PBSW    = 0.6944474       MJSW    = 0.1929617       CJSWG   = cjswgn          
+PBSWG   = 0.6944474       MJSWG   = 0.1929617       CGDO    = cgon           
+CGSO    = cgon            CTA     = 0.001047197     CTP     = 0.000566277     
+PTA     = 0.001820458     PTP     = 0.001820458     JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0               TLEV    = 1               
+TLEVC   = 1              
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.9             NMOS   (                    LMIN    = 3.5E-07         
+LMAX    = '7.97E-07-dxl'  WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.577456' LVTH0   = 1.238667E-08    WVTH0   = -5.332265E-09   
+PVTH0   = -3.703616E-15   K1      = 0.5840231       LK1     = -1.415709E-08   
+WK1     = -6.144233E-08   PK1     = 1.105823E-14    K2      = 0.02850773      
+LK2     = -1.281315E-08   WK2     = 1.707761E-08    PK2     = -2.161258E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 125126.5        LVSAT   = -0.00352569     
+WVSAT   = -0.006380474    PVSAT   = -6.420461E-11   UA      = 1.225099E-09    
+LUA     = -9.273998E-16   WUA     = -6.627784E-16   PUA     = 5.017233E-22    
+UB      = 1.06524E-19     LUB     = 1.110118E-24    WUB     = 6.680355E-25    
+PUB     = -7.844627E-31   UC      = 1.761109E-11    LUC     = 2.651899E-17    
+WUC     = 5.35883E-18     PUC     = -3.026401E-23   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04852396      LU0     = -1.030953E-08   WU0     = -7.107835E-09   
+PU0     = 6.550858E-15    A0      = 0.2892057       LA0     = 5.54301E-07     
+WA0     = 3.456886E-07    PA0     = -3.474927E-13   KETA    = 0.01674055      
+LKETA   = 2.05561E-09     WKETA   = -1.499675E-08   PKETA   = 6.657994E-15    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1297969      
+LVOFF   = 2.255623E-08    WVOFF   = 1.612011E-08    PVOFF   = -1.220292E-14   
+NFACTOR = 1.141132        LNFACTOR= -1.548256E-07   WNFACTOR= -1.848065E-07   
+PNFACTOR= 6.4675E-14      CIT     = -0.0001019393   LCIT    = 2.139854E-10    
+WCIT    = 2.21524E-10     PCIT    = -8.672054E-17   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 0.0001026328    
+LETA0   = 6.444751E-10    WETA0   = 6.79325E-10     PETA0   = -4.025308E-16   
+ETAB    = 0.0005188963    LETAB   = -3.224035E-10   WETAB   = -5.460001E-11   
+PETAB   = -1.956468E-17   DSUB    = 0               PCLM    = 1.340405        
+LPCLM   = -3.734459E-07   WPCLM   = -4.989754E-07   PPCLM   = 4.315524E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = 0.002740023     LPDIBLC2= 2.777968E-09    
+WPDIBLC2= -3.936936E-09   PPDIBLC2= 1.575895E-15    PDIBLCB = 0.51734         
+LPDIBLCB= -1.820858E-07   WPDIBLCB= -2.362288E-07   PPDIBLCB= 8.842895E-14    
+DROUT   = 0               PSCBE1  = 4.628136E+08    LPSCBE1 = -4.278615       
+WPSCBE1 = -37.35901       PPSCBE1 = 8.280728E-06    PSCBE2  = 4.650106E-06    
+LPSCBE2 = -6.500404E-13   WPSCBE2 = -5.862572E-13   PPSCBE2 = 5.188126E-20    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06    
+BETA0   = 20              KT1     = -0.4538582      LKT1    = 1.36073E-07     
+WKT1    = 1.148221E-07    PKT1    = -7.899374E-14   KT2     = -0.02915348     
+LKT2    = -1.901013E-09   WKT2    = 4.612973E-09    PKT2    = 4.791922E-16    
+AT      = 24259.64        LAT     = 0.006497228     WAT     = 0.0003441204    
+PAT     = -4.675523E-09   UTE     = -2.433361       LUTE    = 5.683078E-07    
+WUTE    = 5.993189E-07    PUTE    = -4.585141E-13   UA1     = -2.950993E-09   
+LUA1    = 2.15543E-15     WUA1    = 2.231175E-15    PUA1    = -1.594045E-21   
+UB1     = 4.290962E-18    LUB1    = -3.060677E-24   WUB1    = -3.240814E-24   
+PUB1    = 2.321724E-30    UC1     = 8.913981E-11    LUC1    = -5.85273E-17    
+WUC1    = -6.520661E-17   PUC1    = 6.610805E-23    KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.10            NMOS   (                    LMIN    = '1.197E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '1.9995E-5-dxw' WMAX    = 0.0002001       
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.573867' LVTH0   = 2.779985E-08    WVTH0   = 1.834827E-07    
+PVTH0   = -2.537153E-13   K1      = 0.5252168       LK1     = -6.00227E-09    
+WK1     = -8.621311E-08   PK1     = 3.065219E-13    K2      = 0.02639941      
+LK2     = 3.399094E-09    WK2     = 1.982855E-08    PK2     = -1.969619E-13   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 252292.4        LVSAT   = -0.04575563     
+WVSAT   = -0.04035115     PVSAT   = 8.05407E-07     UA      = -7.24405E-10    
+LUA     = 8.381365E-16    WUA     = 1.453881E-14    PUA     = -1.68214E-20    
+UB      = 2.345715E-18    LUB     = -2.226582E-25   WUB     = -1.027581E-23   
+PUB     = 2.484823E-29    UC      = 4.615152E-11    LUC     = 3.857576E-17    
+WUC     = -7.907047E-18   PUC     = 1.263106E-21    RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03919688      LU0     = 7.260739E-09    WU0     = 1.347998E-07    
+PU0     = -8.846608E-14   A0      = 0.5037673       LA0     = 7.85895E-07     
+WA0     = 6.219605E-07    PA0     = -5.15116E-12    KETA    = 0.002817432     
+LKETA   = 1.493325E-09    WKETA   = -1.99574E-07    PKETA   = 4.212874E-13    
+A1      = 0               A2      = 0.99            AGS     = 0.02271348      
+LAGS    = -5.416118E-08   WAGS    = -5.044038E-08   PAGS    = 1.006789E-12    
+B0      = 0               B1      = 0               VOFF    = -0.1189314      
+LVOFF   = 2.319404E-08    WVOFF   = -4.598956E-07   PVOFF   = 2.739907E-13    
+NFACTOR = 1.089922        LNFACTOR= 9.598773E-08    WNFACTOR= -6.85674E-07    
+PNFACTOR= -7.90323E-12    CIT     = -0.0001082044   LCIT    = -1.689717E-10   
+WCIT    = 1.107059E-09    PCIT    = 8.452781E-15    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 7.249157E-05    
+LETA0   = 9.312456E-10    WETA0   = 2.702816E-09    PETA0   = -8.531265E-15   
+ETAB    = 1.006954E-05    LETAB   = -1.165046E-11   WETAB   = 1.091676E-10    
+PETAB   = -1.26307E-16    DSUB    = 0               PCLM    = 0.1835406       
+LPCLM   = 3.285299E-07    WPCLM   = -4.001211E-07   PPCLM   = 7.986417E-12    
+PDIBLC1 = 1E-05           PDIBLC2 = 0.0001414216    LPDIBLC2= 2.353715E-09    
+WPDIBLC2= -5.218425E-09   PPDIBLC2= 1.332865E-14    PDIBLCB = 0.1387533       
+WPDIBLCB= -7.057525E-12   PPDIBLCB= 8.165556E-18    DROUT   = 0               
+PSCBE1  = 4.165804E+08    LPSCBE1 = 95.77778        WPSCBE1 = 1019.492        
+PPSCBE1 = -0.002896602    PSCBE2  = 4.548235E-05    LPSCBE2 = -3.306664E-11   
+WPSCBE2 = 1.979787E-09    PPSCBE2 = -2.581678E-15   PVAG    = 0               
+DELTA   = 0.01            ALPHA0  = 2.2E-06         BETA0   = 20              
+KT1     = -0.2931179      LKT1    = 1.801193E-08    WKT1    = -3.61053E-07    
+PKT1    = 8.219776E-14    KT2     = -0.02856419     LKT2    = 1.112164E-08    
+WKT2    = -2.073161E-07   PKT2    = -2.256764E-13   AT      = 19775.05        
+LAT     = 0.0002602652    WAT     = 0.04499414      PAT     = -5.205822E-08   
+UTE     = -1.521588       LUTE    = -4.869755E-07   WUTE    = -1.113944E-05   
+PUTE    = 4.066578E-13    UA1     = 2.095525E-09    LUA1    = -2.265202E-15   
+WUA1    = -3.674968E-14   PUA1    = -1.292539E-20   UB1     = -2.793395E-18   
+LUB1    = 1.051028E-24    WUB1    = 2.017566E-23    PUB1    = 4.968646E-29    
+UC1     = 1.197262E-11    LUC1    = 5.621364E-18    WUC1    = 6.641072E-17    
+PUC1    = 5.479812E-23    KT1L    = 0               PRT     = 0               
+CJ      = cjn             PB      = 0.6944474       MJ      = 0.3075043       
+CJSW    = cjswn           PBSW    = 0.6944474       MJSW    = 0.1929617       
+CJSWG   = cjswgn          PBSWG   = 0.6944474       MJSWG   = 0.1929617       
+CGDO    = cgon            CGSO    = cgon            CTA     = 0.001047197     
+CTP     = 0.000566277     PTA     = 0.001820458     PTP     = 0.001820458     
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGBO    = 1E-13           CAPMOD  = 0               
+NQSMOD  = 0               XPART   = 1               CF      = 0               
+TLEV    = 1               TLEVC   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.11            NMOS   (                    LMIN    = '7.97E-07-dxl'  
+LMAX    = '1.197E-06-dxl' WMIN    = '1.9995E-5-dxw' WMAX    = 0.0002001       
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.582027' LVTH0   = 1.835915E-08    WVTH0   = -1.578564E-07   
+PVTH0   = 1.412141E-13    K1      = 0.5241717       LK1     = -4.79307E-09    
+WK1     = -2.108335E-07   PK1     = 4.507077E-13    K2      = 0.03641037      
+LK2     = -8.183586E-09   WK2     = -2.060676E-07   PK2     = 6.439987E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 373930.9        LVSAT   = -0.1864914      
+WVSAT   = 1.994608        PVSAT   = -1.54904E-06    UA      = 0               
+UB      = 1.914644E-18    LUB     = 2.760912E-25    WUB     = 2.52184E-23     
+PUB     = -1.621856E-29   UC      = 4.457098E-11    LUC     = 4.040445E-17    
+WUC     = 2.374904E-15    PUC     = -1.493807E-21   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04759424      LU0     = -2.45501E-09    WU0     = 6.7406E-08      
+PU0     = -1.049149E-14   A0      = 1.650302        LA0     = -5.406457E-07   
+WA0     = -4.224581E-06   PA0     = 4.562885E-13    KETA    = 0.01947919      
+LKETA   = -1.778433E-08   WKETA   = 9.212223E-08    PKETA   = 8.379479E-14    
+A1      = 0               A2      = 0.99            AGS     = -0.03185416     
+LAGS    = 8.973608E-09    WAGS    = 2.371074E-06    PAGS    = -1.794903E-12   
+B0      = 0               B1      = 0               VOFF    = -0.09123702     
+LVOFF   = -8.848366E-09   WVOFF   = -1.752774E-06   PVOFF   = 1.769851E-12    
+NFACTOR = 1.222301        LNFACTOR= -5.717442E-08   WNFACTOR= -2.414606E-05   
+PNFACTOR= 1.924044E-11    CIT     = -0.000465483    LCIT    = 2.443997E-10    
+WCIT    = 1.887087E-08    PCIT    = -1.209995E-14   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 0.001006404     
+LETA0   = -1.492916E-10   WETA0   = -1.674689E-08   PETA0   = 1.397204E-14    
+ETAB    = 0.0004207145    LETAB   = -4.867667E-10   WETAB   = -8.443741E-09   
+PETAB   = 9.769408E-15    DSUB    = 0               PCLM    = 1.103208        
+LPCLM   = -7.355258E-07   WPCLM   = -7.092375E-06   PPCLM   = 1.572935E-11    
+PDIBLC1 = 1E-05           PDIBLC2 = -0.0006829988   LPDIBLC2= 3.307569E-09    
+WPDIBLC2= -8.802439E-09   PPDIBLC2= 1.747535E-14    PDIBLCB = 0.165166        
+LPDIBLCB= -3.055946E-08   WPDIBLCB= -5.283063E-06   PPDIBLCB= 6.112504E-12    
+DROUT   = 0               PSCBE1  = 5.782287E+08    LPSCBE1 = -91.24936       
+WPSCBE1 = -2417.312       PPSCBE1 = 0.00107978      PSCBE2  = 2.780112E-05    
+LPSCBE2 = -1.260945E-11   WPSCBE2 = -4.8423E-10     PPSCBE2 = 2.691904E-16    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06     
+BETA0   = 20              KT1     = -0.2967363      LKT1    = 2.21984E-08     
+WKT1    = 2.411989E-06    PKT1    = -3.126211E-12   KT2     = -0.01637687     
+LKT2    = -2.979088E-09   WKT2    = -4.312568E-07   PKT2    = 3.342291E-14    
+AT      = 20000           UTE     = -1.750235       LUTE    = -2.224312E-07   
+WUTE    = -1.806481E-05   PUTE    = 8.419307E-12    UA1     = 1.727004E-09    
+LUA1    = -1.838825E-15   WUA1    = -9.563957E-14   PUA1    = 5.521022E-20    
+UB1     = -3.586383E-18   LUB1    = 1.968516E-24    WUB1    = 1.152073E-22    
+PUB1    = -6.02651E-29    UC1     = 2.534887E-11    LUC1    = -9.854957E-18   
+WUC1    = 3.777932E-17    PUC1    = 8.792466E-23    KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1               
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
*
*
.MODEL N.12            NMOS   (                    LMIN    = 3.5E-07         
+LMAX    = '7.97E-07-dxl'  WMIN    = '1.9995E-5-dxw' WMAX    = 0.0002001       
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn           
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn            XJ      = 1E-07           NCH     = 2.3579E+17      
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 4E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 4E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn+0.594318' LVTH0   = 9.054964E-09    WVTH0   = 3.128072E-07    
+PVTH0   = -2.150783E-13   K1      = 0.4970239       LK1     = 1.575782E-08    
+WK1     = 5.117255E-07    PK1     = -9.626959E-14   K2      = 0.05471195      
+LK2     = -2.203789E-08   WK2     = -1.899347E-07   PK2     = 5.218731E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 146543.8        LVSAT   = -0.01435934     
+WVSAT   = -0.04225456     PVSAT   = -7.135531E-09   UA      = 6.40111E-10     
+LUA     = -4.845641E-16   WUA     = -1.284703E-14   PUA     = 9.725203E-21    
+UB      = 1.66145E-18     LUB     = 4.677592E-25    WUB     = 2.368592E-23    
+PUB     = -1.505848E-29   UC      = 9.845423E-11    LUC     = -3.851641E-19   
+WUC     = 1.175987E-15    PUC     = -5.862264E-22   RDSW    = 750             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.05001819      LU0     = -4.289937E-09   WU0     = -4.332781E-08   
+PU0     = 7.333401E-14    A0      = 1.116024        LA0     = -1.361973E-07   
+WA0     = -7.910137E-06   PA0     = 3.246254E-12    KETA    = 0.0027003       
+LKETA   = -5.082708E-09   WKETA   = -1.948636E-07   PKETA   = 3.010431E-13    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1001952      
+LVOFF   = -2.067061E-09   WVOFF   = 5.116924E-07    PVOFF   = 5.564995E-14    
+NFACTOR = 1.281107        LNFACTOR= -1.016906E-07   WNFACTOR= 1.374192E-06    
+PNFACTOR= -7.839543E-14   CIT     = -0.0003555303   LCIT    = 1.611655E-10    
+WCIT    = 5.612513E-09    PCIT    = -2.063372E-15   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -0.000377821    
+LETA0   = 8.985671E-10    WETA0   = -6.891668E-10   PETA0   = 1.816348E-15    
+ETAB    = 0.0007059512    LETAB   = -7.026909E-10   WETAB   = 4.901367E-09    
+PETAB   = -3.328384E-16   DSUB    = 0               PCLM    = -0.06020734     
+LPCLM   = 1.4518E-07      WPCLM   = 1.706562E-05    PPCLM   = -2.558246E-12   
+PDIBLC1 = 1E-05           PDIBLC2 = 5.951716E-05    LPDIBLC2= 2.745485E-09    
+WPDIBLC2= 2.084231E-09    PPDIBLC2= 9.234147E-15    PDIBLCB = 0.0800342       
+LPDIBLCB= 3.388531E-08    WPDIBLCB= 6.870473E-06    PPDIBLCB= -3.087724E-12   
+DROUT   = 0               PSCBE1  = 4.691208E+08    LPSCBE1 = -8.654633       
+WPSCBE1 = -2440.24        PPSCBE1 = 0.001097138     PSCBE2  = 1.374289E-05    
+LPSCBE2 = -1.967376E-12   WPSCBE2 = -1.997057E-10   PPSCBE2 = 5.380545E-17    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.2E-06     
+BETA0   = 20              KT1     = -0.2643045      LKT1    = -2.352493E-09   
+WKT1    = -3.40949E-06    PKT1    = 1.280649E-12    KT2     = -0.01187656     
+LKT2    = -6.385827E-09   WKT2    = -8.877606E-07   PKT2    = 3.789964E-13    
+AT      = 20972.06        LAT     = -0.0007358537   WAT     = -0.02498623     
+PAT     = 1.891458E-08    UTE     = -2.462943       LUTE    = 3.170886E-07    
+WUTE    = 5.818838E-08    PUTE    = -5.299801E-12   UA1     = -2.466806E-09   
+LUA1    = 1.335891E-15    WUA1    = 3.568011E-15    PUA1    = -1.988993E-20   
+UB1     = 6.30069E-19     LUB1    = -1.223339E-24   WUB1    = 1.37198E-23     
+PUB1    = 1.656091E-29    UC1     = 9.403619E-12    LUC1    = 2.215601E-18    
+WUC1    = 1.852849E-16    PUC1    = -2.373712E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjn             PB      = 0.6944474       
+MJ      = 0.3075043       CJSW    = cjswn           PBSW    = 0.6944474       
+MJSW    = 0.1929617       CJSWG   = cjswgn          PBSWG   = 0.6944474       
+MJSWG   = 0.1929617       CGDO    = cgon            CGSO    = cgon           
+CTA     = 0.001047197     CTP     = 0.000566277     PTA     = 0.001820458     
+PTP     = 0.001820458     JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.1             KF      = 3.5E-24  )
*
**************************************************************************
*
*
***************************************************************
*                                                             *
*                 PMOS DEVICES MODEL                          *
*                                                             *
***************************************************************
*
.MODEL P.1            PMOS   (                     LMIN    = '1.199E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-5-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.6513801' LVTH0   = -7.041346E-08   WVTH0   = -6.868116E-08   
+PVTH0   = 2.112457E-14    K1      = 0.4301105       LK1     = -4.233106E-08   
+WK1     = -6.382339E-08   PK1     = 5.663198E-14    K2      = -3.791622E-04   
+LK2     = -5.64093E-09    WK2     = 1.367555E-08    PK2     = -8.001636E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 9.148285E-10    
+LUA     = -2.526635E-16   WUA     = 1.32059E-16     PUA     = -2.042848E-22   
+UB      = 1.520952E-18    LUB     = 5.160137E-25    WUB     = -1.025485E-24   
+PUB     = 2.010579E-31    UC      = 4.60051E-12     LUC     = -1.509571E-18   
+WUC     = -9.224031E-17   PUC     = 3.026687E-23    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01941626      LU0     = -4.552394E-09   WU0     = -4.565884E-09   
+PU0     = 5.928595E-18    A0      = 0.6047527       LA0     = -4.386268E-07   
+WA0     = 1.892169E-07    PA0     = 1.519625E-13    KETA    = -5.968336E-03   
+LKETA   = -1.711319E-08   WKETA   = 1.898822E-08    PKETA   = 1.051496E-15    
+A1      = 0               A2      = 0.4             AGS     = 0.01929783      
+LAGS    = 7.997678E-10    WAGS    = 1.407844E-08    PAGS    = -1.603534E-14   
+B0      = 0               B1      = 0               VOFF    = -0.1991496      
+LVOFF   = 2.264641E-08    WVOFF   = -4.134478E-08   PVOFF   = 3.034851E-14    
+NFACTOR = 3.10926         LNFACTOR= -2.098221E-06   WNFACTOR= -6.516304E-07   
+PNFACTOR= 1.493544E-12    CIT     = -9.353127E-04   LCIT    = 1.350547E-09    
+WCIT    = 7.807938E-10    PCIT    = -1.120312E-15   CDSC    = 0               
+CDSCB   = -9.267928E-06   LCDSCB  = 1.31997E-10     WCDSCB  = 6.435554E-11    
+PCDSCB  = -2.244948E-16   CDSCD   = 0               ETA0    = 8.166527E-05    
+LETA0   = 1.998305E-09    WETA0   = 1.855227E-11    PETA0   = 1.873977E-15    
+ETAB    = -9.970102E-06   LETAB   = 1.327968E-10    WETAB   = 7.8434E-11      
+PETAB   = -2.405302E-16   DSUB    = 0               PCLM    = 2.431174        
+LPCLM   = -1.322164E-07   WPCLM   = 1.645579E-06    PPCLM   = -2.645587E-12   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.2976698       
+LPDIBLCB= -3.25221E-07    WPDIBLCB= -3.810642E-07   PPDIBLCB= 6.135799E-13    
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09          
+BETA0   = 17              KT1     = -0.5176941      LKT1    = -7.866041E-09   
+WKT1    = 1.375248E-08    PKT1    = 1.051933E-15    KT2     = -0.03957241     
+LKT2    = -2.837307E-09   WKT2    = -2.092037E-08   PKT2    = 2.527762E-14    
+AT      = -5.000000E+04   UTE     = -1.754378       LUTE    = -3.422846E-07   
+WUTE    = 2.241645E-07    PUTE    = 4.203609E-13    UA1     = -3.222323E-10   
+LUA1    = -2.385864E-15   WUA1    = 6.199165E-17    PUA1    = 2.371411E-21    
+UB1     = -2.242744E-18   LUB1    = 2.364685E-24    WUB1    = 8.637241E-25    
+PUB1    = -2.586706E-30   UC1     = -9.696264E-11   LUC1    = 6.573894E-17    
+WUC1    = 7.813872E-17    PUC1    = -9.250906E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )

*
*
*
.MODEL P.2            PMOS   (                     LMIN    = '7.99E-07-dxl'  
+LMAX    = '1.199E-06-dxl' WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-5-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7236359' LVTH0   = 1.188587E-08    WVTH0   = -3.563788E-08   
+PVTH0   = -1.651172E-14   K1      = 0.4030935       LK1     = -1.155868E-08   
+WK1     = -6.240105E-08   PK1     = 5.501194E-14    K2      = -0.01609332     
+LK2     = 1.22575E-08     WK2     = 3.683894E-08    PK2     = -3.438475E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 9.587491E-10    
+LUA     = -3.02689E-16    WUA     = 4.684947E-17    PUA     = -1.072312E-22   
+UB      = 1.741666E-18    LUB     = 2.646203E-25    WUB     = -1.006754E-24   
+PUB     = 1.797234E-31    UC      = 4.480018E-12    LUC     = -1.37233E-18    
+WUC     = -8.982466E-17   PUC     = 2.751545E-23    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01814312      LU0     = -3.102281E-09   WU0     = -5.224401E-09   
+PU0     = 7.55979E-16     A0      = 0.04318645      LA0     = 2.009972E-07    
+WA0     = 8.753368E-07    PA0     = -6.295281E-13   KETA    = -0.02119579     
+LKETA   = 2.308826E-10    WKETA   = 2.39757E-08     PKETA   = -4.629248E-15   
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.2179398      
+LVOFF   = 4.404848E-08    WVOFF   = 1.984488E-08    PVOFF   = -3.934652E-14   
+NFACTOR = -0.2032768      LNFACTOR= 1.674759E-06    WNFACTOR= 1.601357E-06    
+PNFACTOR= -1.072608E-12   CIT     = 1.370423E-03    LCIT    = -1.275686E-09   
+WCIT    = -8.113942E-10   PCIT    = 6.931901E-16    CDSC    = 0               
+CDSCB   = 2.875733E-04    LCDSCB  = -2.061052E-10   WCDSCB  = -4.270329E-10   
+PCDSCB  = 3.351966E-16    CDSCD   = 0               ETA0    = 1.870280E-04    
+LETA0   = 1.878298E-09    WETA0   = 8.714022E-09    PETA0   = -8.030164E-15   
+ETAB    = 9.507772E-05    LETAB   = 1.314734E-11    WETAB   = 9.869246E-11    
+PETAB   = -2.636046E-16   DSUB    = 0               PCLM    = 2.958384        
+LPCLM   = -7.327091E-07   WPCLM   = -3.15439E-06    PPCLM   = 2.821578E-12    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -2.387379E-03   
+LPDIBLCB= 1.654427E-08    WPDIBLCB= 4.488691E-07    PPDIBLCB= -3.317142E-13   
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09          
+BETA0   = 17              KT1     = -0.4767191      LKT1    = -5.453661E-08   
+WKT1    = -2.19848E-08    PKT1    = 4.175669E-14    KT2     = -0.04869701     
+LKT2    = 7.555618E-09    WKT2    = 1.654162E-08    PKT2    = -1.73916E-14    
+AT      = -5.000000E+04   UTE     = -2.097731       LUTE    = 4.879499E-08    
+WUTE    = 7.587786E-07    PUTE    = -1.885647E-13   UA1     = -2.450268E-09   
+LUA1    = 3.796875E-17    WUA1    = 2.812378E-15    PUA1    = -7.612798E-22   
+UB1     = -3.659885E-19   LUB1    = 2.270602E-25    WUB1    = -2.005219E-24   
+PUB1    = 6.8102E-31      UC1     = -4.619384E-11   LUC1    = 7.913262E-18    
+WUC1    = -1.133961E-16   PUC1    = 1.256491E-22    KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.3            PMOS   (                     LMIN    = 3.5E-07         
+LMAX    = '7.99E-07-dxl'  WMIN    = '1.195E-06-dxw' WMAX    = '1.9995E-5-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7083238' LVTH0   = 5.702486E-10    WVTH0   = -6.955032E-08   
+PVTH0   = 8.549586E-15    K1      = 0.3503169       LK1     = 2.744319E-08    
+WK1     = 6.634887E-08    PK1     = -4.013425E-14   K2      = 0.02124495      
+LK2     = -1.533548E-08   WK2     = -3.126555E-08   PK2     = 1.594447E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 235347.8        LVSAT   = 0.01082795      
+WVSAT   = 2.250607E-03    PVSAT   = -1.663199E-09   UA      = 6.017952E-10    
+LUA     = -3.890011E-17   WUA     = -2.3897E-16     PUA     = 1.039894E-22    
+UB      = 1.821831E-18    LUB     = 2.053785E-25    WUB     = -8.344865E-25   
+PUB     = 5.241783E-32    UC      = 8.435171E-12    LUC     = -4.29519E-18    
+WUC     = -6.292176E-17   PUC     = 7.634216E-24    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01572399      LU0     = -1.314548E-09   WU0     = -4.692466E-09   
+PU0     = 3.628788E-16    A0      = -0.2336712      LA0     = 4.05595E-07     
+WA0     = 7.122008E-08    PA0     = -3.528583E-14   KETA    = -0.02581868     
+LKETA   = 3.647198E-09    WKETA   = 2.65287E-08     PKETA   = -6.515916E-15   
+A1      = 0               A2      = 0.4             AGS     = 0.02484829      
+LAGS    = -3.58289E-09    WAGS    = -6.036128E-09   PAGS    = 4.460699E-15    
+B0      = 0               B1      = 0               VOFF    = -0.1653198      
+LVOFF   = 5.162289E-09    WVOFF   = -2.210409E-08   PVOFF   = -8.346232E-15   
+NFACTOR = 1.801705        LNFACTOR= 1.930774E-07    WNFACTOR= 7.320393E-07    
+PNFACTOR= -4.301827E-13   CIT     = -4.030200E-04   LCIT    = 3.488815E-11    
+WCIT    = -1.60237E-10    PCIT    = 2.119849E-16    CDSC    = 0               
+CDSCB   = 1.55233E-05     LCDSCB  = -5.060237E-12   WCDSCB  = 1.802349E-11    
+PCDSCB  = 6.299996E-18    CDSCD   = 0               ETA0    = -1.860824E-03   
+LETA0   = 3.391661E-09    WETA0   = -4.277614E-09   PETA0   = 1.570654E-15    
+ETAB    = 1.938588E-04    LETAB   = -5.985189E-11   WETAB   = -5.942136E-10   
+PETAB   = 2.48453E-16     DSUB    = 0               PCLM    = 2.512761        
+LPCLM   = -4.033931E-07   WPCLM   = 1.24663E-06     PPCLM   = -4.307753E-13   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -0.05626601     
+LPDIBLCB= 5.636058E-08    DROUT   = 0               PSCBE1  = 6.241878E+08    
+PSCBE2  = 1E-20           PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.8E-09         BETA0   = 17              KT1     = -0.5343823      
+LKT1    = -1.192348E-08   WKT1    = 1.754402E-08    PKT1    = 1.254489E-14    
+KT2     = -0.03882675     LKT2    = 2.614917E-10    WKT2    = -1.047777E-08   
+PKT2    = 2.575733E-15    AT      = -9.321041E+04   LAT     = 0.03193249      
+WAT     = 0.09377531      PAT     = -6.929994E-08   UTE     = -2.177431       
+LUTE    = 1.076933E-07    WUTE    = 4.640673E-07    PUTE    = 2.922693E-14    
+UA1     = -3.19879E-09    LUA1    = 5.911268E-16    WUA1    = 2.368376E-15    
+PUA1    = -4.331625E-22   UB1     = 1.074126E-18    LUB1    = -8.371847E-25   
+WUB1    = -2.200782E-24   PUB1    = 8.255414E-31    UC1     = -3.844334E-11   
+LUC1    = 2.185651E-18    WUC1    = 8.16604E-17     PUC1    = -1.849763E-23   
+KT1L    = 0               PRT     = 0               CJ      = cjp             
+PB      = 0.9191281       MJ      = 0.5464087       CJSW    = cjswp           
+PBSW    = 0.9191281       MJSW    = 0.3948903       CJSWG   = cjswgp          
+PBSWG   = 0.9191281       MJSWG   = 0.3948903       CGDO    = cgop            
+CGSO    = cgop            CTA     = 9.472773E-04    CTP     = 6.252666E-04    
+PTA     = 1.277020E-03    PTP     = 1.277020E-03    JS      = 3E-07           
+JSW     = 1E-11           N       = 1               XTI     = 3               
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0               TLEV    = 1               
+TLEVC   = 1              
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.4            PMOS   (                     LMIN    = '1.199E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.666791' LVTH0   = -5.053113E-08   WVTH0   = -4.949461E-08   
+PVTH0   = -3.628922E-15   K1      = 0.4174039       LK1     = -5.379908E-08   
+WK1     = -4.800375E-08   PK1     = 7.090969E-14    K2      = -0.01047718     
+LK2     = 1.196896E-08    WK2     = 2.624758E-08    PK2     = -2.992596E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 9.528931E-10    
+LUA     = -4.277627E-16   WUA     = 8.466864E-17    PUA     = 1.371367E-23    
+UB      = 1.127508E-18    LUB     = 7.592936E-25    WUB     = -5.356468E-25   
+PUB     = -1.018254E-31   UC      = -1.477793E-11   LUC     = -3.105325E-17   
+WUC     = -6.811415E-17   PUC     = 6.704875E-23    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01679029      LU0     = -6.65067E-09    WU0     = -1.296548E-09   
+PU0     = 2.618283E-15    A0      = 0.3166798       LA0     = 2.936205E-07    
+WA0     = 5.478677E-07    PA0     = -7.596854E-13   KETA    = -0.01795503     
+LKETA   = 1.956806E-08    WKETA   = 3.391165E-08    PKETA   = -4.461665E-14   
+A1      = 0               A2      = 0.4             AGS     = 0.05301061      
+LAGS    = -3.759907E-08   WAGS    = -2.789396E-08   PAGS    = 3.177122E-14    
+B0      = 0               B1      = 0               VOFF    = -0.1872713      
+LVOFF   = -9.545361E-09   WVOFF   = -5.613319E-08   PVOFF   = 7.042726E-14    
+NFACTOR = 2.681054        LNFACTOR= -1.270052E-06   WNFACTOR= -1.185141E-07   
+PNFACTOR= 4.624745E-13    CIT     = -5.729762E-04   LCIT    = 1.119407E-09    
+WCIT    = 3.296849E-10    PCIT    = -8.325431E-16   CDSC    = 0               
+CDSCB   = 2.385787E-05    LCDSCB  = -9.935822E-11   WCDSCB  = 2.311393E-11    
+PCDSCB  = 6.354245E-17    CDSCD   = 0               ETA0    = 1.227066E-04    
+LETA0   = 7.312249E-09    WETA0   = -3.254444E-11   PETA0   = -4.741884E-15   
+ETAB    = 2.149487E-03    LETAB   = -2.929492E-09   WETAB   = -2.61009E-09    
+PETAB   = 3.57202E-15     DSUB    = 0               PCLM    = 4.500469        
+LPCLM   = -4.93247E-06    WPCLM   = -9.306924E-07   PPCLM   = 3.330728E-12    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -0.3192797      
+LPDIBLCB= 5.216997E-07    WPDIBLCB= 3.870379E-07    PPDIBLCB= -4.408362E-13   
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09       
+BETA0   = 17              KT1     = -0.5586747      LKT1    = 6.155707E-08    
+WKT1    = 6.477335E-08    PKT1    = -8.537983E-14   KT2     = -0.07780506     
+LKT2    = 5.671172E-08    WKT2    = 2.667927E-08    PKT2    = -4.886091E-14   
+AT      = -4.999996E+04   UTE     = -1.870394       LUTE    = 3.610718E-07    
+WUTE    = 3.686042E-07    PUTE    = -4.553178E-13   UA1     = -1.426259E-09   
+LUA1    = 1.195927E-15    WUA1    = 1.436505E-15    PUA1    = -2.087918E-21   
+UB1     = -1.16334E-18    LUB1    = -1.207493E-24   WUB1    = -4.801341E-25   
+PUB1    = 1.860655E-30    UC1     = -1.559926E-10   LUC1    = 2.976953E-17    
+WUC1    = 1.516311E-16    PUC1    = -4.772715E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.5            PMOS   (                     LMIN    = '7.99E-07-dxl'  
+LMAX    = '1.199E-06-dxl' WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7655621' LVTH0   = 6.196915E-08    WVTH0   = 1.656024E-08    
+PVTH0   = -7.88654E-14    K1      = 0.2105209       LK1     = 1.818407E-07    
+WK1     = 1.773518E-07    PK1     = -1.857703E-13   K2      = 0.04204592      
+LK2     = -4.785485E-08   WK2     = -3.554441E-08   PK2     = 4.045513E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 4.790326E-10    
+LUA     = 1.119644E-16    WUA     = 6.440966E-16    PUA     = -6.234747E-22   
+UB      = 1.507609E-18    LUB     = 3.263585E-25    WUB     = -7.153524E-25   
+PUB     = 1.028593E-31    UC      = -6.68264E-11    LUC     = 2.822996E-17    
+WUC     = -1.048171E-18   PUC     = -9.3394E-24     RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01153818      LU0     = -6.685131E-10   WU0     = 2.99875E-09     
+PU0     = -2.274062E-15   A0      = 1.160004        LA0     = -6.669264E-07   
+WA0     = -5.151016E-07   PA0     = 4.510368E-13    KETA    = 0.01286604      
+LKETA   = -1.553715E-08   WKETA   = -1.843129E-08   PKETA   = 1.500196E-14    
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.2216156      
+LVOFF   = 2.957277E-08    WVOFF   = 2.442126E-08    PVOFF   = -2.132426E-14   
+NFACTOR = -1.302432       LNFACTOR= 3.26714E-06     WNFACTOR= 2.969806E-06    
+PNFACTOR= -3.055122E-12   CIT     = 3.049794E-03    LCIT    = -3.006929E-09   
+WCIT    = -2.902212E-09   PCIT    = 2.848588E-15    CDSC    = 0               
+CDSCB   = -2.358852E-04   LCDSCB  = 1.964892E-10    WCDSCB  = 2.24673E-10     
+PCDSCB  = -1.660333E-16   CDSCD   = 0               ETA0    = 0.01873395      
+LETA0   = -1.388595E-08   WETA0   = -1.437689E-08   PETA0   = 1.159633E-14    
+ETAB    = 1.704914E-04    LETAB   = -6.754173E-10   WETAB   = 4.802349E-12    
+PETAB   = 5.936583E-16    DSUB    = 0               PCLM    = -5.071835       
+LPCLM   = 5.970383E-06    WPCLM   = 6.843233E-06    PPCLM   = -5.523773E-12   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.35815         
+LPDIBLCB= -2.498928E-07   DROUT   = 0               PSCBE1  = 6.241878E+08    
+PSCBE2  = 1E-20           PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.8E-09         BETA0   = 17              KT1     = -0.5148277      
+LKT1    = 1.161531E-08    WKT1    = 2.546046E-08    PKT1    = -4.060245E-14   
+KT2     = -1.325530E-03   LKT2    = -3.039848E-08   WKT2    = -4.243588E-08   
+PKT2    = 2.986125E-14    AT      = -5.000000E+04   UTE     = -1.515141       
+LUTE    = -4.356054E-08   WUTE    = 3.345429E-08    PUTE    = -7.358207E-14   
+UA1     = -6.494968E-11   LUA1    = -3.546054E-16   WUA1    = -1.573428E-16   
+PUA1    = -2.72525E-22    UB1     = -2.365515E-18   LUB1    = 1.617844E-25    
+WUB1    = 4.841915E-25    PUB1    = 7.622884E-31    UC1     = -3.492116E-10   
+LUC1    = 2.49846E-16     WUC1    = 2.638611E-16    PUC1    = -1.755572E-22   
+KT1L    = 0               PRT     = 0               CJ      = cjp             
+PB      = 0.9191281       MJ      = 0.5464087       CJSW    = cjswp           
+PBSW    = 0.9191281       MJSW    = 0.3948903       CJSWG   = cjswgp          
+PBSWG   = 0.9191281       MJSWG   = 0.3948903       CGDO    = cgop            
+CGSO    = cgop            CTA     = 9.472773E-04    CTP     = 6.252666E-04    
+PTA     = 1.277020E-03    PTP     = 1.277020E-03    JS      = 3E-07           
+JSW     = 1E-11           N       = 1               XTI     = 3               
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0               TLEV    = 1               
+TLEVC   = 1              
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.6            PMOS   (                     LMIN    = 3.5E-07         
+LMAX    = '7.99E-07-dxl'  WMIN    = '7.95E-07-dxw'  WMAX    = '1.195E-06-dxw' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.6649748' LVTH0   = -1.236481E-08   WVTH0   = -1.235198E-07   
+PVTH0   = 2.465373E-14    K1      = 0.5082586       LK1     = -3.818744E-08   
+WK1     = -1.302885E-07   PK1     = 4.157589E-14    K2      = -0.02686819     
+LK2     = 3.072672E-09    WK2     = 2.863531E-08    PK2     = -6.973683E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 202406.8        LVSAT   = 0.0351714       
+WVSAT   = 0.04326226      PVSAT   = -3.197081E-08   UA      = 5.196156E-10    
+LUA     = 8.197351E-17    WUA     = -1.366564E-16   PUA     = -4.64983E-23    
+UB      = 1.755311E-18    LUB     = 1.433068E-25    WUB     = -7.516689E-25   
+PUB     = 1.296972E-31    UC      = -2.322437E-11   LUC     = -3.991936E-18   
+WUC     = -2.350563E-17   PUC     = 7.256664E-24    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01214334      LU0     = -1.115728E-09   WU0     = -2.345509E-10   
+PU0     = 1.153472E-16    A0      = -1.265914       LA0     = 1.125828E-06    
+WA0     = 1.356363E-06    PA0     = -9.319761E-13   KETA    = -0.01205414     
+LKETA   = 2.878868E-09    WKETA   = 9.391852E-09    PKETA   = -5.559344E-15   
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.1682528      
+LVOFF   = -9.862306E-09   WVOFF   = -1.845242E-08   PVOFF   = 1.035939E-14    
+NFACTOR = 3.58567         LNFACTOR= -3.451682E-07   WNFACTOR= -1.488997E-06   
+PNFACTOR= 2.399331E-13    CIT     = -1.733597E-03   LCIT    = 5.279971E-10    
+WCIT    = 1.496332E-09    PCIT    = -4.019357E-16   CDSC    = 0               
+CDSCB   = 3E-05           CDSCD   = 0               ETA0    = -0.01464594     
+LETA0   = 1.078179E-08    WETA0   = 1.163986E-08    PETA0   = -7.630052E-15   
+ETAB    = -1.880646E-03   LETAB   = 8.403732E-10    WETAB   = 1.988545E-09    
+PETAB   = -8.723272E-16   DSUB    = 0               PCLM    = 5.479518        
+LPCLM   = -1.827065E-06   WPCLM   = -2.446983E-06   PPCLM   = 1.341696E-12    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -0.05626602     
+LPDIBLCB= 5.636058E-08    DROUT   = 0               PSCBE1  = 6.241878E+08    
+PSCBE2  = 1E-20           PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.8E-09         BETA0   = 17              KT1     = -0.4592181      
+LKT1    = -2.948019E-08   WKT1    = -7.60354E-08    PKT1    = 3.440299E-14    
+KT2     = -0.04283196     LKT2    = 2.747764E-10    WKT2    = -5.49128E-09    
+PKT2    = 2.559193E-15    AT      = -1.788888E+04   LAT     = -0.02373011     
+UTE     = -1.664444       LUTE    = 6.677418E-08    WUTE    = -1.746017E-07   
+PUTE    = 8.01713E-14     UA1     = -2.441263E-10   LUA1    = -2.221939E-16   
+WUA1    = -1.31018E-15    PUA1    = 5.794217E-22    UB1     = -3.088902E-18   
+LUB1    = 6.963671E-25    WUB1    = 2.982187E-24    PUB1    = -1.08373E-30    
+UC1     = 3.884505E-11    LUC1    = -3.692786E-17   WUC1    = -1.456364E-17   
+PUC1    = 3.019869E-23    KT1L    = 0               PRT     = 0               
+CJ      = cjp             PB      = 0.9191281       MJ      = 0.5464087       
+CJSW    = cjswp           PBSW    = 0.9191281       MJSW    = 0.3948903       
+CJSWG   = cjswgp          PBSWG   = 0.9191281       MJSWG   = 0.3948903       
+CGDO    = cgop            CGSO    = cgop            CTA     = 9.472773E-04    
+CTP     = 6.252666E-04    PTA     = 1.277020E-03    PTP     = 1.277020E-03    
+JS      = 3E-07           JSW     = 1E-11           N       = 1               
+XTI     = 3               CGBO    = 1E-13           CAPMOD  = 0               
+NQSMOD  = 0               XPART   = 1               CF      = 0               
+TLEV    = 1               TLEVC   = 1              
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.7            PMOS   (                     LMIN    = '1.199E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.6762015' LVTH0   = -1.366915E-07   WVTH0   = -4.154271E-08   
+PVTH0   = 6.917658E-14    K1      = 0.3439533       LK1     = 8.226023E-08    
+WK1     = 1.406206E-08    PK1     = -4.406043E-14   K2      = 0.01749343      
+LK2     = -4.888215E-08   WK2     = 2.612413E-09    PK2     = 2.149324E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 1.096009E-09    
+LUA     = -3.417385E-16   WUA     = -3.626449E-17   PUA     = -5.89768E-23    
+UB      = 6.299325E-19    LUB     = 8.66971E-25     WUB     = -1.151958E-25   
+PUB     = -1.928129E-31   UC      = -1.158513E-10   LUC     = 8.94311E-17     
+WUC     = 1.729281E-17    PUC     = -3.476052E-23   RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01486982      LU0     = -3.658191E-09   WU0     = 3.262508E-10    
+PU0     = 8.963785E-17    A0      = 1.063027        LA0     = -1.010734E-06   
+WA0     = -8.279539E-08   PA0     = 3.424944E-13    KETA    = 0.04311984      
+LKETA   = -6.239166E-08   WKETA   = -1.769661E-08   PKETA   = 2.46393E-14     
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.2367503      
+LVOFF   = 6.854991E-08    WVOFF   = -1.432343E-08   PVOFF   = 4.436759E-15    
+NFACTOR = 3.379301        LNFACTOR= -2.534289E-06   WNFACTOR= -7.085325E-07   
+PNFACTOR= 1.530755E-12    CIT     = -1.257443E-03   LCIT    = 1.846937E-09    
+WCIT    = 9.080596E-10    PCIT    = -1.447306E-15   CDSC    = 0               
+CDSCB   = 7.615754E-05    LCDSCB  = -7.791618E-11   WCDSCB  = -2.107929E-11   
+PCDSCB  = 4.542393E-17    CDSCD   = 0               ETA0    = -1.088331E-04   
+LETA0   = 2.296046E-09    WETA0   = 1.631067E-10    PETA0   = -5.031917E-16   
+ETAB    = -2.014780E-03   LETAB   = 2.459278E-09    WETAB   = 9.087159E-10    
+PETAB   = -9.814909E-16   DSUB    = 0               PCLM    = 3.791909        
+LPCLM   = -1.074061E-06   WPCLM   = -3.319589E-07   PPCLM   = 7.037302E-14    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.2708664       
+WPDIBLCB= -1.116355E-07   DROUT   = 0               PSCBE1  = 6.241878E+08    
+PSCBE2  = 1E-20           PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 2.8E-09         BETA0   = 17              KT1     = -0.4768497      
+LKT1    = -5.384444E-08   WKT1    = -4.368805E-09   PKT1    = 1.213444E-14    
+KT2     = -0.02538647     LKT2    = -1.498147E-08   WKT2    = -1.761444E-08   
+PKT2    = 1.171983E-14    AT      = -5.000000E+04   UTE     = -1.483223       
+LUTE    = -3.844489E-07   WUTE    = 4.144479E-08    PUTE    = 1.746471E-13    
+UA1     = 1.477496E-10    LUA1    = -1.783817E-15   WUA1    = 1.064678E-16    
+PUA1    = 4.29965E-22     UB1     = -1.793744E-18   LUB1    = 7.22594E-25     
+WUB1    = 5.255708E-26    PUB1    = 2.29732E-31     UC1     = 5.854932E-11    
+LUC1    = -1.173732E-16   WUC1    = -2.965689E-17   PUC1    = 7.660845E-23    
+KT1L    = 0               PRT     = 0               CJ      = cjp             
+PB      = 0.9191281       MJ      = 0.5464087       CJSW    = cjswp           
+PBSW    = 0.9191281       MJSW    = 0.3948903       CJSWG   = cjswgp          
+PBSWG   = 0.9191281       MJSWG   = 0.3948903       CGDO    = cgop            
+CGSO    = cgop            CTA     = 9.472773E-04    CTP     = 6.252666E-04    
+PTA     = 1.277020E-03    PTP     = 1.277020E-03    JS      = 3E-07           
+JSW     = 1E-11           N       = 1               XTI     = 3               
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0               TLEV    = 1               
+TLEVC   = 1              
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.8            PMOS   (                     LMIN    = '7.99E-07-dxl'  
+LMAX    = '1.199E-06-dxl' WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7320685' LVTH0   = -7.305903E-08   WVTH0   = -1.174186E-08   
+PVTH0   = 3.523341E-14    K1      = 0.5245929       LK1     = -1.234883E-07   
+WK1     = -8.803906E-08   PK1     = 7.223273E-14    K2      = -0.05208094     
+LK2     = 3.036305E-08    WK2     = 4.399278E-08    PK2     = -2.5639E-14     
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 1.73127E-09     
+LUA     = -1.065301E-15   WUA     = -4.140443E-16   PUA     = 3.713143E-22    
+UB      = 7.538392E-19    LUB     = 7.258413E-25    WUB     = -7.841723E-26   
+PUB     = -2.347037E-31   UC      = -3.843826E-11   LUC     = 1.257687E-18    
+WUC     = -2.503615E-17   PUC     = 1.345217E-23    RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01687528      LU0     = -5.942406E-09   WU0     = -1.511098E-09   
+PU0     = 2.182378E-15    A0      = 0.4245178       LA0     = -2.834728E-07   
+WA0     = 1.063845E-07    PA0     = 1.270185E-13    KETA    = -0.02054646     
+LKETA   = 1.012425E-08    WKETA   = 9.802274E-09    PKETA   = -6.681924E-15   
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.1640563      
+LVOFF   = -1.424855E-08   WVOFF   = -2.421632E-08   PVOFF   = 1.570476E-14    
+NFACTOR = 0.7755817       LNFACTOR= 4.313464E-07    WNFACTOR= 1.213884E-06    
+PNFACTOR= -6.588772E-13   CIT     = 5.088009E-04    LCIT    = -1.648152E-10   
+WCIT    = -7.550725E-10   PCIT    = 4.470017E-16    CDSC    = 0               
+CDSCB   = -1.280343E-05   LCDSCB  = 2.341036E-11    WCDSCB  = 3.61689E-11     
+PCDSCB  = -1.978175E-17   CDSCD   = 0               ETA0    = 3.214265E-03    
+LETA0   = -1.488963E-09   WETA0   = -1.262764E-09   PETA0   = 1.120875E-15    
+ETAB    = -1.525974E-04   LETAB   = 3.382515E-10    WETAB   = 2.778124E-10    
+PETAB   = -2.628917E-16   DSUB    = 0               PCLM    = 3.862332        
+LPCLM   = -1.154273E-06   WPCLM   = -7.061373E-07   PPCLM   = 4.96562E-13     
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.9784209       
+LPDIBLCB= -8.059044E-07   WPDIBLCB= -5.241288E-07   PPDIBLCB= 4.698298E-13    
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09        
+BETA0   = 17              KT1     = -0.5449271      LKT1    = 2.369574E-08    
+WKT1    = 5.089446E-08    PKT1    = -5.081042E-14   KT2     = -0.04503044     
+LKT2    = 7.393012E-09    WKT2    = -5.505232E-09   PKT2    = -2.072552E-15   
+AT      = -5.000000E+04   UTE     = -1.921221       LUTE    = 1.144313E-07    
+WUTE    = 3.765917E-07    PUTE    = -2.070852E-13   UA1     = -1.65495E-09    
+LUA1    = 2.694583E-16    WUA1    = 1.186208E-15    PUA1    = -7.998589E-22   
+UB1     = -1.697182E-18   LUB1    = 6.126101E-25    WUB1    = -8.054973E-26   
+PUB1    = 3.813407E-31    UC1     = -1.630471E-10   LUC1    = 1.350252E-16    
+WUC1    = 1.065521E-16    PUC1    = -7.853358E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.9            PMOS   (                     LMIN    = 3.5E-07         
+LMAX    = '7.99E-07-dxl'  WMIN    = 4E-07           WMAX    = '7.95E-07-dxw'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.8852502' LVTH0   = 4.014224E-08    WVTH0   = 6.102673E-08    
+PVTH0   = -1.854257E-14   K1      = 0.3389747       LK1     = 1.368352E-08    
+WK1     = 1.317562E-08    PK1     = -2.5649E-15     K2      = -8.711630E-03   
+LK2     = -1.686867E-09   WK2     = 1.336238E-08    PK2     = -3.003133E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 7.258143E-11    
+LUA     = 1.604701E-16    WUA     = 2.338773E-16    PUA     = -1.074996E-22   
+UB      = 1.145646E-18    LUB     = 4.362957E-25    WUB     = -2.198917E-25   
+PUB     = -1.30154E-31    UC      = -5.516891E-11   LUC     = 1.362163E-17    
+WUC     = 4.679544E-18    PUC     = -8.507722E-24   RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 9.849874E-03    LU0     = -7.506338E-10   WU0     = 1.661086E-09    
+PU0     = -1.618664E-16   A0      = 0.07226853      LA0     = -2.316054E-08   
+WA0     = 1.171892E-07    PA0     = 1.190338E-13    KETA    = -4.236205E-04   
+LKETA   = -4.746528E-09   WKETA   = -1.042399E-09   PKETA   = 1.332288E-15    
+A1      = 0               A2      = 0.4             AGS     = -0.01449463     
+LAGS    = 2.549153E-08    WAGS    = 3.135561E-08    PAGS    = -2.317179E-14   
+B0      = 0               B1      = 0               VOFF    = -0.1805995      
+LVOFF   = -2.023139E-09   WVOFF   = -7.41205E-09    PVOFF   = 3.286404E-15    
+NFACTOR = 1.548983        LNFACTOR= -1.401972E-07   WNFACTOR= 1.774425E-07    
+PNFACTOR= 1.070531E-13    CIT     = 3.696524E-04    LCIT    = -6.198449E-11   
+WCIT    = -2.783744E-10   PCIT    = 9.472185E-17    CDSC    = 0               
+CDSCB   = -1.41407E-05    LCDSCB  = 2.43986E-11     WCDSCB  = 3.895462E-11    
+PCDSCB  = -2.18404E-17    CDSCD   = 0               ETA0    = -1.863328E-03   
+LETA0   = 2.263377E-09    WETA0   = 1.524375E-10    PETA0   = 7.50414E-17     
+ETAB    = 5.739766E-04    LETAB   = -1.986866E-10   WETAB   = -1.32498E-10    
+PETAB   = 4.032765E-17    DSUB    = 0               PCLM    = 2.717527        
+LPCLM   = -3.082627E-07   WPCLM   = -1.061736E-08   PPCLM   = -1.742706E-14   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -0.3756339      
+LPDIBLCB= 1.947418E-07    WPDIBLCB= 2.7642E-07      PPDIBLCB= -1.217757E-13   
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09         
+BETA0   = 17              KT1     = -0.5186143      LKT1    = 4.250602E-09    
+WKT1    = -2.348964E-08   PKT1    = 4.159425E-15    KT2     = -0.03107507     
+LKT2    = -2.92001E-09    WKT2    = -1.539699E-08   PKT2    = 5.237457E-15    
+AT      = 7.697134E+04    LAT     = -0.09383181     WAT     = -0.08622794     
+PAT     = 6.372243E-08    UTE     = -2.012332       LUTE    = 1.817625E-07    
+WUTE    = 1.214188E-07    PUTE    = -1.851242E-14   UA1     = -1.725359E-09   
+LUA1    = 3.214906E-16    WUA1    = -4.209612E-17   PUA1    = 1.078577E-22    
+UB1     = -3.919602E-19   LUB1    = -3.519488E-25   WUB1    = 6.650284E-25    
+PUB1    = -1.696416E-31   UC1     = 4.746167E-12    LUC1    = 1.102594E-17    
+WUC1    = 1.966845E-17    PUC1    = -1.432657E-23   KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.10           PMOS   (                     LMIN    = '1.199E-06-dxl' 
+LMAX    = 2.001E-05       WMIN    = '1.9995E-5-dxw' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.6517398' LVTH0   = -6.675384E-08   WVTH0   = -6.146789E-08   
+PVTH0   = -5.225065E-14   K1      = 0.3736002       LK1     = 9.737321E-09    
+WK1     = 1.069208E-06    PK1     = -9.873389E-13   K2      = 4.447805E-03    
+LK2     = -4.431514E-09   WK2     = -8.310516E-08   PK2     = -3.225042E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 1.399587E-09    
+LUA     = -8.32199E-16    WUA     = -9.587352E-15   PUA     = 1.14154E-20     
+UB      = 5.984871E-19    LUB     = 1.593613E-24    WUB     = 1.746993E-23    
+PUB     = -2.140481E-29   UC      = -5.986922E-11   LUC     = 5.696725E-17    
+WUC     = 1.200378E-15    PUC     = -1.142193E-21   RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.02014925      LU0     = -5.186171E-09   WU0     = -1.926214E-08   
+PU0     = 1.271317E-14    A0      = 0.5840189       LA0     = -3.475058E-07   
+WA0     = 6.049281E-07    PA0     = -1.675014E-12   KETA    = -3.613684E-03   
+LKETA   = -1.866401E-08   WKETA   = -2.822258E-08   PKETA   = 3.214554E-14    
+A1      = 0               A2      = 0.4             AGS     = 0.03178751      
+LAGS    = -1.342598E-08   WAGS    = -2.363396E-07   PAGS    = 2.691909E-13    
+B0      = 0               B1      = 0               VOFF    = -0.2261333      
+LVOFF   = 7.786399E-08    WVOFF   = 4.996795E-07    PVOFF   = -1.076764E-12   
+NFACTOR = 3.036856        LNFACTOR= 1.011371E-06    WNFACTOR= 8.000794E-07    
+PNFACTOR= -6.085377E-11   CIT     = -8.659673E-04   LCIT    = -1.044833E-09   
+WCIT    = -6.09584E-10    PCIT    = 4.690705E-14    CDSC    = 0               
+CDSCB   = 1.754678E-04    LCDSCB  = -1.745713E-10   WCDSCB  = -3.639597E-09   
+PCDSCB  = 5.922201E-15    CDSCD   = 0               ETA0    = 8.121895E-05    
+LETA0   = 2.800041E-09    WETA0   = 2.750366E-11    PETA0   = -1.420083E-14   
+ETAB    = 4.109188E-05    LETAB   = 6.709634E-11    WETAB   = -9.453589E-10   
+PETAB   = 1.076764E-15    DSUB    = 0               PCLM    = 5.479069        
+LPCLM   = -3.998361E-06   WPCLM   = -5.946471E-05   PPCLM   = 7.487061E-11    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -8.820313E-03   
+LPDIBLCB= 3.282635E-08    WPDIBLCB= 5.764063E-06    PPDIBLCB= -6.565268E-12   
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09         
+BETA0   = 17              KT1     = -0.4968152      LKT1    = -6.916913E-08   
+WKT1    = -4.048684E-07   PKT1    = 1.230179E-12    KT2     = -0.0655138      
+LKT2    = 2.273131E-08    WKT2    = 4.992044E-07    PKT2    = -4.873731E-13   
+AT      = -1.516722E+04   LAT     = 0.4135202       WAT     = -0.6983969      
+PAT     = -8.291081E-06   UTE     = -1.720842       LUTE    = -4.562494E-07   
+WUTE    = -4.482311E-07   PUTE    = 2.705356E-12    UA1     = -1.211619E-09   
+LUA1    = -1.251056E-15   WUA1    = 1.789421E-14    PUA1    = -2.03815E-20    
+UB1     = 7.930618E-20    LUB1    = -6.676471E-25   WUB1    = -4.569339E-23   
+PUB1    = 5.821155E-29    UC1     = 4.278501E-11    LUC1    = -4.373199E-17   
+WUC1    = -2.723802E-15   PUC1    = 2.102383E-21    KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.11           PMOS   (                     LMIN    = '7.99E-07-dxl'  
+LMAX    = '1.199E-06-dxl' WMIN    = '1.9995E-5-dxw' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7101686' LVTH0   = -2.035045E-10   WVTH0   = -3.056566E-07   
+PVTH0   = 2.258802E-13    K1      = 0.3712419       LK1     = 1.242337E-08    
+WK1     = 5.762225E-07    PK1     = -4.258284E-13   K2      = 3.641746E-03    
+LK2     = -3.513412E-09   WK2     = -3.588493E-07   PK2     = 2.818221E-13    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 250000          UA      = 8.99314E-10     
+LUA     = -2.623879E-16   WUA     = 1.238522E-15    PUA     = -9.152681E-22   
+UB      = 1.879304E-18    LUB     = 1.347624E-25    WUB     = -3.766404E-24   
+PUB     = 2.783372E-30    UC      = -2.805946E-11   LUC     = 2.073594E-17    
+WUC     = 5.625922E-16    PUC     = -4.157557E-22   RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01903298      LU0     = -3.91474E-09    WU0     = -2.306603E-08   
+PU0     = 1.704579E-14    A0      = 0.2097866       LA0     = 7.874479E-08    
+WA0     = -2.465E-06      PA0     = 1.821635E-12    KETA    = 5.334825E-04    
+LKETA   = -2.338764E-08   WKETA   = -4.116963E-07   PKETA   = 4.689221E-13    
+A1      = 0               A2      = 0.4             AGS     = 0.02            
+B0      = 0               B1      = 0               VOFF    = -0.1536546      
+LVOFF   = -4.68922E-09    WVOFF   = -1.269073E-06   PVOFF   = 9.378445E-13    
+NFACTOR = 7.350716        LNFACTOR= -3.902115E-06   WNFACTOR= -1.498562E-04   
+PNFACTOR= 1.107437E-10    CIT     = -4.432232E-03   LCIT    = 3.017143E-09    
+WCIT    = 1.155319E-07    PCIT    = -8.537803E-14   CDSC    = 0               
+CDSCB   = -3.739268E-05   LCDSCB  = 6.787675E-11    WCDSCB  = 6.088537E-09    
+PCDSCB  = -5.158143E-15   CDSCD   = 0               ETA0    = 1.567071E-03    
+LETA0   = 1.107655E-09    WETA0   = -1.895589E-08   PETA0   = 7.421262E-15    
+ETAB    = -1.053348E-04   LETAB   = 2.338763E-10    WETAB   = 4.116963E-09    
+PETAB   = -4.689221E-15   DSUB    = 0               PCLM    = 2.321416        
+LPCLM   = -4.017942E-07   WPCLM   = 9.616843E-06    PPCLM   = -3.813276E-12   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.02            
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09       
+BETA0   = 17              KT1     = -0.5737051      LKT1    = 1.840836E-08    
+WKT1    = 1.922585E-06    PKT1    = -1.42079E-12    KT2     = -0.03751024     
+LKT2    = -9.164743E-09   WKT2    = -2.077534E-07   PKT2    = 3.178517E-13    
+AT      = 1082987         LAT     = -0.8372773      WAT     = -22.71639       
+PAT     = 1.678741E-05    UTE     = -2.333556       LUTE    = 2.416313E-07    
+WUTE    = 5.487053E-06    PUTE    = -4.054932E-12   UA1     = -2.31E-09       
+UB1     = -1.234925E-18   LUB1    = 8.292625E-25    WUB1    = 1.541697E-23    
+PUB1    = -1.139314E-29   UC1     = 7.284215E-11    LUC1    = -7.796708E-17   
+WUC1    = -2.500067E-15   PUC1    = 1.84755E-21     KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
*
*
.MODEL P.12           PMOS   (                     LMIN    = 3.5E-07         
+LMAX    = '7.99E-07-dxl'  WMIN    = '1.9995E-5-dxw' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifp           
+RSH     = 2.6             RD      = 0               RS      = 0               
+TOX     = toxp            XJ      = 1E-07           NCH     = 8.52E+16        
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 5E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 5E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '4E-08+dxl'     
+XW      = '1.5E-07+dxw'   DWG     = 0               DWB     = 0               
+VTH0    = 'dvtp-0.7099461' LVTH0   = -3.679473E-10   WVTH0   = -3.702353E-08   
+PVTH0   = 2.736038E-14    K1      = 0.3590118       LK1     = 2.146146E-08    
+WK1     = -1.079831E-07   PK1     = 7.97995E-14     K2      = 0.01803527      
+LK2     = -1.415023E-08   WK2     = 3.308856E-08    PK2     = -7.819903E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 215931.1        LVSAT   = 0.02517691      
+WVSAT   = 0.3915562       PVSAT   = -2.8936E-07     UA      = 5.803746E-10    
+LUA     = -2.669176E-17   WUA     = 1.905119E-16    PUA     = -1.407882E-22   
+UB      = 1.603581E-18    LUB     = 3.385218E-25    WUB     = 3.541414E-24    
+PUB     = -2.617105E-30   UC      = -1.143557E-11   LUC     = 8.450887E-18    
+WUC     = 3.354867E-16    PUC     = -2.479246E-22   RDSW    = 900             
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.01544599      LU0     = -1.263956E-09   WU0     = 8.815778E-10    
+PU0     = -6.514881E-16   A0      = 0.02325107      LA0     = 2.165946E-07    
+WA0     = -5.080071E-06   PA0     = 3.754172E-12    KETA    = -0.04803102     
+LKETA   = 1.250153E-08    WKETA   = 4.718861E-07    PKETA   = -1.840453E-13   
+A1      = 0               A2      = 0.4             AGS     = 0.01949334      
+LAGS    = 3.744171E-10    WAGS    = 1.013306E-07    PAGS    = -7.488332E-14   
+B0      = 0               B1      = 0               VOFF    = -0.1521466      
+LVOFF   = -5.803627E-09   WVOFF   = -2.862252E-07   PVOFF   = 2.115204E-13    
+NFACTOR = 1.792873        LNFACTOR= 2.051303E-07    WNFACTOR= 9.091262E-07    
+PNFACTOR= -6.718439E-13   CIT     = -3.285914E-04   LCIT    = -1.544779E-11   
+WCIT    = -1.652531E-09   PCIT    = 1.221221E-15    CDSC    = 0               
+CDSCB   = 8.229237E-05    LCDSCB  = -2.057049E-11   WCDSCB  = -1.320696E-09   
+PCDSCB  = 3.172806E-16    CDSCD   = 0               ETA0    = -1.371559E-03   
+LETA0   = 3.279303E-09    WETA0   = -1.408739E-08   PETA0   = 3.823447E-15    
+ETAB    = 4.894977E-04    LETAB   = -2.057049E-10   WETAB   = -6.521775E-09   
+PETAB   = 3.172806E-15    DSUB    = 0               PCLM    = 2.320368        
+LPCLM   = -4.010201E-07   WPCLM   = 5.104095E-06    PPCLM   = -4.783543E-13   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.02849755      
+LPDIBLCB= -6.279691E-09   WPDIBLCB= -1.69951E-06    PPDIBLCB= 1.255937E-12    
+DROUT   = 0               PSCBE1  = 6.241878E+08    PSCBE2  = 1E-20           
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 2.8E-09        
+BETA0   = 17              KT1     = -0.5725814      LKT1    = 1.757797E-08    
+WKT1    = 7.834362E-07    PKT1    = -5.789593E-13   KT2     = -0.06172765     
+LKT2    = 8.731925E-09    WKT2    = 4.486853E-07    PKT2    = -1.672565E-13   
+AT      = -4.570661E+04   LAT     = -3.172809E-03   WAT     = -0.8586758      
+PAT     = 6.345613E-07    UTE     = -2.300194       LUTE    = 2.169772E-07    
+WUTE    = 2.925458E-06    PUTE    = -2.161913E-12   UA1     = -3.439659E-09   
+LUA1    = 8.348182E-16    WUA1    = 7.197805E-15    PUA1    = -5.319176E-21   
+UB1     = 1.028602E-18    LUB1    = -8.434839E-25   WUB1    = -1.28801E-24    
+PUB1    = 9.518413E-31    UC1     = -4.85747E-11    LUC1    = 1.175998E-17    
+WUC1    = 2.847941E-16    PUC1    = -2.104628E-22   KT1L    = 0               
+PRT     = 0               CJ      = cjp             PB      = 0.9191281       
+MJ      = 0.5464087       CJSW    = cjswp           PBSW    = 0.9191281       
+MJSW    = 0.3948903       CJSWG   = cjswgp          PBSWG   = 0.9191281       
+MJSWG   = 0.3948903       CGDO    = cgop            CGSO    = cgop            
+CTA     = 9.472773E-04    CTP     = 6.252666E-04    PTA     = 1.277020E-03    
+PTP     = 1.277020E-03    JS      = 3E-07           JSW     = 1E-11           
+N       = 1               XTI     = 3               CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+CF      = 0               TLEV    = 1               TLEVC   = 1              
+NLEV    = 3               AF      = 1.3             KF      = 3.5E-24  )
*
**************************************************************************
*                                                                             
*
*
*
***************************************************************
*                                                             *
*                                                             *
*             MODEL OF NORMAL NMOS WITH ESD IMPLANT           *
*                                                             *
*                                                             *
*                                                             *
***************************************************************
*
*
*  NOTE : 1. Users should specify NRS/NRD in their netlists  
*            because of the asymmetric "RPO edge to poly gate"
*            rule in source/drain. Also, the resistance of heavily
*            doped diffusion consists of two different parts:
*            (a) RPO edge to poly gate, RSH=87.2 ohm/sq (b) RPO edge
*            to CONTACT center, RSH=3.5 ohm/sq. Part (b) is so 
*            small that it can be ignored in effective source/drain 
*            resistance calculation. That is,
*             
*            NRS = (length of RPO edge to poly gate at source side)/ width, and
*            NRD = (length of RPO edge to poly gate at drain side)/ width.    
*
*         2. The junction capacitance of heavily doped diffusion 
*            consists of two different parts: (a) area Aa receiving
*            N+ implant, CJa=1.01893E-3 F/m^2 (b) area Ab receiving N+ 
*            and ESD implant, CJb=2.125821E-3 F/m^2. The effective CJ
*            is calculated by:
*
*            CJ = {(CJa*Aa)+(CJb*Ab)} / (Aa+Ab).
*
*            if Ab is less than 5% of (Aa+Ab), use CJ=CJa=1.01893E-3 F/m^2
*            could be a approximation of CJ.
*
*
*
*
.MODEL esd              NMOS   (                    LMIN     = 5E-07          
+LMAX    = 2E-06          WMIN     = 2E-05          WMAX     = 0.0002         
+LEVEL   = 49             TNOM     = 25             XL       = '5E-08+dxl'    
+XW      = '1.5E-07+dxw'  VERSION  = 3.1            TOX      = toxe           
+XJ      = 1E-07          NCH      = 1.67E+17       LLN      = 1              
+LWN     = 1              WLN      = 1              WWN      = 1              
+LINT    = 2.65E-08       WINT     = 1.045E-08      MOBMOD   = 1              
+BINUNIT = 2              DWG      = 0              DWB      = 0              
+VTH0    = 0.5761882      LVTH0    = 1.44234E-08    WVTH0    = 1.271495E-07   
+PVTH0   = 9.539854E-14   K1       = 0.610494       LK1      = -1.022698E-08  
+WK1     = -7.196697E-08  PK1      = 3.679306E-14   K2       = -0.001         
+K3      = 0              DVT0     = 0              DVT1     = 0              
+DVT2    = 0              DVT0W    = 0              DVT1W    = 0              
+DVT2W   = 0              NLX      = 0              W0       = 0              
+K3B     = 0              VSAT     = 141052.1       LVSAT    = -0.01555411    
+WVSAT   = -0.8255212     PVSAT    = 3.127791E-07   UA       = -5.200654E-10  
+LUA     = 9.745229E-17   WUA      = -1.722283E-16  PUA      = -7.830168E-21  
+UB      = 2.500066E-18   LUB      = 1.225636E-26   WUB      = -1.297621E-23  
+PUB     = 2.320509E-30   UC       = 7.16289E-11    LUC      = 2.38453E-17    
+WUC     = -1.157405E-15  PUC      = -4.150954E-22  RDSW     = 843.02         
+PRWB    = 0              PRWG     = 0.09613051     LPRWG    = 7.816386E-09   
+WPRWG   = 7.742055E-07   PPRWG    = -1.563896E-12  WR       = 1.02           
+U0      = 0.04115758     LU0      = 1.265241E-10   WU0      = -2.528661E-08  
+PU0     = 1.352458E-14   A0       = 1.089745       LA0      = -4.243725E-07  
+WA0     = -1.301003E-05  PA0      = 1.08577E-11    KETA     = -0.01796064    
+LKETA   = -2.077371E-09  WKETA    = 1.619505E-07   PKETA    = 1.194753E-13   
+A1      = 0              A2       = 0.1770578      LA2      = 3.262051E-07   
+WA2     = 1.61971E-05    PA2      = -7.880632E-12  AGS      = 0.4269948      
+LAGS    = -1.757069E-07  WAGS     = -7.287506E-06  PAGS     = 7.686222E-13   
+B0      = 0              B1       = 0              VOFF     = -0.1334999     
+LVOFF   = 2.543867E-08   WVOFF    = -9.990248E-08  PVOFF    = -6.950831E-14  
+NFACTOR = 1.242998       LNFACTOR = 7.928437E-08   WNFACTOR = -2.562368E-06  
+PNFACTOR= -6.630918E-13  CIT      = -6.171352E-05  LCIT     = -6.912265E-11  
+WCIT    = 2.1376E-09     PCIT     = 1.410421E-15   CDSC     = 0              
+CDSCB   = 0              CDSCD    = 7.618336E-06   LCDSCD   = 1.354999E-11   
+WCDSCD  = -5.493675E-11  PCDSCD   = -2.141163E-16  ETA0     = 0.0004276649   
+LETA0   = -1.707718E-10  WETA0    = 5.614081E-09   PETA0    = 2.384432E-15   
+ETAB    = 0.0001197764   LETAB    = -2.419483E-10  WETAB    = -8.664409E-10  
+PETAB   = 1.750211E-15   DSUB     = 0              PCLM     = 0.02027638     
+LPCLM   = -4.107196E-08  WPCLM    = -2.056099E-06  PPCLM    = 8.217644E-12   
+PDIBLC1 = 0              PDIBLC2  = -0.0004614757  LPDIBLC2 = 5.604113E-09   
+WPDIBLC2= -1.595061E-08  PPDIBLC2 = -2.539135E-14  PDIBLCB  = 0              
+DROUT   = 0              PSCBE1   = 3.553276E+08   LPSCBE1  = 18.48857       
+WPSCBE1 = 990.8719       PPSCBE1  = 5.064423E-05   PSCBE2   = 9.625548E-06   
+LPSCBE2 = -2.069152E-12  WPSCBE2  = 7.035988E-11   PPSCBE2  = -3.181177E-17  
+PVAG    = 1.22918        LPVAG    = -4.629428E-07  WPVAG    = -1.126628E-06  
+PPVAG   = 2.275788E-12   DELTA    = 0.00703126     LDELTA   = 6.448268E-09   
+WDELTA  = -9.89064E-08   PDELTA   = 1.094727E-13   ALPHA0   = 0              
+BETA0   = 30             KT1      = -0.2954199     LKT1     = -1.912604E-08  
+WKT1    = -1.152603E-07  PKT1     = 1.876674E-13   KT2      = -0.03059823    
+LKT2    = 3.364977E-09   WKT2     = 3.060566E-08   PKT2     = -1.295621E-13  
+AT      = 118236         LAT      = -0.01958136    WAT      = -2.08185       
+PAT     = 3.487486E-07   UTE      = -1.417118      LUTE     = -1.900626E-07  
+WUTE    = -7.71107E-07   PUTE     = -1.902924E-12  UA1      = 1.634642E-09   
+LUA1    = -4.966612E-16  WUA1     = 8.614161E-15   PUA1     = -8.82037E-21   
+UB1     = -2.195542E-18  LUB1     = -1.380766E-24  WUB1     = -7.189629E-24  
+PUB1    = 5.457073E-29   UC1      = -8.489402E-11  LUC1     = -1.219808E-16  
+WUC1    = 8.298325E-16   PUC1     = 3.691195E-21   KT1L     = 0              
+PRT     = 0.6849576      LPRT     = -3.360776E-07  WPRT     = -9.902158E-05  
+PPRT    = 3.291004E-11   CJ       = cje            MJ       = 0.3075043      
+PB      = 0.6944474      CJSW     = cjswe          MJSW     = 0.1929617      
+PBSW    = 0.6944474      CJSWG    = cjswge         MJSWG    = 0.1929617      
+PBSWG   = 0.6944474      CTA      = 0.001047197    CTP      = 0.000566277    
+PTA     = 0.001820458    PTP      = 0.001820458    JS       = 1E-06          
+JSW     = 2E-11          CGDO     = cgoe           CGSO     = cgoe           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0              
+ELM     = 5              XPART    = 1              CGSL     = 0              
+CGDL    = 0              CKAPPA   = 0.6            CF       = 0              
+CLC     = 1E-07          CLE      = 0.6            TLEV     = 1              
+TLEVC   = 1              HDIF     = hdife          LDIF     = 1.2E-07        
+RSH     = 87.2           RS       = 0              RD       = 0              
+RSC     = 0              RDC      = 0              DELVTO   = 'delvtoe'      
+ACM     = 12             
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG = 1
+NLEV    = 3              )
*
*
**************************************************************************
*
.ENDL MOS
*                           
**************************************************************************
*
*
***************************************************************
*                                                             *
*                                                             *
*                 5V DEVICES MODEL                            *
*                                                             *
*                                                             *
*                                                             *
***************************************************************
*
**************************************************************************
*
*
***************************************************************
*                                                             *
*                5V NMOS DEVICES MODEL                        *
*                                                             *
***************************************************************
*
.LIB MOS_5V
*
*
*
.MODEL nch5v.1          NMOS   (                     LMIN    = '1.496E-06-dxl5'
+LMAX    = 2.001E-05       WMIN    = '1.17E-06-dxw5' WMAX    = '1.997E-5-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.750121' LVTH0   = 9.908995E-08   WVTH0   = -2.909927E-08   
+PVTH0   = -2.049574E-14   K1      = 0.8046917       LK1     = -9.585495E-09   
+WK1     = -4.109512E-08   PK1     = 7.204479E-14    K2      = 0.08530818      
+LK2     = 5.30762E-09     WK2     = 2.082406E-08    PK2     = -4.307747E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 111730          LVSAT   = -0.03446166     
+WVSAT   = -5.172133E-04   PVSAT   = 1.030289E-08    UA      = -1.660174E-10   
+LUA     = -3.286971E-16   WUA     = 5.510078E-16    PUA     = 9.194004E-23    
+UB      = 2.248622E-18    LUB     = 1.286777E-25    WUB     = -1.42456E-24    
+PUB     = -2.605228E-31   UC      = 5.851303E-11    LUC     = -4.078393E-17   
+WUC     = -8.713116E-17   PUC     = -2.066842E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04842854      LU0     = 7.705169E-10    WU0     = -8.474069E-09   
+PU0     = -7.376583E-16   A0      = 0.8864123       LA0     = -3.850247E-07   
+WA0     = 2.640833E-08    PA0     = 2.176058E-13    KETA    = 0.02774458      
+LKETA   = -3.283701E-08   WKETA   = 1.17002E-08     PKETA   = 7.135293E-15    
+A1      = 0               A2      = 0.99            AGS     = 0.05745158      
+LAGS    = -1.102911E-07   WAGS    = -4.124641E-08   PAGS    = 5.873489E-14    
+B0      = 0               B1      = 0               VOFF    = -0.1212224      
+LVOFF   = 3.842249E-08    WVOFF   = 1.009696E-08    PVOFF   = -5.265703E-14   
+NFACTOR = 1               CIT     = -1.459794E-04   LCIT    = 1.824617E-10    
+WCIT    = 7.887595E-10    PCIT    = -1.043104E-15   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 8.768884E-05    
+LETA0   = 5.936829E-10    WETA0   = -2.266213E-11   PETA0   = 3.329663E-17    
+ETAB    = 0               DSUB    = 0               PCLM    = 0.784178        
+LPCLM   = 1.880253E-07    WPCLM   = 1.036916E-07    PPCLM   = 4.774423E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.1672418       
+LPDIBLCB= -1.469964E-08   WPDIBLCB= -1.475868E-08   PPDIBLCB= 2.939932E-13    
+DROUT   = 0               PSCBE1  = 2.501846E+08    LPSCBE1 = 171.5359        
+WPSCBE1 = -42.43617       PPSCBE1 = 7.689064E-05    PSCBE2  = 2.014742E-06    
+LPSCBE2 = -2.936616E-13   WPSCBE2 = 1.311762E-14    PPSCBE2 = -2.613032E-19   
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 1.717E-05   
+BETA0   = 38.5            KT1     = -0.3717502      LKT1    = -3.294961E-08   
+WKT1    = 2.992042E-08    PKT1    = -3.65592E-14    KT2     = -0.04115753     
+LKT2    = -8.300256E-09   WKT2    = 1.196475E-09    PKT2    = 3.40082E-15     
+AT      = 225204.5        LAT     = -0.3064512      WAT     = -0.01546404     
+PAT     = 2.202078E-08    UTE     = -1.830142       LUTE    = -1.662162E-07   
+WUTE    = 1.436212E-07    PUTE    = 2.136589E-13    UA1     = 1.01533E-10     
+LUA1    = -3.053746E-17   WUA1    = -3.066008E-17   PUA1    = 6.107495E-22    
+UB1     = 1E-20           UC1     = -1.773678E-11   LUC1    = 2.511478E-17    
+WUC1    = -1.533037E-17   PUC1    = 2.183045E-23    KT1L    = 0               
+PRT     = 1.465491        LPRT    = -1.814473E-05   WPRT    = -1.560634E-05   
+PPRT    = 5.858088E-11    CJ      = cjn5            MJ      = 0.3603336       
+PB      = 0.8188407       CJSW    = cjswn5          MJSW    = 0.1824667       
+PBSW    = 0.8188407       CJSWG   = cjswgn5         PBSWG   = 0.8188407       
+MJSWG   = 0.1824667       CTA     = 9.695174E-03    CTP     = 5.393050E-04    
+PTA     = 1.769156E-03    PTP     = 1.769156E-03    JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGDO    = cgon5           CGSO    = cgon5           CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CF      = 0  
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
.MODEL nch5v.2          NMOS   (                     LMIN    = '7.96E-07-dxl5' 
+LMAX    = '1.496E-06-dxl5' WMIN    = '1.17E-06-dxw5' WMAX    = '1.997E-5-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.7971078' LVTH0   = 3.218067E-08  WVTH0   = -5.926151E-08   
+PVTH0   = 2.24553E-14     K1      = 0.7489236       LK1     = 6.98283E-08     
+WK1     = 7.182442E-08    PK1     = -8.875263E-14   K2      = 0.1083047       
+LK2     = -2.743938E-08   WK2     = -2.919887E-08   PK2     = 2.815518E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 9.617690E+04    LVSAT   = -0.01231404     
+WVSAT   = 0.01547741      PVSAT   = -1.247345E-08   UA      = -3.098181E-10   
+LUA     = -1.239248E-16   WUA     = 8.139604E-16    PUA     = -2.825044E-22   
+UB      = 2.038835E-18    LUB     = 4.274146E-25    WUB     = -1.415191E-24   
+PUB     = -2.738636E-31   UC      = 2.920518E-11    LUC     = 9.504493E-19    
+WUC     = -7.392252E-17   PUC     = -3.947753E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04759064      LU0     = 1.963682E-09    WU0     = -6.486445E-09   
+PU0     = -3.568035E-15   A0      = 0.9590757       LA0     = -4.884974E-07   
+WA0     = 1.428114E-07    PA0     = 5.184782E-14    KETA    = 0.04307968      
+LKETA   = -5.46742E-08    WKETA   = -1.731478E-08   PKETA   = 4.845262E-14    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.113033       
+LVOFF   = 2.676076E-08    WVOFF   = -3.060305E-08   PVOFF   = 5.299781E-15    
+NFACTOR = 1               CIT     = -2.571257E-04   LCIT    = 3.407341E-10    
+WCIT    = 7.145735E-10    PCIT    = -9.374633E-16   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 6.596607E-04    
+LETA0   = -2.208051E-10   WETA0   = 1.070257E-10    PETA0   = -1.513788E-16   
+ETAB    = 1.517458E-04    LETAB   = -2.160861E-10   WETAB   = 4.076406E-12    
+PETAB   = -5.804804E-18   DSUB    = 0               PCLM    = 0.9896791       
+LPCLM   = -1.046083E-07   WPCLM   = -1.090472E-07   PPCLM   = 7.803823E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -8.305640E-03   
+LPDIBLCB= 2.3528E-07      WPDIBLCB= 3.899668E-07    PPDIBLCB= -2.82336E-13    
+DROUT   = 0               PSCBE1  = 2.885697E+08    LPSCBE1 = 116.8756        
+WPSCBE1 = 23.5165         PPSCBE1 = -1.702594E-05   PSCBE2  = 2.437901E-06    
+LPSCBE2 = -8.962406E-13   WPSCBE2 = -3.466052E-13   PPSCBE2 = 2.509422E-19    
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 1.717E-05    
+BETA0   = 38.5            KT1     = -0.3872939      LKT1    = -1.081537E-08   
+WKT1    = 4.55498E-09     PKT1    = -4.388047E-16   KT2     = -0.04826872     
+LKT2    = 1.826075E-09    WKT2    = 8.04501E-10     PKT2    = 3.958992E-15    
+AT      = -653.393        LAT     = 0.01517043      WAT     = 8.387303E-03    
+PAT     = -1.194352E-08   UTE     = -1.934695       LUTE    = -1.733265E-08   
+WUTE    = 1.483088E-07    PUTE    = 2.069838E-13    UA1     = 1.152052E-10    
+LUA1    = -5.000668E-17   WUA1    = -3.041043E-16   PUA1    = 1.000134E-21    
+UB1     = 1E-20           UC1     = -1E-13          KT1L    = 0               
+PRT     = -40.54467       LPRT    = 4.167776E-05    WPRT    = 1.971793E-04    
+PPRT    = -2.444259E-10   CJ      = cjn5            MJ      = 0.3603336       
+PB      = 0.8188407       CJSW    = cjswn5          MJSW    = 0.1824667       
+PBSW    = 0.8188407       CJSWG   = cjswgn5         PBSWG   = 0.8188407       
+MJSWG   = 0.1824667       CTA     = 9.695174E-03    CTP     = 5.393050E-04    
+PTA     = 1.769156E-03    PTP     = 1.769156E-03    JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGDO    = cgon5           CGSO    = cgon5           CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CF      = 0     
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
.MODEL nch5v.3          NMOS   (                     LMIN    = 5E-07           
+LMAX    = '7.96E-07-dxl5' WMIN    = '1.17E-06-dxw5' WMAX    = '1.997E-5-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.8927636' LVTH0   = -3.707413E-08 WVTH0   = -5.150757E-08   
+PVTH0   = 1.684144E-14    K1      = 1.01326         LK1     = -1.215515E-07   
+WK1     = -7.903725E-08   PK1     = 2.047122E-14    K2      = 0.09443888      
+LK2     = -1.740055E-08   WK2     = 1.198031E-08    PK2     = -1.658544E-15   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 8.275607E+04    LVSAT   = -2.597358E-03   
+WVSAT   = -7.117052E-03   PVSAT   = 3.884941E-09    UA      = -1.280541E-09   
+LUA     = 5.788787E-16    WUA     = 4.418985E-16    PUA     = -1.313156E-23   
+UB      = 3.497126E-18    LUB     = -6.283883E-25   WUB     = -1.736579E-24   
+PUB     = -4.117895E-32   UC      = 1.514522E-10    LUC     = -8.755639E-17   
+WUC     = -1.079105E-16   PUC     = -1.487026E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03975629      LU0     = 7.635745E-09    WU0     = -8.312918E-09   
+PU0     = -2.245669E-15   A0      = 0.8440663       LA0     = -4.052306E-07   
+WA0     = 1.877168E-07    PA0     = 1.933633E-14    KETA    = -0.03446128     
+LKETA   = 1.465459E-09    WKETA   = 7.267833E-08    PKETA   = -1.670239E-14   
+A1      = 0               A2      = 0.99            AGS     = -0.08014186     
+LAGS    = 4.35427E-08     WAGS    = 7.217024E-08    PAGS    = -5.225125E-14   
+B0      = 0               B1      = 0               VOFF    = -0.04476409     
+LVOFF   = -2.266593E-08   WVOFF   = -7.312119E-08   PVOFF   = 3.608292E-14    
+NFACTOR = 1               CIT     = -6.986090E-04   LCIT    = 6.60368E-10     
+WCIT    = -1.089321E-09   PCIT    = 3.68556E-16     CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -2.396208E-03   
+LETA0   = 1.991644E-09    WETA0   = -9.139974E-10   PETA0   = 5.87842E-16     
+ETAB    = 1.571771E-03    LETAB   = -1.244184E-09   WETAB   = -1.472524E-09   
+PETAB   = 1.063254E-15    DSUB    = 0               PCLM    = -0.232261       
+LPCLM   = 7.800762E-07    WPCLM   = 2.693858E-06    PPCLM   = -1.248921E-12   
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.3166667       
+DROUT   = 0               PSCBE1  = 4.5E+08         PSCBE2  = 1.2E-06         
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 1.717E-05      
+BETA0   = 38.5            KT1     = -0.3020033      LKT1    = -7.256578E-08   
+WKT1    = -1.077466E-07   PKT1    = 8.086755E-14    KT2     = -0.0554273      
+LKT2    = 7.008887E-09    WKT2    = 3.285946E-08    PKT2    = -1.92488E-14    
+AT      = 1.197809E+04    LAT     = 6.025235E-03    WAT     = -0.01189456     
+PAT     = 2.740546E-09    UTE     = -1.939117       LUTE    = -1.413158E-08   
+WUTE    = 2.568106E-08    PUTE    = 2.957662E-13    UA1     = 1.519659E-10    
+LUA1    = -7.662136E-17   WUA1    = -1.039314E-15   PUA1    = 1.532426E-21    
+UB1     = -4.684501E-19   LUB1    = 3.463978E-25    WUB1    = 5.741401E-25    
+PUB1    = -4.156774E-31   UC1     = -1E-13          KT1L    = 0               
+PRT     = -327.2909       LPRT    = 2.492820E-04    WPRT    = 2.727491E-04    
+PPRT    = -2.991384E-10   CJ      = cjn5            MJ      = 0.3603336       
+PB      = 0.8188407       CJSW    = cjswn5          MJSW    = 0.1824667       
+PBSW    = 0.8188407       CJSWG   = cjswgn5         PBSWG   = 0.8188407       
+MJSWG   = 0.1824667       CTA     = 9.695174E-03    CTP     = 5.393050E-04    
+PTA     = 1.769156E-03    PTP     = 1.769156E-03    JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGDO    = cgon5           CGSO    = cgon5           CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CF      = 0           
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*

*
*
*
.MODEL nch5v.4          NMOS   (                     LMIN    = '1.496E-06-dxl5'
+LMAX    = 2.001E-05       WMIN    = '7.7E-07-dxw5'  WMAX    = '1.17E-06-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.7551616' LVTH0   = 6.846514E-08  WVTH0   = -3.514795E-08   
+PVTH0   = 1.625401E-14    K1      = 0.8175095       LK1     = 1.354058E-07    
+WK1     = -5.647653E-08   PK1     = -1.019448E-13   K2      = 0.08198071      
+LK2     = -3.217063E-08   WK2     = 2.481703E-08    PK2     = 1.896419E-15    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 110947.3        LVSAT   = -0.01887057     
+WVSAT   = 4.220085E-04    PVSAT   = -8.406418E-09   UA      = -1.843882E-10   
+LUA     = 1.696847E-16    WUA     = 5.730529E-16    PUA     = -5.061183E-22   
+UB      = 1.808739E-18    LUB     = 5.079004E-25    WUB     = -8.967004E-25   
+PUB     = -7.155902E-31   UC      = 1.282627E-11    LUC     = 1.357038E-17    
+WUC     = -3.230704E-17   PUC     = -8.589361E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04362465      LU0     = -5.92265E-09    WU0     = -2.709408E-09   
+PU0     = 7.294144E-15    A0      = 0.7973585       LA0     = -2.115222E-07   
+WA0     = 1.332731E-07    PA0     = 9.402761E-15    KETA    = 0.04479661      
+LKETA   = -7.505875E-08   WKETA   = -8.76224E-09    PKETA   = 5.780139E-14    
+A1      = 0               A2      = 0.99            AGS     = 0.02307958      
+LAGS    = -6.134533E-08   B0      = 0               B1      = 0               
+VOFF    = -0.03589255     LVOFF   = -7.037274E-08   WVOFF   = -9.229889E-08   
+PVOFF   = 7.789728E-14    NFACTOR = 1               CIT     = 4.731838E-04    
+LCIT    = -2.555727E-09   WCIT    = 4.576351E-11    PCIT    = 2.242723E-15    
+CDSC    = 0               CDSCB   = 0               CDSCD   = 0               
+ETA0    = 9.090869E-05    LETA0   = 1.536422E-09    WETA0   = -2.652593E-11   
+PETA0   = -1.097991E-15   ETAB    = 0               DSUB    = 0               
+PCLM    = 1.147181        LPCLM   = -2.178018E-07   WPCLM   = -3.319117E-07   
+PPCLM   = 9.64435E-13     PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    
+PDIBLCB = 0.1549429       LPDIBLCB= 2.302946E-07    DROUT   = 0               
+PSCBE1  = 2.150368E+08    LPSCBE1 = 231.3059        WPSCBE1 = -0.2588928      
+PPSCBE1 = 5.16667E-06     PSCBE2  = 2.075588E-06    LPSCBE2 = -1.505719E-12   
+WPSCBE2 = -5.989786E-14   PPSCBE2 = 1.193166E-18    PVAG    = 0               
+DELTA   = 0.01            ALPHA0  = 1.717E-05       BETA0   = 38.5             
+KT1     = -0.2796005      LKT1    = -1.533114E-07   WKT1    = -8.065922E-08   
+PKT1    = 1.078749E-13    KT2     = -0.04831542     LKT2    = 1.208848E-08    
+WKT2    = 9.785949E-09    PKT2    = -2.106567E-14   AT      = 217179.6        
+LAT     = -0.2950238      WAT     = -5.834212E-03   PAT     = 8.3079E-09      
+UTE     = -1.844102       LUTE    = -7.548464E-08   WUTE    = 1.603734E-07    
+PUTE    = 1.04781E-13     UA1     = 1.181796E-10    LUA1    = -3.621394E-16   
+WUA1    = -5.063609E-17   PUA1    = 1.008672E-21    UB1     = 1E-20           
+UC1     = -3.313171E-11   LUC1    = 4.703715E-17    WUC1    = 3.143535E-18    
+PUC1    = -4.476392E-24   KT1L    = 0               PRT     = -11.53979       
+LPRT    = 3.067266E-05    CJ      = cjn5            MJ      = 0.3603336       
+PB      = 0.8188407       CJSW    = cjswn5          MJSW    = 0.1824667       
+PBSW    = 0.8188407       CJSWG   = cjswgn5         PBSWG   = 0.8188407       
+MJSWG   = 0.1824667       CTA     = 9.695174E-03    CTP     = 5.393050E-04    
+PTA     = 1.769156E-03    PTP     = 1.769156E-03    JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGDO    = cgon5           CGSO    = cgon5           CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CF      = 0     
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
*
.MODEL nch5v.5          NMOS   (                     LMIN    = '7.96E-07-dxl5' 
+LMAX    = '1.496E-06-dxl5' WMIN    = '7.7E-07-dxw5' WMAX    = '1.17E-06-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.6551832' LVTH0   = 2.108343E-07  WVTH0   = 1.11048E-07     
+PVTH0   = -1.91929E-13    K1      = 0.9592378       LK1     = -6.641522E-08   
+WK1     = -1.805526E-07   PK1     = 7.473959E-14    K2      = 0.05118612      
+LK2     = 1.168086E-08    WK2     = 3.934339E-08    PK2     = -1.878911E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 126607.2        LVSAT   = -0.04117023     
+WVSAT   = -0.02103895     PVSAT   = 2.215398E-08    UA      = 4.1009E-10      
+LUA     = -6.768523E-16   WUA     = -4.992933E-17   PUA     = 3.810085E-22    
+UB      = 1.39635E-18     LUB     = 1.095143E-24    WUB     = -6.442095E-25   
+PUB     = -1.075137E-30   UC      = -1.05679E-11    LUC     = 4.688367E-17    
+WUC     = -2.619483E-17   PUC     = -9.459739E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04762997      LU0     = -1.162623E-08   WU0     = -6.533646E-09   
+PU0     = 1.273986E-14    A0      = 0.75158         LA0     = -1.463338E-07   
+WA0     = 3.918063E-07    PA0     = -3.587485E-13   KETA    = -0.03499123     
+LKETA   = 3.855912E-08    WKETA   = 7.637031E-08    PKETA   = -6.342736E-14   
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.0600958      
+LVOFF   = -3.590731E-08   WVOFF   = -9.412767E-08   PVOFF   = 8.050146E-14    
+NFACTOR = 1               CIT     = -1.711920E-03   LCIT    = 5.558595E-10    
+WCIT    = 2.460326E-09    PCIT    = -1.195614E-15   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 2.016525E-03    
+LETA0   = -1.205655E-09   WETA0   = -1.521211E-09   PETA0   = 1.030441E-15    
+ETAB    = 1.551429E-04    LETAB   = -2.209234E-10   DSUB    = 0               
+PCLM    = -0.3831079      LPCLM   = 1.961329E-06    WPCLM   = 1.538297E-06    
+PPCLM   = -1.698742E-12   PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    
+PDIBLCB = 0.3166667       DROUT   = 0               PSCBE1  = 3.024548E+08    
+LPSCBE1 = 106.8227        WPSCBE1 = 6.854266        PPSCBE1 = -4.962484E-06   
+PSCBE2  = 8.301696E-07    LPSCBE2 = 2.677571E-13    WPSCBE2 = 1.582673E-12    
+PPSCBE2 = -1.145855E-18   PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 1.717E-05       BETA0   = 38.5            KT1     = -0.3642423      
+LKT1    = -3.278141E-08   WKT1    = -2.310692E-08   PKT1    = 2.592043E-14    
+KT2     = -0.05835581     LKT2    = 2.638599E-08    WKT2    = 1.2909E-08      
+PKT2    = -2.551291E-14   AT      = 1.340039E+04    LAT     = -4.842158E-03   
+WAT     = -8.477239E-03   PAT     = 1.207159E-08    UTE     = -1.852664       
+LUTE    = -6.329305E-08   WUTE    = 4.987112E-08    PUTE    = 2.621363E-13    
+UA1     = 5.953336E-13    LUA1    = -1.946996E-16   WUA1    = -1.665725E-16   
+PUA1    = 1.173766E-21    UB1     = 1E-20           UC1     = -1E-13          
+KT1L    = 0               PRT     = 351.3143        LPRT    = -4.860315E-04   
+WPRT    = -2.730514E-04   PPRT    = 3.888252E-10    CJ      = cjn5            
+MJ      = 0.3603336       PB      = 0.8188407       CJSW    = cjswn5          
+MJSW    = 0.1824667       PBSW    = 0.8188407       CJSWG   = cjswgn5         
+PBSWG   = 0.8188407       MJSWG   = 0.1824667       CTA     = 9.695174E-03    
+CTP     = 5.393050E-04    PTA     = 1.769156E-03    PTP     = 1.769156E-03    
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGDO    = cgon5           CGSO    = cgon5           
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0  )
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*

*
*
*
.MODEL nch5v.6          NMOS   (                     LMIN    = 5E-07           
+LMAX    = '7.96E-07-dxl5' WMIN    = '7.7E-07-dxw5'  WMAX    = '1.17E-06-dxw5' 
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+1.210544' LVTH0   = -1.912469E-07  WVTH0   = -4.32844E-07    
+PVTH0   = 2.018488E-13    K1      = 1.189501        LK1     = -2.331256E-07   
+WK1     = -2.905257E-07   PK1     = 1.543601E-13    K2      = 0.0518863       
+LK2     = 1.117394E-08    WK2     = 6.304341E-08    PK2     = -3.594793E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 7.735231E+04    LVSAT   = -5.509696E-03   
+WVSAT   = -6.325441E-04   PVSAT   = 7.379746E-09    UA      = -4.456645E-09   
+LUA     = 2.846664E-15    WUA     = 4.253223E-15    PUA     = -2.734473E-21   
+UB      = 5.759941E-18    LUB     = -2.064098E-24   WUB     = -4.451957E-24   
+PUB     = 1.681672E-30    UC      = 2.135591E-10    LUC     = -1.153843E-16   
+WUC     = -1.824387E-16   PUC     = 1.85232E-23     RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 3.778470E-03    LU0     = 2.012226E-08    WU0     = 3.486048E-08    
+PU0     = -1.722949E-14   A0      = 1.639947        LA0     = -7.89511E-07    
+WA0     = -7.673397E-07   PA0     = 4.80473E-13     KETA    = 0.08710139      
+LKETA   = -4.983595E-08   WKETA   = -7.319688E-08   PKETA   = 4.48593E-14     
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.209954       
+LVOFF   = 7.259003E-08    WVOFF   = 1.251067E-07    PVOFF   = -7.822423E-14   
+NFACTOR = 1               CIT     = -2.129077E-03   LCIT    = 8.578819E-10    
+WCIT    = 6.272415E-10    PCIT    = 1.315393E-16    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -1.158870E-03   
+LETA0   = 1.093331E-09    WETA0   = -2.398803E-09   PETA0   = 1.665818E-15    
+ETAB    = 3.446668E-04    LETAB   = -3.581388E-10   DSUB    = 0               
+PCLM    = 5.254061        LPCLM   = -2.119981E-06   WPCLM   = -3.889727E-06   
+PPCLM   = 2.231148E-12    PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    
+PDIBLCB = -0.1502394      LPDIBLCB= 3.3804E-07      WPDIBLCB= 5.602873E-07    
+PPDIBLCB= -4.056481E-13   DROUT   = 0               PSCBE1  = 4.5E+08         
+PSCBE2  = 1.2E-06         PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 1.717E-05       BETA0  = 38.5             KT1     = -0.3392977      
+LKT1    = -5.084131E-08   WKT1    = -6.299331E-08   PKT1    = 5.479819E-14    
+KT2     = 6.524612E-03    LKT2    = -2.058743E-08   WKT2    = -4.148283E-08   
+PKT2    = 1.386678E-14    AT      = -8.997487E+03   LAT     = 0.01137391      
+WAT     = 0.01327614      PAT     = -3.677859E-09   UTE     = -1.97209        
+LUTE    = 2.317111E-08    WUTE    = 6.524859E-08    PUTE    = 2.51003E-13     
+UA1     = -1.183973E-09   LUA1    = 6.629276E-16    WUA1    = 5.638122E-16    
+PUA1    = 6.449671E-22    UB1     = 1E-20           UC1     = -1E-13          
+KT1L    = 0               PRT     = -288.9067       LPRT    = -2.251155E-05   
+WPRT    = 2.266880E-04    PPRT    = 2.701386E-11    CJ      = cjn5            
+MJ      = 0.3603336       PB      = 0.8188407       CJSW    = cjswn5          
+MJSW    = 0.1824667       PBSW    = 0.8188407       CJSWG   = cjswgn5         
+PBSWG   = 0.8188407       MJSWG   = 0.1824667       CTA     = 9.695174E-03    
+CTP     = 5.393050E-04    PTA     = 1.769156E-03    PTP     = 1.769156E-03    
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGDO    = cgon5           CGSO    = cgon5           
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0  
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
*
.MODEL nch5v.7          NMOS   (                     LMIN    = '1.496E-06-dxl5'
+LMAX    = 2.001E-05       WMIN    = 4E-07           WMAX    = '7.7E-07-dxw5'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.7403549' LVTH0   = 1.09595E-07   WVTH0   = -2.330261E-08   
+PVTH0   = -1.664986E-14   K1      = 0.7372457       LK1     = -3.223046E-08   
+WK1     = 7.734577E-09    PK1     = 3.216425E-14    K2      = 0.1120219       
+LK2     = -3.803076E-08   WK2     = 7.840946E-10    PK2     = 6.584528E-15    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 112200.6        LVSAT   = -0.04383492     
+WVSAT   = -5.805765E-04   PVSAT   = 1.156507E-08    UA      = -2.260395E-10   
+LUA     = 5.73389E-16     WUA     = 6.063739E-16    PUA     = -8.290818E-22   
+UB      = 1.2697E-18      LUB     = -7.944949E-25   WUB     = -4.654688E-25   
+PUB     = 3.263262E-31    UC      = -3.748265E-11   LUC     = -6.39337E-17    
+WUC     = 7.940089E-18    PUC     = -2.389033E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.0350759       LU0     = 7.016511E-09    WU0     = 4.129591E-09    
+PU0     = -3.057187E-15   A0      = 0.9585697       LA0     = -8.518225E-08   
+WA0     = 4.304039E-09    PA0     = -9.166922E-14   KETA    = 0.03000119      
+LKETA   = 1.802902E-08    WKETA   = 3.074103E-09    PKETA   = -1.666884E-14   
+A1      = 0               A2      = 0.99            AGS     = 0.02307958      
+LAGS    = -6.134533E-08   B0      = 0               B1      = 0               
+VOFF    = -0.1658558      LVOFF   = 3.132016E-08    WVOFF   = 1.16717E-08     
+PVOFF   = -3.457052E-15   NFACTOR = 1               CIT     = 6.363796E-04    
+LCIT    = -7.549748E-11   WCIT    = -8.479306E-11   PCIT    = 2.585391E-16    
+CDSC    = 0               CDSCB   = 0               CDSCD   = 0               
+ETA0    = 7.162595E-05    LETA0   = -1.672255E-11   WETA0   = -1.109981E-11   
+PETA0   = 1.445253E-16    ETAB    = 0               DSUB    = 0               
+PCLM    = 0.7366447       LPCLM   = 1.166235E-06    WPCLM   = -3.482914E-09   
+PPCLM   = -1.427947E-13   PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    
+PDIBLCB = 0.143382        LPDIBLCB= 4.605891E-07    WPDIBLCB= 9.24878E-09     
+PPDIBLCB= -1.842356E-13   DROUT   = 0               PSCBE1  = 2.137473E+08    
+LPSCBE1 = 257.006         WPSCBE1 = 0.7727615       PPSCBE1 = -1.539338E-05   
+PSCBE2  = 1.990355E-06    LPSCBE2 = 1.921202E-13    WPSCBE2 = 8.28844E-15     
+PPSCBE2 = -1.651056E-19   PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 1.717E-05       BETA0   = 38.5            KT1     = -0.3848059      
+LKT1    = -1.651018E-08   WKT1    = 3.505096E-09    PKT1    = -1.566028E-15   
+KT2     = -0.0333426      LKT2    = -2.375161E-08   WKT2    = -2.192311E-09   
+PKT2    = 7.606405E-15    AT      = 221179.1        LAT     = -0.300719       
+WAT     = -9.033774E-03   PAT     = 1.28641E-08     UTE     = -1.831929       
+LUTE    = 8.345226E-08    WUTE    = 1.506343E-07    PUTE    = -2.236851E-14   
+UA1     = 7.307229E-11    LUA1    = 5.364002E-16    WUA1    = -1.455021E-17   
+PUA1    = 2.898401E-22    UB1     = 1E-20           UC1     = -5.830458E-11   
+LUC1    = 8.288331E-17    WUC1    = 2.328183E-17    PUC1    = -3.315332E-23   
+KT1L    = 0               PRT     = -11.53979       LPRT    = 3.067266E-05    
+CJ      = cjn5            MJ      = 0.3603336       PB      = 0.8188407       
+CJSW    = cjswn5          MJSW    = 0.1824667       PBSW    = 0.8188407       
+CJSWG   = cjswgn5         PBSWG   = 0.8188407       MJSWG   = 0.1824667       
+CTA     = 9.695174E-03    CTP     = 5.393050E-04    PTA     = 1.769156E-03    
+PTP     = 1.769156E-03    JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGDO    = cgon5           
+CGSO    = cgon5           CGBO    = 1E-13           CAPMOD  = 0               
+NQSMOD  = 0               XPART   = 1               CF      = 0     
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*

*
*
*
.MODEL nch5v.8          NMOS   (                     LMIN    = '7.96E-07-dxl5' 
+LMAX    = '1.496E-06-dxl5' WMIN    = 4E-07          WMAX    = '7.7E-07-dxw5'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.8783173' LVTH0   = -8.686347E-08 WVTH0   = -6.745924E-08   
+PVTH0   = 4.622916E-14    K1      = 0.710825        LK1     = 5.392494E-09    
+WK1     = 1.817758E-08    PK1     = 1.729342E-14    K2      = 0.08353104      
+LK2     = 2.540188E-09    WK2     = 1.346745E-08    PK2     = -1.147657E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 8.823492E+04    LVSAT   = -9.707870E-03   
+WVSAT   = 9.658875E-03    PVSAT   = -3.015908E-09   UA      = -5.828465E-10   
+LUA     = 1.081482E-15    WUA     = 7.444196E-16    PUA     = -1.025659E-21   
+UB      = 1.246314E-18    LUB     = -7.611931E-25   WUB     = -5.241804E-25   
+PUB     = 4.099313E-31    UC      = -6.804935E-11   LUC     = -2.040673E-17   
+WUC     = 1.979033E-17    PUC     = -4.076507E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.0331593       LU0     = 9.745744E-09    WU0     = 5.042886E-09    
+PU0     = -4.357718E-15   A0      = 1.438475        LA0     = -7.685668E-07   
+WA0     = -1.577094E-07   PA0     = 1.390379E-13    KETA    = 0.08350015      
+LKETA   = -5.81535E-08    WKETA   = -1.842278E-08   PKETA   = 1.394273E-14    
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.228932       
+LVOFF   = 1.211407E-07    WVOFF   = 4.094129E-08    PVOFF   = -4.513696E-14   
+NFACTOR = 1               CIT     = 9.836794E-04    LCIT    = -5.700526E-10   
+WCIT    = 3.038469E-10    PCIT    = -2.948841E-16   CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -1.849787E-05   
+LETA0   = 1.116137E-10    WETA0   = 1.068069E-10    PETA0   = -2.337393E-17   
+ETAB    = 1.680339E-04    LETAB   = -2.392803E-10   WETAB   = -1.031287E-11   
+PETAB   = 1.468553E-17    DSUB    = 0               PCLM    = 2.294803        
+LPCLM   = -1.052582E-06   WPCLM   = -6.040316E-07   PPCLM   = 7.123867E-13    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.6221406       
+LPDIBLCB= -2.211631E-07   WPDIBLCB= -2.443791E-07   PPDIBLCB= 1.769304E-13    
+DROUT   = 0               PSCBE1  = 3.365458E+08    LPSCBE1 = 82.14081        
+WPSCBE1 = -20.41852       PPSCBE1 = 1.478301E-05    PSCBE2  = 3.082266E-06    
+LPSCBE2 = -1.362761E-12   WPSCBE2 = -2.190041E-13   PPSCBE2 = 1.58559E-19     
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 1.717E-05      
+BETA0   = 38.5            KT1     = -0.4095264      LKT1    = 1.869189E-08    
+WKT1    = 1.312039E-08    PKT1    = -1.52582E-14    KT2     = -0.04477996     
+LKT2    = -7.464804E-09   WKT2    = 2.048332E-09    PKT2    = 1.567728E-15    
+AT      = 4.920672E+03    LAT     = 7.232964E-03    WAT     = -1.693464E-03   
+PAT     = 2.411492E-09    UTE     = -1.896454       LUTE    = 1.753359E-07    
+WUTE    = 8.490287E-08    PUTE    = 7.12331E-14     UA1     = -1.494873E-10   
+LUA1    = 8.533251E-16    WUA1    = -4.650639E-17   PUA1    = 3.353458E-22    
+UB1     = 1E-20           UC1     = -1E-13          KT1L    = 0               
+PRT     = 10              CJ      = cjn5            MJ      = 0.3603336       
+PB      = 0.8188407       CJSW    = cjswn5          MJSW    = 0.1824667       
+PBSW    = 0.8188407       CJSWG   = cjswgn5         PBSWG   = 0.8188407       
+MJSWG   = 0.1824667       CTA     = 9.695174E-03    CTP     = 5.393050E-04    
+PTA     = 1.769156E-03    PTP     = 1.769156E-03    JS      = 1E-06           
+JSW     = 2E-11           N       = 1               XTI     = 3               
+CGDO    = cgon5           CGSO    = cgon5           CGBO    = 1E-13           
+CAPMOD  = 0               NQSMOD  = 0               XPART   = 1               
+CF      = 0     
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
*
.MODEL nch5v.9          NMOS   (                     LMIN    = 5E-07           
+LMAX    = '7.96E-07-dxl5' WMIN    = 4E-07           WMAX    = '7.7E-07-dxw5'  
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.5991158' LVTH0   = 1.152784E-07  WVTH0   = 6.023848E-08    
+PVTH0   = -4.622398E-14   K1      = 0.7421994       LK1     = -1.732254E-08   
+WK1     = 6.94943E-08     PK1     = -1.985988E-14   K2      = 0.1528526       
+LK2     = -4.76486E-08    WK2     = -1.906401E-08   PK2     = 1.207621E-14    
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 7.173251E+04    LVSAT   = 2.239878E-03    
+WVSAT   = 4.310531E-03    PVSAT   = 8.562926E-10    UA      = 1.114043E-09    
+LUA     = -1.470664E-16   WUA     = -2.55974E-16    PUA     = -3.013737E-22   
+UB      = 3.742125E-20    LUB     = 1.14045E-25     WUB     = 1.05375E-25     
+PUB     = -4.586668E-32   UC      = -1.695512E-12   LUC     = -6.844691E-17   
+WUC     = -1.392927E-17   PUC     = -1.635208E-23   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04838423      LU0     = -1.277103E-09   WU0     = -1.031341E-09   
+PU0     = 4.002189E-17    A0      = 0.4857059       LA0     = -7.876227E-08   
+WA0     = 1.744988E-07    PA0     = -1.014809E-13   KETA    = 0.0173118       
+LKETA   = -1.023313E-08   WKETA   = -1.653087E-08   PKETA   = 1.257298E-14    
+A1      = 0               A2      = 0.99            AGS     = 8.552128E-03    
+LAGS    = -2.067174E-08   WAGS    = -2.35555E-08    PAGS    = 1.705418E-14    
+B0      = 0               B1      = 0               VOFF    = 7.756794E-04    
+LVOFF   = -4.516765E-08   WVOFF   = -4.584438E-08   PVOFF   = 1.769587E-14    
+NFACTOR = 1               CIT     = -1.134519E-03   LCIT    = 9.635234E-10    
+WCIT    = -1.244605E-10   PCIT    = 1.521033E-17    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -7.933144E-03   
+LETA0   = 5.841818E-09    WETA0   = 3.176966E-09    PETA0   = -2.246169E-15   
+ETAB    = 3.145877E-04    LETAB   = -3.453852E-10   WETAB   = 2.406332E-11    
+PETAB   = -1.020286E-17   DSUB    = 0               PCLM    = 0.3161579       
+LPCLM   = 3.799568E-07    WPCLM   = 9.444994E-08    PPCLM   = 2.06686E-13     
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 0.5288968       
+LPDIBLCB= -1.536546E-07   DROUT   = 0               PSCBE1  = 4.5E+08         
+PSCBE2  = 1.2E-06         PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 1.717E-05       BETA0   = 38.5            KT1     = -0.4279576      
+LKT1    = 3.203608E-08    WKT1    = 1.170844E-08    PKT1    = -1.423595E-14   
+KT2     = -0.04698662     LKT2    = -5.867185E-09   WKT2    = 6.621103E-10    
+PKT2    = 2.571352E-15    AT      = 7.038837E+03    LAT     = 5.699412E-03    
+WAT     = 5.408246E-04    PAT     = 7.938672E-10    UTE     = -2.141667       
+LUTE    = 3.528706E-07    WUTE    = 2.223939E-07    PUTE    = -2.83104E-14    
+UA1     = -1.013787E-09   LUA1    = 1.479078E-15    WUA1    = 5.016893E-16    
+PUA1    = -6.154782E-23   UB1     = 1E-20           UC1     = -1E-13          
+KT1L    = 0               PRT     = -165.9546       LPRT    = 1.273911E-04    
+WPRT    = 1.451625E-04    PPRT    = -1.050977E-10   CJ      = cjn5            
+MJ      = 0.3603336       PB      = 0.8188407       CJSW    = cjswn5          
+MJSW    = 0.1824667       PBSW    = 0.8188407       CJSWG   = cjswgn5         
+PBSWG   = 0.8188407       MJSWG   = 0.1824667       CTA     = 9.695174E-03    
+CTP     = 5.393050E-04    PTA     = 1.769156E-03    PTP     = 1.769156E-03    
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGDO    = cgon5           CGSO    = cgon5           
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0     
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
*
.MODEL nch5v.10         NMOS   (                     LMIN    = '1.496E-06-dxl5'
+LMAX    = 2.001E-05       WMIN    = '1.997E-5-dxw5' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.748091' LVTH0   = 7.848801E-08   WVTH0   = 1.149919E-08    
+PVTH0   = 3.915429E-13    K1      = 0.7998335       LK1     = -7.031051E-09   
+WK1     = 5.606976E-08    PK1     = 2.095585E-14    K2      = 0.08551185      
+LK2     = 5.268072E-09    WK2     = 1.675062E-08    PK2     = -4.228649E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 110291          LVSAT   = -5.796020E-03   
+WVSAT   = 0.02826357      PVSAT   = -5.6301E-07     UA      = -1.776529E-10   
+LUA     = -3.486726E-17   WUA     = 7.837188E-16    PUA     = -5.784658E-21   
+UB      = 2.342076E-18    LUB     = 1.185338E-24    WUB     = -3.293625E-24   
+PUB     = -2.139373E-29   UC      = 6.103651E-11    LUC     = 7.472061E-17    
+WUC     = -1.376006E-16   PUC     = -2.330759E-21   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04877143      LU0     = 1.948803E-09    WU0     = -1.533192E-08   
+PU0     = -2.430339E-14   A0      = 0.8447096       LA0     = -1.728779E-07   
+WA0     = 8.604645E-07    PA0     = -4.025331E-12   KETA    = 0.02758426      
+LKETA   = -2.352945E-08   WKETA   = 1.490673E-08    PKETA   = -1.790161E-13   
+A1      = 0               A2      = 0.99            AGS     = 0.05538927      
+LAGS    = -1.073543E-07   B0      = 0               B1      = 0               
+VOFF    = -0.1128565      LVOFF   = 3.909481E-08    WVOFF   = -1.572212E-07   
+PVOFF   = -6.610331E-14   NFACTOR = 1               CIT     = -1.056437E-04   
+LCIT    = 1.124223E-10    WCIT    = -1.795613E-11   PCIT    = 3.576859E-16    
+CDSC    = 0               CDSCB   = 0               CDSCD   = 0               
+ETA0    = 1.005898E-04    LETA0   = 6.986719E-10    WETA0   = -2.806811E-10   
+PETA0   = -2.066483E-15   ETAB    = 0               DSUB    = 0               
+PCLM    = 0.7926276       LPCLM   = 1.468587E-07    WPCLM   = -6.53001E-08    
+PPCLM   = 1.300774E-12    PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    
+PDIBLCB = 0.1665039       DROUT   = 0               PSCBE1  = 2.528435E+08    
+LPSCBE1 = 109.3872        WPSCBE1 = -95.61413       PPSCBE1 = 1.319866E-03    
+PSCBE2  = 2.015398E-06    LPSCBE2 = -3.067267E-13   PVAG    = 0               
+DELTA   = 0.01            ALPHA0  = 1.717E-05       BETA0   = 38.5     
+KT1     = -0.3615951      LKT1    = -8.063787E-09   WKT1    = -1.731812E-07   
+PKT1    = -5.342756E-13   KT2     = -0.04189539     LKT2    = 1.61993E-09     
+WKT2    = 1.595357E-08    PKT2    = -1.950029E-13   AT      = 238766          
+LAT     = -0.3083471      WAT     = -0.2866949      PAT     = 5.99385E-08     
+UTE     = -1.821948       LUTE    = 2.131771E-07    WUTE    = -2.02764E-08    
+PUTE    = -7.374208E-12   UA1     = 9.999999E-11    UB1     = 1E-20           
+UC1     = -2.181912E-11   LUC1    = 3.092803E-17    WUC1    = 6.631636E-17    
+PUC1    = -9.443454E-23   KT1L    = 0               PRT     = -11.64341       
+LPRT    = 1.319504E-05    WPRT    = 2.465719E-04    PPRT    = -5.682147E-10   
+CJ      = cjn5            MJ      = 0.3603336       PB      = 0.8188407       
+CJSW    = cjswn5          MJSW    = 0.1824667       PBSW    = 0.8188407       
+CJSWG   = cjswgn5         PBSWG   = 0.8188407       MJSWG   = 0.1824667       
+CTA     = 9.695174E-03    CTP     = 5.393050E-04    PTA     = 1.769156E-03    
+PTP     = 1.769156E-03    JS      = 1E-06           JSW     = 2E-11           
+N       = 1               XTI     = 3               CGDO    = cgon5           
+CGSO    = cgon5           CGBO    = 1E-13           CAPMOD  = 0               
+NQSMOD  = 0               XPART   = 1               CF      = 0    
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*

*
*
*
.MODEL nch5v.11         NMOS   (                     LMIN    = '7.96E-07-dxl5' 
+LMAX    = '1.496E-06-dxl5' WMIN    = '1.997E-5-dxw5' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.7821898' LVTH0   = 2.99314E-08   WVTH0   = 2.390991E-07    
+PVTH0   = 6.744074E-14    K1      = 0.7608094       LK1     = 4.853916E-08    
+WK1     = -1.658924E-07   PK1     = 3.3703E-13      K2      = 0.1031225       
+LK2     = -1.980944E-08   WK2     = 7.444529E-08    PK2     = -1.244437E-13   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 9.570555E+04    LVSAT   = 0.01497361      
+WVSAT   = 0.02490431      PVSAT   = -5.582264E-07   UA      = -6.676628E-10   
+LUA     = 6.629068E-16    WUA     = 7.970852E-15    PUA     = -1.601914E-20   
+UB      = 6.951134E-19    LUB     = 3.530612E-24    WUB     = 2.545924E-23    
+PUB     = -6.233782E-29   UC      = -1.102969E-10   LUC     = 3.186993E-16    
+WUC     = 2.716118E-15    PUC     = -6.394455E-21   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.04583858      LU0     = 6.12517E-09     WU0     = 2.855458E-08    
+PU0     = -8.679778E-14   A0      = 0.8075782       LA0     = -1.200028E-07   
+WA0     = 3.172762E-06    PA0     = -7.318043E-12   KETA    = 0.0277514       
+LKETA   = -2.376746E-08   WKETA   = 2.89251E-07     PKETA   = -5.696822E-13   
+A1      = 0               A2      = 0.99            AGS     = -0.02           
+B0      = 0               B1      = 0               VOFF    = -0.1064737      
+LVOFF   = 3.000563E-08    WVOFF   = -1.617898E-07   PVOFF   = -5.95976E-14    
+NFACTOR = 1               CIT     = 3.94036E-05     LCIT    = -9.412502E-11   
+WCIT    = -5.216013E-09   PCIT    = 7.759719E-15    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = 3.978105E-04    
+LETA0   = 2.754296E-10    WETA0   = 5.344031E-09    PETA0   = -1.007607E-14   
+ETAB    = 2.936189E-04    LETAB   = -4.181133E-10   WETAB   = -2.833384E-09   
+PETAB   = 4.034739E-15    DSUB    = 0               PCLM    = 1.25962         
+LPCLM   = -5.181386E-07   WPCLM   = -5.507866E-06   PPCLM   = 9.050989E-12    
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = 1.102069        
+LPDIBLCB= -1.332244E-06   WPDIBLCB= -2.181752E-05   PPDIBLCB= 3.106814E-11    
+DROUT   = 0               PSCBE1  = 2.051946E+08    LPSCBE1 = 177.2391        
+WPSCBE1 = 1.691017E+03    PPSCBE1 = -1.224296E-03   PSCBE2  = 2.420571E-06    
+LPSCBE2 = -8.836936E-13   PVAG    = 0               DELTA   = 0.01            
+ALPHA0  = 1.717E-05       BETA0   = 38.5            KT1     = -0.4002817      
+LKT1    = 4.702594E-08    WKT1    = 2.643112E-07    PKT1    = -1.157265E-12   
+KT2     = -0.04572857     LKT2    = 7.078385E-09    WKT2    = -4.999848E-08   
+PKT2    = -1.010872E-13   AT      = -3.838946E+04   LAT     = 0.08632236      
+WAT     = 0.7631084       PAT     = -1.434982E-06   UTE     = -2.089894       
+LUTE    = 5.947329E-07    WUTE    = 3.252277E-06    PUTE    = -1.203433E-11   
+UA1     = 2.149219E-10    LUA1    = -1.636488E-16   WUA1    = -2.298438E-15   
+PUA1    = 3.272975E-21    UB1     = 1.488349E-20    LUB1    = -6.954092E-27   
+WUB1    = -9.766982E-26   PUB1    = 1.390818E-31    UC1     = 5.724603E-11    
+LUC1    = -8.166075E-17   WUC1    = -1.14692E-15    PUC1    = 1.633215E-21    
+KT1L    = 0               PRT     = 1.375376E+03    LPRT    = -1.961921E-03   
+WPRT    = -0.02812124     PPRT    = 3.982755E-08    CJ      = cjn5            
+MJ      = 0.3603336       PB      = 0.8188407       CJSW    = cjswn5          
+MJSW    = 0.1824667       PBSW    = 0.8188407       CJSWG   = cjswgn5         
+PBSWG   = 0.8188407       MJSWG   = 0.1824667       CTA     = 9.695174E-03    
+CTP     = 5.393050E-04    PTA     = 1.769156E-03    PTP     = 1.769156E-03    
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGDO    = cgon5           CGSO    = cgon5           
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0    
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
*
.MODEL nch5v.12         NMOS   (                     LMIN    = 5E-07           
+LMAX    = '7.96E-07-dxl5' WMIN    = '1.997E-5-dxw5' WMAX    = 2.001000E-04    
+LEVEL   = 49              TNOM    = 25              VERSION = 3.1             
+ACM     = 12              LDIF    = 1.2E-07         HDIF    = hdifn5          
+RSH     = 3.5             RD      = 0               RS      = 0               
+TOX     = toxn5           XJ      = 1E-07           NCH     = 8.521E+16       
+LLN     = 1               LWN     = 1               WLN     = 1               
+WWN     = 1               LINT    = 6E-08           LL      = 0               
+LW      = 0               LWL     = 0               WINT    = 6E-08           
+WL      = 0               WW      = 0               WWL     = 0               
+MOBMOD  = 1               BINUNIT = 2               XL      = '5E-08+dxl5'    
+XW      = '1.5E-07+dxw5'  DWG     = 0               DWB     = 0               
+VTH0    = 'dvtn5+0.9070788' LVTH0   = -6.048824E-08 WVTH0   = -3.378113E-07   
+PVTH0   = 4.851238E-13    K1      = 0.9946308       LK1     = -1.207475E-07   
+WK1     = 2.93555E-07     PK1     = 4.390021E-15    K2      = 0.09821662      
+LK2     = -1.625761E-08   WK2     = -6.357457E-08   PK2     = -2.451733E-14   
+K3      = 0               DVT0    = 0               DVT1    = 0               
+DVT2    = 0               DVT0W   = 0               DVT1W   = 0               
+DVT2W   = 0               NLX     = 0               W0      = 0               
+K3B     = 0               VSAT    = 106743.6        LVSAT   = 6.982085E-03    
+WVSAT   = -0.4868671      PVSAT   = -1.877039E-07   UA      = -1.715665E-09   
+LUA     = 1.421661E-15    WUA     = 9.144378E-15    PUA     = -1.686877E-20   
+UB      = 6.60882E-18     LUB     = -7.509112E-25   WUB     = -6.397045E-23   
+PUB     = 2.409278E-30    UC      = 4.518281E-10    LUC     = -8.82791E-17    
+WUC     = -6.115428E-15   PUC     = -4.160792E-25   RDSW    = 1.400000E+03    
+PRWB    = 0               PRWG    = 0               WR      = 1               
+U0      = 0.03686401      LU0     = 1.262276E-08    WU0     = 4.953268E-08    
+PU0     = -1.019859E-13   A0      = -0.4931414      LA0     = 8.21718E-07     
+WA0     = 2.693187E-05    PA0     = -2.451963E-11   KETA    = -0.04565343     
+LKETA   = 2.937764E-08    WKETA   = 2.965214E-07    PKETA   = -5.74946E-13    
+A1      = 0               A2      = 0.99            AGS     = -0.01381017     
+LAGS    = -4.481435E-09   WAGS    = -1.254463E-06   PAGS    = 9.082315E-13    
+B0      = 0               B1      = 0               VOFF    = -0.03433112     
+LVOFF   = -2.222557E-08   WVOFF   = -2.817808E-07   PVOFF   = 2.727584E-14    
+NFACTOR = 1               CIT     = -7.711803E-04   LCIT    = 4.927377E-10    
+WCIT    = 3.621023E-10    PCIT    = 3.721163E-15    CDSC    = 0               
+CDSCB   = 0               CDSCD   = 0               ETA0    = -2.006703E-03   
+LETA0   = 2.016297E-09    WETA0   = -8.704114E-09   PETA0   = 9.478012E-17    
+ETAB    = 1.483030E-03    LETAB   = -1.279247E-09   WETAB   = 3.022874E-10    
+PETAB   = 1.764513E-15    DSUB    = 0               PCLM    = -0.05751416     
+LPCLM   = 4.354666E-07    WPCLM   = -8.010722E-07   PPCLM   = 5.64327E-12     
+PDIBLC1 = 1E-05           PDIBLC2 = 1.000000E-04    PDIBLCB = -1.992897       
+LPDIBLCB= 9.08511E-07     WPDIBLCB= 4.619128E-05    PPDIBLCB= -1.817022E-11   
+DROUT   = 0               PSCBE1  = 4.5E+08         PSCBE2  = 1.2E-06         
+PVAG    = 0               DELTA   = 0.01            ALPHA0  = 1.717E-05  
+BETA0   = 38.5            KT1     = -0.2616354      LKT1    = -5.335395E-08   
+WKT1    = -9.151033E-07   PKT1    = -3.033689E-13   KT2     = -0.01944676     
+LKT2    = -1.194965E-08   WKT2    = -6.867514E-07   PKT2    = 3.599219E-13    
+AT      = 129964.2        LAT     = -0.03556567     WAT     = -2.371616       
+PAT     = 8.345588E-07    UTE     = -0.8097005      LUTE    = -3.321271E-07   
+WUTE    = -2.256264E-05   PUTE    = 6.655676E-12    UA1     = -1.111234E-11   
+WUA1    = 2.222247E-15    UB1     = 6.42862E-20     LUB1    = -4.272159E-26   
+WUB1    = -1.008058E-23   PUB1    = 7.36671E-30     UC1     = -3.234818E-10   
+LUC1    = 1.939862E-16    WUC1    = 6.467635E-15    PUC1    = -3.879723E-21   
+KT1L    = 0               PRT     = -1.694120E+03   LPRT    = 2.603939E-04    
+WPRT    = 0.02760932      PPRT    = -5.213782E-10   CJ      = cjn5            
+MJ      = 0.3603336       PB      = 0.8188407       CJSW    = cjswn5          
+MJSW    = 0.1824667       PBSW    = 0.8188407       CJSWG   = cjswgn5         
+PBSWG   = 0.8188407       MJSWG   = 0.1824667       CTA     = 9.695174E-03    
+CTP     = 5.393050E-04    PTA     = 1.769156E-03    PTP     = 1.769156E-03    
+JS      = 1E-06           JSW     = 2E-11           N       = 1               
+XTI     = 3               CGDO    = cgon5           CGSO    = cgon5           
+CGBO    = 1E-13           CAPMOD  = 0               NQSMOD  = 0               
+XPART   = 1               CF      = 0    
+CALCACM = 1               SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3               AF      = 0.8             KF      = 7.5E-24  )
*
*
*
***************************************************************
*                                                             *
*                5V PMOS DEVICES MODEL                        *
*                                                             *
***************************************************************
*
*
.MODEL pch5v.1           PMOS   (                   LMIN     = '1.499E-6-dxl5'   
+LMAX    = 2.001E-05      WMIN     = '1.17E-6-dxw5' WMAX     = '1.997E-5-dxw5'  
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.8908305' LVTH0    = -6.152807E-08  
+WVTH0   = -4.930911E-08  PVTH0    = 2.285562E-14   K1       = 0.592319       
+LK1     = -7.122552E-08  WK1      = -2.203479E-08  PK1      = 3.322357E-14   
+K2      = 0.02270263     LK2      = 1.231118E-08   WK2      = 2.621642E-08   
+PK2     = -1.159094E-14  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 250000         
+UA      = 2.937545E-09   LUA      = -5.923352E-16  WUA      = -1.955728E-15  
+PUA     = 1.330335E-21   UB       = 2.257712E-19   LUB      = 9.308343E-25   
+WUB     = 1.310402E-26   PUB      = -1.236916E-30  UC       = -6.255307E-11  
+LUC     = -5.622967E-18  WUC      = -7.606247E-17  PUC      = -1.866276E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.02316544     LU0      = -6.356707E-09  
+WU0     = -1.117211E-08  PU0      = 4.514935E-15   A0       = 0.591755       
+LA0     = 1.241805E-07   WA0      = 2.503587E-07   PA0      = 1.728363E-14   
+KETA    = 0.007587799    LKETA    = -7.157953E-09  WKETA    = 2.631176E-08   
+PKETA   = -1.193704E-14  A1       = 0              A2       = 0.4            
+AGS     = 0.02131915     WAGS     = -2.643575E-08  B0       = 0              
+B1      = 0              VOFF     = -0.1451779     LVOFF    = 4.532872E-09   
+WVOFF   = -5.055951E-08  PVOFF    = 7.524804E-15   NFACTOR  = 1              
+CIT     = -0.0004958207  LCIT     = 1.738857E-10   WCIT     = 1.131086E-09   
+PCIT    = -6.498858E-16  CDSC     = 0              CDSCB    = 0              
+CDSCD   = 0              ETA0     = 0.0003791761   LETA0    = 6.192062E-10   
+WETA0   = 7.34677E-11    PETA0    = 1.002112E-15   ETAB     = 0              
+DSUB    = 0              PCLM     = 2.726725       LPCLM    = 8.898228E-07   
+WPCLM   = -1.018662E-07  PPCLM    = 1.641068E-13   PDIBLC1  = 1E-05          
+PDIBLC2 = 6.268697E-06   LPDIBLC2 = 7.451408E-11   WPDIBLC2 = 4.626815E-12   
+PPDIBLC2= -9.239746E-17  PDIBLCB  = 0.1537944      LPDIBLCB = 2.538089E-07   
+WPDIBLCB= 1.575981E-08   PPDIBLCB = -3.14723E-13   DROUT    = 0              
+PSCBE1  = 3.939331E+08   LPSCBE1  = 155.8122       WPSCBE1  = 9.226731       
+PPSCBE1 = -1.355407E-05  PSCBE2   = 4E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 1.59E-06       BETA0    = 38.1             
+KT1     = -0.6011382     LKT1     = 5.649719E-09   WKT1     = 2.602981E-08   
+PKT1    = -2.196504E-14  KT2      = -0.05585948    LKT2     = 6.564209E-09   
+WKT2    = -1.969688E-08  PKT2     = 5.309392E-15   AT       = 20000          
+UTE     = -1.866643      LUTE     = 3.12381E-07    WUTE     = 6.132618E-07   
+PUTE    = 1.59327E-13    UA1      = -2.052172E-09  LUA1     = 1.040129E-15   
+WUA1    = 3.254461E-15   PUA1     = 4.491006E-22   UB1      = -1.787744E-18  
+LUB1    = -9.832095E-25  WUB1     = -9.804595E-25  PUB1     = -1.251411E-30  
+UC1     = -1.188724E-10  LUC1     = 8.064513E-17   WUC1     = 9.274089E-17   
+PUC1    = -7.817521E-23  KT1L     = 0              PRT      = 0              
+CJ      = cjp5           MJ       = 0.5918653      PB       = 0.9191281      
+CJSW    = cjswp5         MJSW     = 0.4171692      PBSW     = 0.9191281       
+CJSWG   = cjswgp5        PBSWG    = 0.9191281      MJSWG    = 0.4171692       
+CTA     = 9.074913E-04   CTP      = 5.432845E-04   PTA      = 1.098908E-03    
+PTP     = 1.098908E-03   JS       = 3E-07          JSW      = 1E-11           
+N       = 1              XTI      = 3              CGDO     = cgop5          
+CGSO    = cgop5          CGBO     = 1E-13          CAPMOD   = 0               
+NQSMOD  = 0           
+CALCACM = 1              SFVTFLAG= 0               VFBFLAG = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
.MODEL pch5v.2           PMOS   (                   LMIN     = '7.99E-7-dxl5'  
+LMAX    = '1.499E-6-dxl5' WMIN     = '1.17E-6-dxw5' WMAX     = '1.997E-5-dxw5'      
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.9233565' LVTH0    = -1.374736E-08  
+WVTH0   = -4.358254E-08  PVTH0    = 1.444329E-14   K1       = 0.5466042      
+LK1     = -4.070619E-09  WK1      = -1.334034E-08  PK1      = 2.045142E-14   
+K2      = 0.03269075     LK2      = -2.361367E-09  WK2      = 2.533437E-08   
+PK2     = -1.029521E-14  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 310988.5       
+LVSAT   = -0.08959211    WVSAT    = 0.04610071     PVSAT    = -6.772196E-08  
+UA      = 2.675313E-09   LUA      = -2.071159E-16  WUA      = -9.832577E-16  
+PUA     = -9.822401E-23  UB       = 5.739705E-19   LUB      = 4.193297E-25   
+WUB     = -8.706922E-25  PUB      = 6.138073E-32   UC       = -7.978145E-11  
+LUC     = 1.968553E-17   WUC      = -7.508568E-17  PUC      = -2.009767E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.02111682     LU0      = -3.347283E-09  
+WU0     = -8.771699E-09  PU0      = 9.88729E-16    A0       = 0.6423268      
+LA0     = 4.989058E-08   WA0      = 2.784598E-07   PA0      = -2.39968E-14   
+KETA    = 0.001946938    LKETA    = 1.128474E-09   WKETA    = 1.924507E-08   
+PKETA   = -1.556085E-15  A1       = 0              A2       = 0.4            
+AGS     = 0.06671117     LAGS     = -6.668089E-08  WAGS     = -5.547729E-08  
+PAGS    = 4.266204E-14   B0       = 0              B1       = 0              
+VOFF    = -0.146836      LVOFF    = 6.968634E-09   WVOFF    = -2.710145E-08  
+PVOFF   = -2.693507E-14  NFACTOR  = 1              CIT      = -0.0004314426  
+LCIT    = 7.931427E-11   WCIT     = 8.540123E-10   PCIT     = -2.428647E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.0009354736   LETA0    = -1.979949E-10  WETA0    = 1.788903E-10   
+PETA0   = 8.472464E-16   ETAB     = 0.0003616152   LETAB    = -5.312127E-10  
+WETAB   = -4.259108E-10  PETAB    = 6.256629E-16   DSUB     = 0              
+PCLM    = 3.885395       LPCLM    = -8.122639E-07  WPCLM    = -4.827962E-07  
+PPCLM   = 7.236932E-13   PDIBLC1  = 1E-05          PDIBLC2  = -0.02227886    
+LPDIBLC2= 3.281136E-08   WPDIBLC2 = 1.234542E-08   PPDIBLC2 = -1.822102E-14  
+PDIBLCB = 0.3950237      LPDIBLCB = -1.00557E-07   WPDIBLCB = -4.879206E-07  
+PPDIBLCB= 4.251835E-13   DROUT    = 0              PSCBE1   = 4.807189E+08   
+LPSCBE1 = 28.32394       WPSCBE1  = 0.9481947      PPSCBE1  = -1.392899E-06  
+PSCBE2  = 5.09773E-06    LPSCBE2  = -1.612565E-12  WPSCBE2  = -2.03291E-13   
+PPSCBE2 = 2.986345E-19   PVAG     = 0              DELTA    = 0.01           
+ALPHA0   = 1.59E-06      BETA0    = 38.1           KT1      = -0.595826      
+LKT1    = -2.153929E-09  WKT1     = 5.387085E-09   PKT1     = 8.359129E-15   
+KT2     = -0.05415397    LKT2     = 4.058812E-09   WKT2     = -1.890403E-08  
+PKT2    = 4.144696E-15   AT       = 20000          UTE      = -1.63924       
+LUTE    = -2.167305E-08  WUTE     = 9.108425E-07   PUTE     = -2.778192E-13  
+UA1     = -6.986328E-10  LUA1     = -9.482199E-16  WUA1     = 4.556181E-15   
+PUA1    = -1.463126E-21  UB1      = -3.24744E-18   LUB1     = 1.161085E-24   
+WUB1    = -3.161583E-24  PUB1     = 1.95266E-30    UC1      = -6.327208E-11  
+LUC1    = -1.031716E-18  WUC1     = 2.108064E-17   PUC1     = 2.70937E-23    
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CAPMOD  = 0              NQSMOD   = 0         
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )

*
*
*
.MODEL pch5v.3          PMOS   (                    LMIN     = 5E-07       
+LMAX    = '7.99E-7-dxl5' WMIN     = '1.17E-6-dxw5' WMAX     = '1.997E-5-dxw5'     
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.9303128' LVTH0    = -8.397992E-09  
+WVTH0   = 2.195789E-08   PVTH0    = -3.595729E-14  K1       = 0.5192941      
+LK1     = 1.693082E-08   WK1      = 1.085132E-07   PK1      = -7.325395E-14  
+K2      = 0.04430968     LK2      = -1.129632E-08  WK2      = -1.153382E-08  
+PK2     = 1.805643E-14   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 283731.7       
+LVSAT   = -0.0686316     WVSAT    = -0.1102518     PVSAT    = 5.251314E-08   
+UA      = 2.297035E-09   LUA      = 8.377971E-17   WUA      = -1.067275E-15  
+PUA     = -3.361477E-23  UB       = 8.911554E-19   LUB      = 1.754145E-25   
+WUB     = -1.005109E-24  PUB      = 1.647473E-31   UC       = -5.974628E-11  
+LUC     = 4.278487E-18   WUC      = -9.411601E-17  PUC      = -5.46334E-24   
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.0190382      LU0      = -1.74883E-09   
+WU0     = -7.878757E-09  PU0      = 3.020576E-16   A0       = 0.7932531      
+LA0     = -6.617182E-08  WA0      = -3.465885E-07  PA0      = 4.566653E-13   
+KETA    = 0.008212548    LKETA    = -3.68978E-09   WKETA    = 9.193712E-09   
+PKETA   = 6.17341E-15    A1       = 0              A2       = 0.4            
+AGS     = -0.02          B0       = 0              B1       = 0              
+VOFF    = -0.1208311     LVOFF    = -1.302909E-08  WVOFF    = -9.948111E-08  
+PVOFF   = 2.872489E-14   NFACTOR  = 1              CIT      = -0.0004156777  
+LCIT    = 6.719108E-11   WCIT     = 1.009725E-09   PCIT     = -3.626075E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.00333688    LETA0    = 3.087445E-09   WETA0    = 3.681946E-10   
+PETA0   = 7.016713E-16   ETAB     = 0.0001007023   LETAB    = -3.305707E-10  
+WETAB   = 8.499547E-10   PETAB    = -3.554776E-16  DSUB     = 0              
+PCLM    = 3.671609       LPCLM    = -6.47862E-07   WPCLM    = 1.557674E-06   
+PPCLM   = -8.454289E-13  PDIBLC1  = 1E-05          PDIBLC2  = 0.01281507     
+LPDIBLC2= 5.824134E-09   WPDIBLC2 = -3.68014E-09   PPDIBLC2 = -5.897368E-15  
+PDIBLCB = 0.3294222      LPDIBLCB = -5.01094E-08   WPDIBLCB = -1.581679E-08  
+PPDIBLCB= 6.213565E-14   DROUT    = 0              PSCBE1   = 5.75759E+08    
+LPSCBE1 = -44.76189      WPSCBE1  = -146.1624      PPSCBE1  = 0.0001117351   
+PSCBE2  = 5.962522E-06   LPSCBE2  = -2.27759E-12   WPSCBE2  = -2.72388E-12   
+PPSCBE2 = 2.236968E-18   PVAG     = 0              DELTA    = 0.01           
+ALPHA0   = 1.59E-06      BETA0    = 38.1           KT1      = -0.5835222     
+LKT1    = -1.161556E-08  WKT1     = -3.061301E-08  PKT1     = 3.60432E-14    
+KT2     = -0.04463048    LKT2     = -3.264748E-09  WKT2     = -2.803433E-08  
+PKT2    = 1.11659E-14    AT       = 20000          UTE      = -1.667154      
+LUTE    = -2.069534E-10  WUTE     = 2.308842E-07   PUTE     = 2.450688E-13   
+UA1     = -1.436722E-09  LUA1     = -3.806295E-16  WUA1     = 1.070416E-15   
+PUA1    = 1.217426E-21   UB1      = -2.476687E-18  LUB1     = 5.683755E-25   
+WUB1    = 2.101561E-24   PUB1     = -2.094698E-30  UC1      = -9.636778E-11  
+LUC1    = 2.441888E-17   WUC1     = 1.536502E-16   PUC1     = -7.48523E-23   
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0       
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
.MODEL pch5v.4           PMOS   (                   LMIN     = '1.499E-6-dxl5'
+LMAX    = 2.001E-5       WMIN     = '7.7E-7-dxw5'  WMAX     = '1.17E-6-dxw5'
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.9557295' LVTH0    = 4.884427E-08   
+WVTH0   = 3.116557E-08   PVTH0    = -1.140061E-13  K1       = 0.6693226      
+LK1     = -3.240888E-07  WK1      = -1.175194E-07  PK1      = 3.467741E-13   
+K2      = -0.01606054    LK2      = 1.164598E-07   WK2      = 7.428276E-08   
+PK2     = -1.407353E-13  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 250000         
+UA      = 1.850968E-09   LUA      = 2.688717E-16   WUA      = -6.083722E-16  
+PUA     = 2.624381E-22   UB       = 8.384027E-20   LUB      = 2.528157E-25   
+WUB     = 1.890984E-25   PUB      = -3.961727E-31  UC       = -1.327762E-10  
+LUC     = -1.267231E-18  WUC      = 1.101427E-17   PUC      = -2.406387E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01657471     LU0      = -5.808203E-09  
+WU0     = -2.999605E-09  PU0      = 3.83479E-15    A0       = 0.5661339      
+LA0     = 3.122315E-07   WA0      = 2.821289E-07   PA0      = -2.158997E-13  
+KETA    = 0.01998528     LKETA    = -2.3772E-08    WKETA    = 1.093888E-08   
+PKETA   = 8.664371E-15   A1       = 0              A2       = 0.4            
+AGS     = 0.001796394    LAGS     = -3.587407E-08  WAGS     = -2.227533E-09  
+PAGS    = 4.448386E-14   B0       = 0              B1       = 0              
+VOFF    = -0.0809311     LVOFF    = -1.090484E-07  WVOFF    = -1.302255E-07  
+PVOFF   = 1.483656E-13   NFACTOR  = 0.9875358      LNFACTOR = 2.489104E-07   
+WNFACTOR= 1.545563E-08   PNFACTOR = -3.08649E-13   CIT      = -0.001365483   
+LCIT    = 1.493402E-10   WCIT     = 2.209467E-09   PCIT     = -6.194494E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.00124701     LETA0    = -2.538977E-09  WETA0    = -1.002646E-09  
+PETA0   = 4.918259E-15   ETAB     = 0              DSUB     = 0              
+PCLM    = 2.143896       LPCLM    = 2.543167E-06   WPCLM    = 6.208426E-07   
+PPCLM   = -1.886041E-12  PDIBLC1  = 1E-05          PDIBLC2  = 1E-05          
+PDIBLCB = 0.1665039      DROUT    = 0              PSCBE1   = 4.072621E+08   
+LPSCBE1 = 133.8164       WPSCBE1  = -7.301221      PPSCBE1  = 1.372072E-05   
+PSCBE2  = 4E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0   = 1.59E-06      BETA0    = 38.1           KT1      = -0.6166343     
+LKT1    = 5.606919E-08   WKT1     = 4.524499E-08   PKT1     = -8.448519E-14  
+KT2     = -0.0544089     LKT2     = 9.641188E-09   WKT2     = -2.14956E-08   
+PKT2    = 1.493937E-15   AT       = 20000          UTE      = -1.619068      
+LUTE    = 1.179594E-06   WUTE     = 3.062697E-07   PUTE     = -9.16017E-13   
+UA1     = -2.20055E-10   LUA1     = 5.468944E-15   WUA1     = 9.82636E-16    
+PUA1    = -5.04263E-21   UB1      = -2.241303E-18  LUB1     = -7.438034E-24  
+WUB1    = -4.180463E-25  PUB1     = 6.752572E-30   UC1      = -3.683783E-11  
+LUC1    = -6.414708E-17  WUC1     = -8.981969E-18  PUC1     = 1.013671E-22   
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0   
+CGSL    = 0              CGDL     = 0          
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
.MODEL pch5v.5           PMOS   (                   LMIN     = '7.99E-7-dxl5'  
+LMAX    = '1.499E-6-dxl5' WMIN     = '7.7E-7-dxw5' WMAX     = '1.17E-6-dxw5' 
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.9622555' LVTH0    = 5.843111E-08   
+WVTH0   = 4.652231E-09   PVTH0    = -7.505802E-14  K1       = 0.08353993     
+LK1     = 5.364261E-07   WK1      = 5.608594E-07   PK1      = -6.497645E-13  
+K2      = 0.1848359      LK2      = -1.786571E-07  WK2      = -1.633257E-07  
+PK2     = 2.083115E-13   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 357944.8       
+LVSAT   = -0.1585709     WVSAT    = -0.01212508    PVSAT    = 1.781174E-08   
+UA      = 3.018779E-09   LUA      = -1.446643E-15  WUA      = -1.409156E-15  
+PUA     = 1.43879E-21    UB       = -8.836455E-19  LUB      = 1.674052E-24   
+WUB     = 9.367518E-25   PUB      = -1.494475E-30  UC       = -1.275881E-10  
+LUC     = -8.888652E-18  WUC      = -1.580547E-17  PUC      = 1.533433E-23   
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01652614     LU0      = -5.736855E-09  
+WU0     = -3.079256E-09  PU0      = 3.951799E-15   A0       = 1.353648       
+LA0     = -8.446273E-07  WA0      = -6.035791E-07  PA0      = 1.085205E-12   
+KETA    = 0.01331002     LKETA    = -1.396604E-08  WKETA    = 5.154845E-09   
+PKETA   = 1.716112E-14   A1       = 0              A2       = 0.4            
+AGS     = -0.02550738    LAGS     = 4.235175E-09   WAGS     = 5.887372E-08   
+PAGS    = -4.527389E-14  B0       = 0              B1       = 0              
+VOFF    = -0.1608323     LVOFF    = 8.326462E-09   WVOFF    = -9.745998E-09  
+PVOFF   = -2.861878E-14  NFACTOR  = 1.426162       LNFACTOR = -3.95431E-07   
+WNFACTOR= -5.284406E-07  PNFACTOR = 4.903345E-13   CIT      = -0.001866217   
+LCIT    = 8.849176E-10   WCIT     = 2.633132E-09   PCIT     = -1.241813E-15  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.001746311   LETA0    = 1.858213E-09   WETA0    = 3.504304E-09   
+PETA0   = -1.702451E-15  ETAB     = -0.001815956   LETAB    = 2.66764E-09    
+WETAB   = 2.274278E-09   PETAB    = -3.340914E-15  DSUB     = 0              
+PCLM    = 3.265831       LPCLM    = 8.950443E-07   WPCLM    = 2.854635E-07   
+PPCLM   = -1.393369E-12  PDIBLC1  = 1E-05          PDIBLC2  = -0.01957823    
+LPDIBLC2= 2.877512E-08   WPDIBLC2 = 8.996646E-09   PPDIBLC2 = -1.321607E-14  
+PDIBLCB = 0.001539375    LPDIBLCB = 2.423329E-07   DROUT    = 0              
+PSCBE1  = 4.734281E+08   LPSCBE1  = 36.61864       WPSCBE1  = 9.988804       
+PPSCBE1 = -1.167833E-05  PSCBE2   = 4.927164E-06   LPSCBE2  = -1.362004E-12  
+WPSCBE2 = 8.210537E-15   PPSCBE2  = -1.206129E-20  PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 1.59E-06       BETA0    = 38.1             
+KT1     = -0.5764508     LKT1     = -2.960393E-09  WKT1     = -1.863816E-08  
+PKT1    = 9.359145E-15   KT2      = -0.05541309    LKT2     = 1.111635E-08   
+WKT2    = -1.734272E-08  PKT2     = -4.606652E-15  AT       = 20000          
+UTE     = -0.05696172    LUTE     = -1.115141E-06  WUTE     = -1.051183E-06  
+PUTE    = 1.078081E-12   UA1      = 8.985574E-09   LUA1     = -8.054128E-15  
+WUA1    = -7.452237E-15  PUA1     = 7.348201E-21   UB1      = -1.469278E-17  
+LUB1    = 1.085319E-23   WUB1     = 1.103065E-23   PUB1     = -1.006556E-29  
+UC1     = -2.036823E-10  LUC1     = 1.809475E-16   WUC1     = 1.951893E-16   
+PUC1    = -1.985605E-22  KT1L     = 0              PRT      = 0              
+CJ      = cjp5           MJ       = 0.5918653      PB       = 0.9191281       
+CJSW    = cjswp5         MJSW     = 0.4171692      PBSW     = 0.9191281       
+CJSWG   = cjswgp5        PBSWG    = 0.9191281      MJSWG    = 0.4171692       
+CTA     = 9.074913E-04   CTP      = 5.432845E-04   PTA      = 1.098908E-03    
+PTP     = 1.098908E-03   JS       = 3E-07          JSW      = 1E-11           
+N       = 1              XTI      = 3              CGDO     = cgop5          
+CGSO    = cgop5          CGBO     = 1E-13          CAPMOD   = 0              
+NQSMOD  = 0            
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
.MODEL pch5v.6           PMOS   (                   LMIN     = 5E-07       
+LMAX    = '7.99E-7-dxl5' WMIN     = '7.7E-7-dxw5'  WMAX     = '1.17E-6-dxw5'  
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.7761923' LVTH0    = -8.465153E-08  
+WVTH0   = -1.691516E-07  PVTH0    = 5.859709E-14   K1       = 1.37157        
+LK1     = -4.540688E-07  WK1      = -9.483084E-07  PK1      = 5.107855E-13   
+K2      = -0.2302766     LK2      = 1.405644E-07   WK2      = 3.289531E-07   
+PK2     = -1.702509E-13  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 164493.8       
+LVSAT   = -0.009807071   WVSAT    = 0.03760317     PVSAT    = -2.042928E-08  
+UA      = 1.4878E-09     LUA      = -2.693204E-16  WUA      = -6.38236E-17   
+PUA     = 4.042294E-22   UB       = 6.394267E-19   LUB      = 5.028099E-25   
+WUB     = -6.929655E-25  PUB      = -2.41223E-31   UC       = -1.543312E-10  
+LUC     = 1.16768E-17    WUC      = 2.316926E-17   PUC      = -1.463725E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01246764     LU0      = -2.615875E-09  
+WU0     = 2.687342E-10   PU0      = 1.377194E-15   A0       = -1.556174      
+LA0     = 1.393026E-06   WA0      = 2.566701E-06   PA0      = -1.35274E-12   
+KETA    = -0.02040214    LKETA    = 1.195861E-08   WKETA    = 4.467593E-08   
+PKETA   = -1.323059E-14  A1       = 0              A2       = 0.4            
+AGS     = -0.02          B0       = 0              B1       = 0              
+VOFF    = -0.1489697     LVOFF    = -7.959149E-10  WVOFF    = -6.458934E-08  
+PVOFF   = 1.355575E-14   NFACTOR  = 0.774291       LNFACTOR = 1.058576E-07   
+WNFACTOR= 2.798792E-07   PNFACTOR = -1.312634E-13  CIT      = -0.0006432424  
+LCIT    = -5.554959E-11  WCIT     = 1.291905E-09   PCIT     = -2.104091E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.00103788    LETA0    = 1.313429E-09   WETA0    = -2.482567E-09  
+PETA0   = 2.901453E-15   ETAB     = 0.004279688    LETAB    = -2.01991E-09   
+WETAB   = -4.331987E-09  PETAB    = 1.739303E-15   DSUB     = 0              
+PCLM    = 7.908727       LPCLM    = -2.675342E-06  WPCLM    = -3.696352E-06  
+PPCLM   = 1.668646E-12   PDIBLC1  = 1E-05          PDIBLC2  = 0.02224187     
+LPDIBLC2= -3.384546E-09  WPDIBLC2 = -1.536937E-08  PPDIBLC2 = 5.521394E-15   
+PDIBLCB = 0.3166667      DROUT    = 0              PSCBE1   = 1.827275E+08   
+LPSCBE1 = 260.1674       WPSCBE1  = 341.1966       PPSCBE1  = -0.0002663771  
+PSCBE2  = -1.390853E-06  LPSCBE2  = 3.496551E-12   WPSCBE2  = 6.394304E-12   
+PPSCBE2 = -4.922968E-18  PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 1.59E-06       BETA0    = 38.1           KT1      = -0.7374441     
+LKT1    = 1.208434E-07   WKT1     = 1.602501E-07   PKT1     = -1.28206E-13   
+KT2     = -0.05349141    LKT2     = 9.638577E-09   WKT2     = -1.704678E-08  
+PKT2    = -4.834228E-15  AT       = 20000          UTE      = -2.491965      
+LUTE    = 7.573771E-07   WUTE     = 1.253649E-06   PUTE     = -6.943353E-13  
+UA1     = -5.329072E-09  LUA1     = 2.953835E-15   WUA1     = 5.896931E-15   
+PUA1    = -2.917309E-21  UB1      = 4.021064E-18   LUB1     = -3.537756E-24  
+WUB1    = -5.955649E-24  PUB1     = 2.996904E-30   UC1      = 2.955649E-10   
+LUC1    = -2.029736E-16  WUC1     = -3.323463E-16  PUC1     = 2.071144E-22   
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0         
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
.MODEL pch5v.7          PMOS   (                   LMIN     = '1.499E-6-dxl5'
+LMAX    = 2.001E-05      WMIN     = 4E-07          WMAX     = '7.7E-7-dxw5'        
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.6911281' LVTH0    = -3.301765E-07  
+WVTH0   = -1.910996E-07  PVTH0    = 2.043714E-13   K1       = 0.4857461      
+LK1     = 1.684101E-07   WK1      = 3.668485E-08   PK1      = -6.692508E-14  
+K2      = 0.05562971     LK2      = -7.928303E-08  WK2      = 1.406294E-08   
+PK2     = 2.368873E-14   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 250000         
+UA      = 1.007542E-09   LUA      = 9.355055E-16   WUA      = 1.00106E-16    
+PUA     = -2.975345E-22  UB       = 3.79331E-19    LUB      = -2.841932E-25  
+WUB     = -5.911388E-26  PUB      = 5.491486E-32   UC       = -1.357752E-10  
+LUC     = -7.652602E-17  WUC      = 1.353342E-17   PUC      = 3.915352E-23   
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01281356     LU0      = -2.091485E-09  
+WU0     = 1.59761E-10    PU0      = 7.127459E-16   A0       = 0.9185383      
+LA0     = -1.275971E-08  WA0      = -1.389084E-08  PA0      = 5.709293E-14   
+KETA    = 0.03463874     LKETA    = -1.530537E-08  WKETA    = -1.370024E-09  
+PKETA   = 1.5524E-15     A1       = 0              A2       = 0.4            
+AGS     = -0.001796395   LAGS     = 3.587407E-08   WAGS     = 7.904147E-10   
+PAGS    = -1.578459E-14  B0       = 0              B1       = 0              
+VOFF    = -0.1833996     LVOFF    = 1.177222E-08   WVOFF    = -4.415194E-08  
+PVOFF   = 4.687627E-14   NFACTOR  = 1.007752       LNFACTOR = -1.54811E-07   
+WNFACTOR= -1.52614E-09   PNFACTOR = 3.047709E-14   CIT      = -9.461471E-06  
+LCIT    = 7.450593E-10   WCIT     = 1.070409E-09   PCIT     = -1.119854E-15  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.000127424   LETA0    = 6.224441E-09   WETA0    = 1.518782E-10   
+PETA0   = -2.443012E-15  ETAB     = 0              DSUB     = 0              
+PCLM    = 3.897565       LPCLM    = -9.305222E-07  WPCLM    = -8.522398E-07  
+PPCLM   = 1.031859E-12   PDIBLC1  = 1E-05          PDIBLC2  = 1E-05          
+PDIBLCB = 0.5618977      LPDIBLCB = -5.808335E-07  WPDIBLCB = -3.321308E-07  
+PPDIBLCB= 4.879002E-13   DROUT    = 0              PSCBE1   = 3.998796E+08   
+LPSCBE1 = 149.1966       WPSCBE1  = -1.099937      PPSCBE1  = 8.013918E-07   
+PSCBE2  = 4E-06          PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 1.59E-06       BETA0    = 38.1            KT1      = -0.572084      
+LKT1    = -1.230202E-08  WKT1     = 7.822672E-09   PKT1     = -2.705336E-14  
+KT2     = -0.131172      LKT2     = 6.698755E-08   WKT2     = 4.298541E-08   
+PKT2    = -4.6677E-14    AT       = 20000          UTE      = -0.8219269     
+LUTE    = -4.208319E-07  WUTE     = -3.633292E-07  PUTE     = 4.283407E-13   
+UA1     = 3.174783E-09   LUA1     = -3.303018E-15  WUA1     = -1.869028E-15  
+PUA1    = 2.325819E-21   UB1      = -4.876956E-18  LUB1     = 3.478977E-24   
+WUB1    = 1.795903E-24   PUB1     = -2.417718E-30  UC1      = -6.214586E-11  
+LUC1    = 1.681279E-16   WUC1     = 1.227679E-17   PUC1     = -9.374384E-23  
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5        
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0         
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
.MODEL pch5v.8          PMOS   (                   LMIN     = '7.99E-7-dxl5'  
+LMAX    = '1.499E-6-dxl5' WMIN     = 4E-07         WMAX     = '7.7E-7-dxw5'        
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.7559578' LVTH0    = -2.349416E-07  
+WVTH0   = -1.686379E-07  PVTH0    = 1.713751E-13   K1       = 0.8586998      
+LK1     = -3.794587E-07  WK1      = -9.02749E-08   PK1      = 1.195788E-13   
+K2      = -0.08751772    LK2      = 1.310006E-07   WK2      = 6.54514E-08    
+PK2     = -5.180092E-14  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 351434.8       
+LVSAT   = -0.1490077     WVSAT    = -0.006656683   PVSAT    = 9.778675E-09   
+UA      = 1.025168E-09   LUA      = 9.096127E-16   WUA      = 2.654774E-16   
+PUA     = -5.40465E-22   UB       = 2.49931E-19    LUB      = -9.410452E-26  
+WUB     = -1.545255E-26  PUB      = -9.223641E-33  UC       = -2.169359E-10  
+LUC     = 4.269907E-17   WUC      = 5.924675E-17   PUC      = -2.799936E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01183421     LU0      = -6.528278E-10  
+WU0     = 8.619602E-10   PU0      = -3.187846E-16  A0       = 0.6861333      
+LA0     = 3.286432E-07   WA0      = -4.286646E-08  PA0      = 9.965813E-14   
+KETA    = 0.02286749     LKETA    = 1.986597E-09   WKETA    = -2.873428E-09  
+PKETA   = 3.760899E-15   A1       = 0              A2       = 0.4            
+AGS     = 0.06945024     LAGS     = -6.878722E-08  WAGS     = -2.089068E-08  
+PAGS    = 1.606493E-14   B0       = 0              B1       = 0              
+VOFF    = -0.1564997     LVOFF    = -2.774378E-08  WVOFF    = -1.33854E-08   
+PVOFF   = 1.680225E-15   NFACTOR  = 0.723247       LNFACTOR = 2.63127E-07    
+WNFACTOR= 6.200785E-08   PNFACTOR = -6.285433E-14  CIT      = 0.0009637302   
+LCIT    = -6.845593E-10  WCIT     = 2.559768E-10   PCIT     = 7.654782E-17   
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.007277686    LETA0    = -4.653666E-09  WETA0    = -4.075855E-09  
+PETA0   = 3.767528E-15   ETAB     = 0.001872186    LETAB    = -2.750242E-09  
+WETAB   = -8.23762E-10   PETAB    = 1.210106E-15   DSUB     = 0              
+PCLM    = 4.107652       LPCLM    = -1.23914E-06   WPCLM    = -4.216659E-07  
+PPCLM   = 3.993457E-13   PDIBLC1  = 1E-05          PDIBLC2  = -0.01097314    
+LPDIBLC2= 1.613423E-08   WPDIBLC2 = 1.768365E-09   PPDIBLC2 = -2.597728E-15  
+PDIBLCB = 0.001539355    LPDIBLCB = 2.423329E-07   DROUT    = 0              
+PSCBE1  = 4.809114E+08   LPSCBE1  = 30.16101       WPSCBE1  = 3.702861       
+PPSCBE1 = -6.253917E-06  PSCBE2   = 4.919525E-06   LPSCBE2  = -1.350782E-12  
+WPSCBE2 = 1.462738E-14   PPSCBE2  = -2.148756E-20  PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 1.59E-06       BETA0    = 38.1             
+KT1     = -0.6301779     LKT1     = 7.303795E-08   WKT1     = 2.649259E-08   
+PKT1    = -5.447947E-14  KT2      = -0.1088244     LKT2     = 3.415893E-08   
+WKT2    = 2.752281E-08   PKT2     = -2.396243E-14  AT       = 20000          
+UTE     = -1.178042      LUTE     = 1.023011E-07   WUTE     = -1.094755E-07  
+PUTE    = 5.542959E-14   UA1      = -3.309064E-10  LUA1     = 1.846838E-15   
+WUA1    = 3.736072E-16   PUA1     = -9.686116E-22  UB1      = -1.143205E-19  
+LUB1    = -3.517334E-24  WUB1     = -1.215266E-24  PUB1     = 2.005688E-30   
+UC1     = 1.845119E-10   LUC1     = -1.942125E-16  WUC1     = -1.308939E-16  
+PUC1    = 1.165738E-22   KT1L     = 0              PRT      = 0              
+CJ      = cjp5           MJ       = 0.5918653      PB       = 0.9191281       
+CJSW    = cjswp5         MJSW     = 0.4171692      PBSW     = 0.9191281       
+CJSWG   = cjswgp5        PBSWG    = 0.9191281      MJSWG    = 0.4171692       
+CTA     = 9.074913E-04   CTP      = 5.432845E-04   PTA      = 1.098908E-03    
+PTP     = 1.098908E-03   JS       = 3E-07          JSW      = 1E-11           
+N       = 1              XTI      = 3              CGDO     = cgop5           
+CGSO    = cgop5          CGBO     = 1E-13          CAPMOD   = 0               
+NQSMOD  = 0               
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
.MODEL pch5v.9          PMOS   (                   LMIN     = 5E-07       
+LMAX    = '7.99E-7-dxl5' WMIN     = 4E-07          WMAX     = '7.7E-7-dxw5'       
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-1.05049' LVTH0    = -8.446331E-09  
+WVTH0   = 5.688857E-08   PVTH0    = -2.054724E-15  K1       = 0.003941454    
+LK1     = 2.778505E-07   WK1      = 2.080411E-07   PK1      = -1.098263E-13  
+K2      = 0.2069951      LK2      = -9.54798E-08   WK2      = -4.093539E-08  
+PK2     = 3.001053E-14   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 180665.8       
+LVSAT   = -0.01768632    WVSAT    = 0.02399416     PVSAT    = -1.379183E-08  
+UA      = 1.900721E-09   LUA      = 2.363122E-16   WUA      = -3.524031E-16  
+PUA     = -6.531499E-23  UB       = -6.630692E-19  LUB      = 6.079927E-25   
+WUB     = 3.589906E-25   PUB      = -2.971704E-31  UC       = -1.749569E-10  
+LUC     = 1.041722E-17   WUC      = 3.958383E-17   PUC      = -1.287858E-23  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01216804     LU0      = -9.095401E-10  
+WU0     = 6.508881E-10   PU0      = -1.564702E-16  A0       = 1.626217       
+LA0     = -3.942812E-07  WA0      = -1.310711E-07  PA0      = 1.674875E-13   
+KETA    = 0.03198134     LKETA    = -5.021957E-09  WKETA    = 1.306071E-09   
+PKETA   = 5.468645E-16   A1       = 0              A2       = 0.4            
+AGS     = 0.04998621     LAGS     = -5.38194E-08   WAGS     = -6.053808E-08  
+PAGS    = 4.655379E-14   B0       = 0              B1       = 0              
+VOFF    = -0.2536477     LVOFF    = 4.696307E-08   WVOFF    = 2.322899E-08   
+PVOFF   = -2.647625E-14  NFACTOR  = 0.9951191      LNFACTOR = 5.405748E-08   
+WNFACTOR= 9.869763E-08   PNFACTOR = -9.106879E-14  CIT      = 0.001803401    
+LCIT    = -1.330266E-09  WCIT     = -7.73879E-10   PCIT     = 8.68507E-16    
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = -0.009129522   LETA0    = 7.963479E-09   WETA0    = 4.552336E-09   
+PETA0   = -2.867552E-15  ETAB     = -0.001755033   LETAB    = 3.909029E-11   
+WETAB   = 6.729053E-10   PETAB    = 5.91692E-17    DSUB     = 0              
+PCLM    = 4.350771       LPCLM    = -1.426099E-06  WPCLM    = -7.42622E-07   
+PPCLM   = 6.461609E-13   PDIBLC1  = 1E-05          PDIBLC2  = 0.0189807      
+LPDIBLC2= -6.900272E-09  WPDIBLC2 = -1.305042E-08  PPDIBLC2 = 8.797919E-15   
+PDIBLCB = 0.3166667      DROUT    = 0              PSCBE1   = 5.443244E+08   
+LPSCBE1 = -18.60364      WPSCBE1  = 28.35675       PPSCBE1  = -2.521276E-05  
+PSCBE2  = 5.613119E-06   LPSCBE2  = -1.884156E-12  WPSCBE2  = 3.363147E-13   
+PPSCBE2 = -2.688652E-19  PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 1.59E-06       BETA0    = 38.1           KT1      = -0.4679415     
+LKT1    = -5.172181E-08  WKT1     = -6.997941E-08  PKT1     = 1.970749E-14   
+KT2     = -0.07928754    LKT2     = 1.144506E-08   WKT2     = 3.764305E-09   
+PKT2    = -5.69214E-15   AT       = 20000          UTE      = -0.9182776     
+LUTE    = -9.745755E-08  WUTE     = -7.797928E-08  PUTE     = 3.120901E-14   
+UA1     = 3.809601E-09   LUA1     = -1.337212E-15  WUA1     = -1.779972E-15  
+PUA1    = 6.874909E-22   UB1      = -5.310044E-18  LUB1     = 4.781767E-25   
+WUB1    = 1.852451E-24   PUB1     = -3.533857E-31  UC1      = -1.558241E-10  
+LUC1    = 6.750598E-17   WUC1     = 5.171863E-17   PUC1     = -2.385518E-23  
+KT1L    = 0              PRT      = 0              CJ       = cjp5           
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0         
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
.MODEL pch5v.10          PMOS   (                   LMIN     = '1.499E-6-dxl5'
+LMAX    = 2.001E-5       WMIN     = '1.997E-5-dxw5' WMAX     = 2.001E-4     
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.8849104' LVTH0    = -6.622562E-08  
+WVTH0   = -1.679487E-07  PVTH0    = 1.169946E-13   K1       = 0.5758475      
+LK1     = -4.990018E-08  WK1      = 3.080525E-07   PK1      = -3.941364E-13  
+K2      = 0.02795582     LK2      = 3.846253E-09   WK2      = -7.905745E-08  
+PK2     = 1.580462E-13   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 250000         
+UA      = 2.976149E-09   LUA      = -1.239415E-16  WUA      = -2.729345E-15  
+PUA     = -8.056275E-21  UB       = 2.606768E-19   LUB      = 1.254309E-24   
+WUB     = -6.864042E-25  PUB      = -7.719348E-30  UC       = -7.347462E-11  
+LUC     = 5.275082E-17   WUC      = 1.428056E-16   PUC      = -1.188474E-21  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.0239402      LU0      = -5.813847E-09  
+WU0     = -2.669838E-08  PU0      = -6.363981E-15  A0       = 0.5891396      
+LA0     = 7.901615E-08   WA0      = 3.027711E-07   PA0      = 9.22376E-13    
+KETA    = 0.006479424    LKETA    = -6.545282E-09  WKETA    = 4.852363E-08   
+PKETA   = -2.421496E-14  A1       = 0              A2       = 0.4            
+AGS     = 0.02           B0       = 0              B1       = 0              
+VOFF    = -0.1393334     LVOFF    = 4.296506E-09   WVOFF    = -1.67683E-07   
+PVOFF   = 1.226157E-14   NFACTOR  = 1              CIT      = -0.0004015814  
+LCIT    = 1.853413E-10   WCIT     = -7.574682E-10  PCIT     = -8.794559E-16  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.000408737    LETA0    = 7.843416E-10   WETA0    = -5.189333E-10  
+PETA0   = -2.307201E-15  ETAB     = 0              DSUB     = 0              
+PCLM    = 2.628847       LPCLM    = 1.132336E-06   WPCLM    = 1.859616E-06   
+PPCLM   = -4.695848E-12  PDIBLC1  = 1E-05          PDIBLC2  = 6.191629E-06   
+LPDIBLC2= 7.605314E-11   WPDIBLC2 = 6.171261E-12   PPDIBLC2 = -1.232401E-16  
+PDIBLCB = 0.1545808      LPDIBLCB = 2.381041E-07   DROUT    = 0              
+PSCBE1  = 3.929193E+08   LPSCBE1  = 157.3016       WPSCBE1  = 29.54466       
+PPSCBE1 = -4.340109E-05  PSCBE2   = 4E-06          PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 1.59E-06       BETA0    = 38.1            
+KT1     = -0.6075875     LKT1     = 1.7914E-08     WKT1     = 1.552733E-07   
+PKT1    = -2.677413E-13  KT2      = -0.06143443    LKT2     = 9.468775E-09   
+WKT2    = 9.2025E-08     PKT2     = -5.289813E-14  AT       = 20000          
+UTE     = -1.907628      LUTE     = -4.694281E-07  WUTE     = 1.434607E-06   
+PUTE    = 1.582678E-11   UA1      = -1.939577E-09  LUA1     = -4.208563E-15  
+WUA1    = 9.980528E-16   PUA1     = 1.056329E-19   UB1      = -2.032514E-18  
+LUB1    = 1.983137E-24   WUB1     = 3.924746E-24   PUB1     = -6.0697E-29    
+UC1     = -8.419405E-11  LUC1     = 7.87408E-17    WUC1     = -6.022131E-16  
+PUC1    = -4.001229E-23  KT1L     = 0              PRT      = 0              
+CJ      = cjp5           MJ       = 0.5918653      PB       = 0.9191281       
+CJSW    = cjswp5         MJSW     = 0.4171692      PBSW     = 0.9191281       
+CJSWG   = cjswgp5        PBSWG    = 0.9191281      MJSWG    = 0.4171692       
+CTA     = 9.074913E-04   CTP      = 5.432845E-04   PTA      = 1.098908E-03    
+PTP     = 1.098908E-03   JS       = 3E-07          JSW      = 1E-11           
+N       = 1              XTI      = 3              CGDO     = cgop5           
+CGSO    = cgop5          CGBO     = 1E-13          CAPMOD   = 0              
+NQSMOD  = 0  
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
*
.MODEL pch5v.11          PMOS   (                    LMIN     = '7.99E-07-dxl5'
+LMAX    = '1.499E-6-dxl5' WMIN     = '1.997E-5-dxw5' WMAX     = 2.001E-4
+XL      = '5E-8+dxl5'    XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0              
+DWB     = 0              VTH0     ='dvtp5-0.9153744' LVTH0    = -2.147401E-08  
+WVTH0   = -2.03545E-07   PVTH0    = 1.692855E-13   K1       = 0.5528132      
+LK1     = -1.606276E-08  WK1      = -1.37768E-07   PK1      = 2.607739E-13   
+K2      = 0.02925912     LK2      = 1.931704E-09   WK2      = 9.410428E-08   
+PK2     = -9.632835E-14  K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 242953         
+LVSAT   = 0.01035198     WVSAT    = 1.409532       PVSAT    = -2.070602E-06  
+UA      = 1.472187E-09   LUA      = 2.085379E-15   WUA      = 2.312739E-14   
+PUA     = -4.603982E-20  UB       = -1.006454E-18  LUB      = 3.115724E-24   
+WUB     = 3.080102E-23   PUB      = -5.397437E-29  UC       = -2.047546E-10  
+LUC     = 2.456012E-16   WUC      = 2.429378E-15   PUC      = -4.547448E-21  
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.01998619     LU0      = -5.412892E-12  
+WU0     = 1.388596E-08   PU0      = -6.598236E-14  A0       = 0.8375726      
+LA0     = -2.859318E-07  WA0      = -3.634267E-06  PA0      = 6.705885E-12   
+KETA    = 0.01315118     LKETA    = -1.634609E-08  WKETA    = -2.05288E-07   
+PKETA   = 3.486343E-13   A1       = 0              A2       = 0.4            
+AGS     = 0.01510715     LAGS     = 7.187596E-09   WAGS     = 9.786677E-07   
+PAGS    = -1.437663E-12  B0       = 0              B1       = 0              
+VOFF    = -0.1499594     LVOFF    = 1.990614E-08   WVOFF    = 3.549223E-08   
+PVOFF   = -2.862028E-13  NFACTOR  = 1              CIT      = -0.0003702836  
+LCIT    = 1.393648E-10   WCIT     = -3.716129E-10  PCIT     = -1.446277E-15  
+CDSC    = 0              CDSCB    = 0              CDSCD    = 0              
+ETA0    = 0.0003770267   LETA0    = 8.309242E-10   WETA0    = 1.137017E-08   
+PETA0   = -1.97723E-14   ETAB     = 2.348564E-05   LETAB    = -3.450041E-11  
+WETAB   = 6.350206E-09   PETAB    = -9.328452E-15  DSUB     = 0              
+PCLM    = 4.451365       LPCLM    = -1.544945E-06  WPCLM    = -1.182484E-05  
+PPCLM   = 1.540662E-11   PDIBLC1  = 1E-05          PDIBLC2  = -0.01452782    
+LPDIBLC2= 2.142652E-08   WPDIBLC2 = -1.429853E-07  PPDIBLC2 = 2.099313E-13   
+PDIBLCB = 0.3720123      LPDIBLCB = -8.130272E-08  WPDIBLCB = -2.677206E-08  
+PPDIBLCB= 3.932806E-14   DROUT    = 0              PSCBE1   = 4.915028E+08   
+LPSCBE1 = 12.48244       WPSCBE1  = -215.1605      PPSCBE1  = 0.0003160707   
+PSCBE2  = 4.92887E-06    LPSCBE2  = -1.364509E-12  WPSCBE2  = 3.180669E-12   
+PPSCBE2 = -4.672404E-18  PVAG     = 0              DELTA    = 0.01           
+ALPHA0  = 1.59E-06       BETA0    = 38.1           KT1      = -0.6199079     
+LKT1    = 3.601262E-08   WKT1     = 4.879876E-07   PKT1     = -7.564985E-13  
+KT2     = -0.06023815    LKT2     = 7.711447E-09   WKT2     = 1.03023E-07    
+PKT2    = -6.905414E-14  AT       = 20000          UTE      = -2.628069      
+LUTE    = 5.889002E-07   WUTE     = 2.072698E-05   PUTE     = -1.251371E-11  
+UA1     = -6.258454E-09  LUA1     = 2.135867E-15   WUA1     = 1.15975E-13    
+PUA1    = -6.326824E-20  UB1      = 1.073091E-17   LUB1     = -1.676633E-23  
+WUB1    = -2.832878E-22  PUB1     = 3.612182E-28   UC1      = 5.859935E-10   
+LUC1    = -9.057647E-16  WUC1     = -1.29902E-14   PUC1     = 1.815794E-20   
+KT1L    = 0              PRT      = 0              CJ       = cjp5            
+MJ      = 0.5918653      PB       = 0.9191281      CJSW     = cjswp5          
+MJSW    = 0.4171692      PBSW     = 0.9191281      CJSWG    = cjswgp5         
+PBSWG   = 0.9191281      MJSWG    = 0.4171692      CTA      = 9.074913E-04    
+CTP     = 5.432845E-04   PTA      = 1.098908E-03   PTP      = 1.098908E-03    
+JS      = 3E-07          JSW      = 1E-11          N        = 1               
+XTI     = 3              CGDO     = cgop5          CGSO     = cgop5           
+CGBO    = 1E-13          CAPMOD   = 0              NQSMOD   = 0         
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
.MODEL pch5v.12          PMOS   (                    LMIN     = 5E-7     
+LMAX    = '7.99E-7-dxl5' WMIN     = '1.997E-5-dxw5' WMAX     = 2.001E-4     
+XL      = '5E-08+dxl5'   XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdifp5         RSH      = 2.6            
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxp5          XJ       = 1E-07          
+NCH     = 4.3968E+16     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 4E-08          
+LL      = 0              LW       = 0              LWL      = 0              
+WINT    = 4E-08          WL       = 0              WW       = 0              
+WWL     = 0              MOBMOD   = 1              BINUNIT  = 2              
+TLEV    = 1              TLEVC    = 1              DWG      = 0
+DWB     = 0              VTH0     ='dvtp5-0.9350784' LVTH0    = -6.321656E-09  
+WVTH0   = 1.174595E-07   PVTH0    = -7.756701E-14  K1       = 0.4961229      
+LK1     = 2.753206E-08   WK1      = 5.728643E-07   PK1      = -2.857024E-13  
+K2      = 0.05261638     LK2      = -1.603003E-08  WK2      = -1.78E-07      
+PK2     = 1.129198E-13   K3       = 0              DVT0     = 0              
+DVT1    = 0              DVT2     = 0              DVT0W    = 0              
+DVT1W   = 0              DVT2W    = 0              NLX      = 0              
+W0      = 0              K3B      = 0              VSAT     = 428933.2       
+LVSAT   = -0.1326668     WVSAT    = -3.02009       PVSAT    = 1.335778E-06   
+UA      = 6.389647E-09   LUA      = -1.696149E-15  WUA      = -8.308323E-14  
+PUA     = 3.563615E-20   UB       = 5.201392E-18   LUB      = -1.65811E-24   
+WUB     = -8.738225E-23  PUB      = 3.690857E-29   UC       = 3.367139E-10   
+LUC     = -1.707881E-16  WUC      = -8.039176E-15  PUC      = 3.502871E-21   
+RDSW    = 1200           PRWB     = 0              PRWG     = 0              
+WR      = 1              U0       = 0.02590158     LU0      = -4.554344E-09  
+WU0     = -1.454208E-07  PU0      = 5.652454E-14   A0       = 0.1109957      
+LA0     = 2.728058E-07   WA0      = 1.332585E-05   PA0      = -6.336447E-12  
+KETA    = -0.02410526    LKETA    = 1.230411E-08   WKETA    = 6.568426E-07   
+PKETA   = -3.143442E-13  A1       = 0              A2       = 0.4            
+AGS     = 0.02445383     WAGS     = -8.908547E-07  B0       = 0              
+B1      = 0              VOFF     = -0.1036549     LVOFF    = -1.570199E-08  
+WVOFF   = -4.436917E-07  PVOFF    = 8.228967E-14   NFACTOR  = 1              
+CIT     = -0.0002477768  LCIT     = 4.515706E-11   WCIT     = -2.355011E-09  
+PCIT    = 7.895563E-17   CDSC     = 0              CDSCB    = 0              
+CDSCD   = 0              ETA0     = -0.001509612   LETA0    = 2.28175E-09    
+WETA0   = -3.625027E-08  PETA0    = 1.684782E-14   ETAB     = 0.0009983609   
+LETAB   = -7.841795E-10  WETAB    = -1.713912E-08  PETAB    = 8.734843E-15   
+DSUB    = 0              PCLM     = 2.852514       LPCLM    = -3.154274E-07  
+WPCLM   = 1.797234E-05   PPCLM    = -7.507416E-12  PDIBLC1  = 1E-05          
+PDIBLC2 = -0.005376238   LPDIBLC2 = 1.438895E-08   WPDIBLC2 = 3.608737E-07   
+PPDIBLC2= -1.775363E-13  PDIBLCB  = 0.3995473      LPDIBLCB = -1.024771E-07  
+WPDIBLCB= -1.421124E-06  PPDIBLCB = 1.111584E-12   DROUT    = 0              
+PSCBE1  = 5.151715E+08   LPSCBE1  = -5.718817      WPSCBE1  = 1068.011       
+PPSCBE1 = -0.0006706883  PSCBE2   = 3.723871E-06   LPSCBE2  = -4.378653E-13  
+WPSCBE2 = 4.21387E-11    PPSCBE2  = -3.463113E-17  PVAG     = 0              
+DELTA   = 0.01           ALPHA0   = 1.59E-06       BETA0    = 38.1       
+KT1     = -0.5290989     LKT1     = -3.381941E-08  WKT1     = -1.121254E-06  
+PKT1    = 4.810084E-13   KT2      = -0.04552927    LKT2     = -3.599683E-09  
+WKT2    = -1.002265E-08  PKT2     = 1.787794E-14   AT       = 20000          
+UTE     = -2.565668      LUTE     = 5.409139E-07   WUTE     = 1.82371E-05    
+PUTE    = -1.059899E-11  UA1      = -5.47755E-09   LUA1     = 1.535352E-15   
+WUA1    = 8.204861E-14   PUA1     = -3.717884E-20  UB1      = -2.802661E-17  
+LUB1    = 1.30382E-23    WUB1     = 5.141219E-22   PUB1     = -2.519899E-28  
+UC1     = -1.533849E-09  LUC1     = 7.243943E-16   WUC1     = 2.896078E-14   
+PUC1    = -1.410236E-20  KT1L     = 0              PRT      = 0              
+CJ      = cjp5           MJ       = 0.5918653      PB       = 0.9191281       
+CJSW    = cjswp5         MJSW     = 0.4171692      PBSW     = 0.9191281       
+CJSWG   = cjswgp5        PBSWG    = 0.9191281      MJSWG    = 0.4171692       
+CTA     = 9.074913E-04   CTP      = 5.432845E-04   PTA      = 1.098908E-03    
+PTP     = 1.098908E-03   JS       = 3E-07          JSW      = 1E-11          
+N       = 1              XTI      = 3              CGDO     = cgop5           
+CGSO    = cgop5          CGBO     = 1E-13          CAPMOD   = 0               
+NQSMOD  = 0        
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NLEV    = 3              AF       = 1.2            KF       = 1.0E-23  )
*
*
*
*                                                    
*                                                                               
**************************************************************************
*                                                                               
*
*
*
*
***************************************************************
*                                                             *
*                                                             *
*                MODEL OF 5V NMOS WITH ESD IMPLANT            *
*                                                             *
*                                                             *
*                                                             *
***************************************************************
*
*
*  NOTE : 1. Users should specify NRS/NRD in their netlists  
*            because of the asymmetric "RPO edge to poly gate"
*            rule in source/drain. Also, the resistance of heavily
*            doped diffusion consists of two different parts:
*            (a) RPO edge to poly gate, RSH=41.9 ohm/sq (b) RPO edge
*            to CONTACT center, RSH=3.5 ohm/sq. Part (b) is so 
*            small that it can be ignored in effective source/drain 
*            resistance calculation. That is,
*             
*            NRS = (length of RPO edge to poly gate at source side)/ width, and
*            NRD = (length of RPO edge to poly gate at drain side)/ width.    
*
*
.MODEL   esd5v          NMOS   (                    LMIN     = 8E-07          
+LMAX    = 2E-06          WMIN     = 2E-05          WMAX     = 0.0002         
+XL      = '5E-08+dxl5'   XW       = '1.5E-7+dxw5'  LEVEL    = 49             
+TNOM    = 25             VERSION  = 3.1            ACM      = 12             
+LDIF    = 1.2E-07        HDIF     = hdife5         RSH      = 41.8951        
+RD      = 0              RS       = 0              XPART    = 1           
+CF      = 0              TOX      = toxe5          XJ       = 1.8E-07        
+NCH     = 1.2451E+17     LLN      = 1              LWN      = 1              
+WLN     = 1              WWN      = 1              LINT     = 6.75E-08       
+WINT    = 6.35E-08       MOBMOD   = 1              BINUNIT  = 2              
+DWG     = 0              DWB      = 0              VTH0     = 'dvte5+0.7374289'      
+LVTH0   = 1.097373E-07   WVTH0    = 1.426343E-06   PVTH0    = -1.177005E-12  
+K1      = 0.6732051      LK1      = 1.655992E-07   WK1      = 6.455538E-06   
+PK1     = -3.616901E-12  K2       = 0.1576376      LK2      = -6.735815E-08  
+WK2     = -2.194884E-06  PK2      = 1.346018E-12   K3       = 0              
+DVT0    = 0              DVT1     = 0              DVT2     = 0              
+DVT0W   = 0              DVT1W    = 0              DVT2W    = 0              
+NLX     = 0              W0       = 0              K3B      = 0              
+VSAT    = 123330.7       WVSAT    = -0.666047      UA       = -3.811411E-10  
+LUA     = 1.021867E-17   WUA      = 8.449502E-15   PUA      = -1.078087E-20  
+UB      = 2.056772E-18   LUB      = 2.767265E-24   WUB      = -3.413875E-24  
+PUB     = -4.790668E-29  UC       = 5.207334E-11   LUC      = 2.471822E-16   
+WUC     = 2.81753E-16    PUC      = -5.019232E-21  RDSW     = 960            
+PRWB    = 0              PRWG     = -0.0001028636  LPRWG    = -9.959767E-12  
+WPRWG   = -1.658605E-08  PPRWG    = 1.991683E-15   WR       = 1              
+U0      = 0.0387462      LU0      = 9.764158E-09   WU0      = 2.231571E-07   
+PU0     = -2.09398E-13   A0       = 0.8724309      LA0      = -1.428881E-07  
+WA0     = -7.930767E-06  PA0      = 1.265256E-11   KETA     = -0.01          
+A1      = 1E-20          A2       = 1              AGS      = 0              
+B0      = 0              B1       = 0              VOFF     = -0.04738585    
+LVOFF   = -2.2712E-08    WVOFF    = -1.72452E-06   PVOFF    = 1.205467E-12   
+NFACTOR = 1.098234       LNFACTOR = 1.227385E-07   WNFACTOR = -3.479273E-06  
+PNFACTOR= 1.420206E-12   CIT      = 0              CDSC     = 0              
+CDSCB   = 0              CDSCD    = 0              ETA0     = 0.0001656895   
+LETA0   = -2.167476E-10  WETA0    = -2.050201E-08  PETA0    = 3.805338E-14   
+ETAB    = -0.0005251663  LETAB    = 1.879336E-11   WETAB    = 5.455993E-10   
+PETAB   = -6.167495E-16  DSUB     = 0              PCLM     = 1.062597       
+LPCLM   = -1.193105E-07  WPCLM    = -1.251777E-05  PPCLM    = 2.385886E-11   
+PDIBLC1 = 1E-20          PDIBLC2  = 0.005          PDIBLCB  = 0              
+DROUT   = 0              PSCBE1   = 3.856489E+08   LPSCBE1  = -28.34423      
+WPSCBE1 = -281.4534      PPSCBE1  = -0.0002936242  PSCBE2   = 5.601866E-05   
+LPSCBE2 = -1.86425E-11   WPSCBE2  = 2.401364E-10   PPSCBE2  = -5.101851E-16  
+PVAG    = 1              DELTA    = 0.0001         ALPHA0   = 0              
+BETA0   = 30             KT1      = -0.3530317     LKT1     = -2.95061E-08   
+WKT1    = -7.805656E-07  PKT1     = 5.197041E-13   KT2      = -0.03836057    
+LKT2    = -6.24923E-09   WKT2     = -1.626546E-07  PKT2     = 1.745677E-13   
+AT      = 7078.098       LAT      = 0.0006602349   WAT      = 0.02942634     
+PAT     = -3.112004E-08  UTE      = -0.8467374     LUTE     = 8.474345E-08   
+WUTE    = -1.594635E-05  PUTE     = 4.580869E-12   UA1      = 1.897719E-09   
+LUA1    = 4.612271E-15   WUA1     = -1.185229E-14  PUA1     = -6.796615E-20  
+UB1     = -1.393512E-18  LUB1     = -7.612578E-24  WUB1     = -2.796271E-23  
+PUB1    = 1.575625E-28   UC1      = -1.423587E-10  LUC1     = 1.865505E-17   
+WUC1    = 1.030472E-15   PUC1     = 1.239864E-21   KT1L     = 0              
+PRT     = 0              TLEV     = 1              TLEVC    = 1            
+CJ      = cje5           MJ       = 0.5239749      PB       = 0.985          
+CJSW    = cjswe5         MJSW     = 0.3820152      PBSW     = 0.985          
+CJSWG   = cjswge5        MJSWG    = 0.3820152      PBSWG    = 0.985         
+CTA     = 8.222091E-4    CTP      = 5.361624E-4    PTA      = 1.16752E-3    
+PTP     = 1.16752E-3     JS       = 1E-06          JSW      = 2E-11          
+N       = 1              XTI      = 3              CGDO     = cgoe5     
+CGSO    = cgoe5          CGBO     = 1E-13          CAPMOD   = 0              
+CALCACM = 1              SFVTFLAG = 0              VFBFLAG  = 1
+NQSMOD  = 0            ) 
*
**************************************************************************
*
.ENDL MOS_5V
*
***************************************************************
*                                                             *
*        MODEL OF P+/NW/PSUB VERTICAL PNP10X10 BIPOLAR        *  
*                 EMITTER AREA :  10X10   UM^2                *
*                   BASE  AREA :  28X28   UM^2                *
*                                                             *
***************************************************************  
.LIB BIP                                                                        
.MODEL PNP10 PNP (                                  LEVEL  = 1                  
+ BF     = 3.524           NF     = 0.98            IS     = 8E-18              
+ ISC    = 8E-18           ISE    = 8E-18           NE     = 1.18               
+ RB     = 65              IRB    = 1.375031E-3     RBM    = 0.1674751          
+ RE     = 0.06            IKF    = 2.11E-3         NKF    = 0.7                
+ VAF    = 170             BR     = 0.0126          NR     = 0.9738             
+ NC     = 1.6             RC     = 22              IKR    = 9E-3               
+ VAR    = 10.3            TBF1   = 4.5E-3          TBF2   = 7E-6               
+ TNE1   = 1E-3            TNE2   = -7E-7           TNF1   = -1E-5              
+ TNF2   = -3E-6           TRB1   = 2.086219E-4     TIRB1  = 2.877522E-4        
+ TRM1   = 9.44068E-6      TRE1   = -2.2324E-5      TIKF1  = -1.349389E-3       
+ TIKF2  = 9.954791E-6     TVAF1  = 5.3E-5          TBR1   = -6E-5              
+ TBR2   = 3E-6            TNR1   = 1E-4            TNR2   = -4E-6              
+ TNC1   = -4.507315E-4    TNC2   = 2E-6            XTB    = 0                  
+ XTI    = 3               TRC1   = 1E-3            TIKR1  = -1E-5              
+ EG     = 1.18            CJE    = 1.41674E-13     VJE    = 0.9212359          
+ MJE    = 0.5470712       FC     = 0.5             CJC    = 8.453176E-14       
+ VJC    = 0.5725063       MJC    = 0.3486293       TLEVC  = 1                  
+ CTE    = 9.467581E-4     CTC    = 2.92403E-3      TVJE   = 1.280806E-3        
+ TVJC   = 3.012843E-3     TREF   = 25              SUBS   = 1                  
+ TLEV   = 0               )                                                    
*                                                                               
.ENDL BIP                                                                       
***************************************************************
*                                                             *
*                       MODEL OF N+/PW DIODE                  *
*                                                             *
***************************************************************  
.LIB DIO             
.MODEL NDIO D (                                     LEVEL  = 3                  
+ IS     = 1.064246E-5     RS     = 2.1E-7          N      = 1.35               
+ BV     = 8               IBV    = 0.02            IK     = 1E20               
+ IKR    = 1E10            JSW    = 8E-11           AREA   = 7.5E-8             
+ PJ     = 1.1E-3          CJ     = 1.01893E-3      PB     = 0.6944474          
+ MJ     = 0.3075043       CJSW   = 3.057956E-10    PHP    = 0.6944474          
+ MJSW   = 0.1929617       TLEV   = 1               EG     = 1.17               
+ XTI    = 3               TCV    = 1.8E-4          TRS    = 6E-5               
+ TLEVC  = 1               CTA    = 1.047197E-3     CTP    = 5.66277E-4         
+ TPB    = 1.820458E-3     TPHP   = 1.820458E-3     TREF   = 25                 
+ FC     = 0.5             )                                                    
*                                                                               
***************************************************************
*                                                             *
*                       MODEL OF P+/NW DIODE                  *
*                                                             *
***************************************************************
.MODEL PDIO D (                                     LEVEL  = 3                  
+ IS     = 1.064246E-5     RS     = 2E-7            N      = 1.28               
+ BV     = 8.6             IBV    = 0.03            IK     = 1E20               
+ IKR    = 1E10            JSW    = 4E-11           AREA   = 7.5E-8             
+ PJ     = 1.1E-3          CJ     = 1.416829E-3     PB     = 0.9191281          
+ MJ     = 0.5464087       CJSW   = 4.173308E-10    PHP    = 0.9191281          
+ MJSW   = 0.3948903       TLEV   = 1               EG     = 1.17               
+ XTI    = 3               TCV    = -3E-4           TRS    = 6E-4               
+ TLEVC  = 1               CTA    = 9.472773E-4     CTP    = 6.252666E-4        
+ TPB    = 1.27702E-3      TPHP   = 1.27702E-3      TREF   = 25                 
+ FC     = 0.5             )                                                    
*                                                                               
***************************************************************
*                                                             *
*                       MODEL OF NW/PSUB DIODE                *
*                                                             *
***************************************************************
.MODEL NWDIO D (                                    LEVEL  = 3                  
+ IS     = 9.1296E-6       RS     = 2.69E-7         N      = 1.2645946          
+ BV     = 32              IBV    = 0.03            IK     = 1E20               
+ IKR    = 1E10            JSW    = 2E-11           AREA   = 5.5151E-8          
+ PJ     = 0.014058        CJ     = 1.078149E-4     PB     = 0.5753012          
+ MJ     = 0.3489087       CJSW   = 4.703601E-10    PHP    = 0.5753012          
+ MJSW   = 0.2776951       TLEV   = 1               EG     = 1.17               
+ XTI    = 3               TCV    = -9.4E-4         TRS    = 2.78E-3            
+ TLEVC  = 1               CTA    = 2.929317E-3     CTP    = 2.198937E-3        
+ TPB    = 3.037883E-3     TPHP   = 3.037883E-3     TREF   = 25                 
+ FC     = 0.5             )                                                    
*                                                                               
.ENDL DIO                                                                       
***************************************************************
*                                                             *
*                     RESISTOR MODEL                          *
*                                                             *
***************************************************************
.LIB RES
.subckt rnod n1 n2 l=length w=width
.param rsh=3.5 dw=-0.055u ptc1=3.59e-3 ptc2=5.8e-7 pvc1=4.95e-4 pvc2=3.38e-4 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnod

.subckt rnodrpo n1 n2 l=length w=width
.param rsh=87 dw=-0.055u ptc1=1.55e-3 ptc2=0 pvc1=1.40e-3 pvc2=-1.21e-4 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnodrpo

.subckt rpod n1 n2 l=length w=width
.param rsh=2.6 dw=-0.139u ptc1=6.39e-3 ptc2=1.17e-5 pvc1=4.09e-4 pvc2=4.71e-4 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rpod

.subckt rpodrpo n1 n2 l=length w=width
.param rsh=153 dw=-0.102u ptc1=1.42e-3 ptc2=0 pvc1=1.48e-3 pvc2=-1.24e-4 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rpodrpo

.subckt rnwod n1 n2 l=length w=width
.param rsh=1030 dw=1.418u ptc1=5.10e-3 ptc2=1.29e-5 pvc1=1.62e-2 pvc2=-5.82e-4 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnwod

.subckt rnpo1 n1 n2 l=length w=width
.param rsh=6.61 dw=0.04u ptc1=8.57e-4 ptc2=3.01e-7 pvc1=2.83e-4 pvc2=-3.15e-5 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rnpo1

.subckt rppo1 n1 n2 l=length w=width
.param rsh=7.03 dw=0.04u ptc1=8.52e-4 ptc2=3.01e-7 pvc1=2.67e-4 pvc2=-2.97e-5 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rppo1

.subckt rm1 n1 n2 l=length w=width
.param rsh=0.085 dw=-0.02u ptc1=3.27e-3 ptc2=0 pvc1=0 pvc2=0 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rm1

.subckt rm2 n1 n2 l=length w=width
.param rsh=0.085 dw=-0.02u ptc1=3.29e-3 ptc2=0 pvc1=0 pvc2=0 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rm2

.subckt rm3 n1 n2 l=length w=width
.param rsh=0.085 dw=-0.02u ptc1=3.34e-3 ptc2=0 pvc1=0 pvc2=0 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rm3

.subckt rm4 n1 n2 l=length w=width
.param rsh=0.05 dw=-0.02u ptc1=3.18e-3 ptc2=0 pvc1=0 pvc2=0 pt='temper'
.param tfac='1.0+ptc1*(pt-25.0)+ptc2*(pt-25.0)*(pt-25.0)'
r1 n1 n2 'rsh*l/(w-dw)*(1+pvc1*abs(v(n2,n1))+pvc2*v(n2,n1)*v(n2,n1))*tfac'
.ends rm4

.ENDL RES
