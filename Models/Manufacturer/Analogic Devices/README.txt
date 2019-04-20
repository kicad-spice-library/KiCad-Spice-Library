Analog Devices SPICE Macro-model Library     Release C, 1/91

Copyright 1991 by Analog Devices, Inc.

LICENSE STATEMENT

  The information on this diskette is protected under the
  United States copyright laws.  Analog Devices, Inc.("ADI")
  hereby grants users of these macro-models hereto referred
  to as licensee, a nonexclusive, nontransferable license to
  use these macro-models as long as the licensee abides by
  the terms of this agreement.  Before using the macro-
  models the licensee should read this license.  If the
  licensee does not accept these terms, this diskette should
  be returned to ADI within 30 days.

  The licensee may not sell, load, rent, lease, or license
  the macro-models, in whole, in part, or in modified form,
  to anyone outside the licensee's company.  The licensee
  may modify these macro-models to suit his specific
  applications, and the licensee may make copies of this 
  diskette or macromodels for use within his company only.

  These macro-models are provided "AS IS, WHERE IS, AND WITH
  NO WARRANTY OF ANY KIND EITHER EXPRESSED OR IMPLIED, 
  INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE."
  In no event will ADI be liable for special, collateral,
  incidental, or consequential damages in connection with or
  arising out of the use of these macro-models.  ADI
  reserves the right to make changes to the products and the
  macro-models without prior notice.

APPLICATION INFORMATION

   The SPICE macro-models on this diskette, as of the above
   release date, are the most current for Analog Devices and
   PMI's products.  As more models are completed, new
   releases of this diskette will be issued.

   These models have an advanced architecture that allows
   for multiple poles and zeros to accurately model the AC
   and transient response of the device.  Unique to ADI, the
   following models contain noise sources like the real op
   amp, allowing SPICE analysis of the total noise of a
   circuit:

       OP-27
       OP-37
       OP-77
       OP-177

   Also included are two instrumentation amplifier models:

       AMP-01
       AMP-02

   This diskette contains macro-model net-lists only.  It
   does NOT contain actual SPICE simulator software.  The
   user must obtain their own SPICE simulator.  All the
   model net-lists conform to the standard SPICE format and
   can be run on most SPICE based simulators.  An example
   circuit net-list is included in the file "EXAMPLE.CIR",
   which can be run to check the models on a specific
   simulator.

   For more information on the SPICE models please contact
   the ADI literature department and request the following
   application notes:

	AN110, AN117, AN120, AN126, AN132, and AN138

   Write:   Analog Devices, Inc.
            Literature Dept.
            One Technology Way
            P.O. BOX   9106
            Norwood, MA 02062      USA


MODEL REVISIONS

   Some of the models have been revised since Release B of
   the diskette.  If a model was revised, the release letter
   on the first line of the file was changed, and the
   revisions are documented in the comments at the beginning
   of the net-list file.  IMPORTANT:  THE ORDER OF THE NODE
   CALL-OUTS HAS CHANGED TO PUT THE OUTPUT NODE LAST.  In
   the previous releases the output node was always third,
   but now it is last after the power supplies, to agree
   with the standard SPICE op amp model call-out.


OPEN-LOOP GAIN AND PHASE

   A common mistake in simulating an amplifier's open-loop
   gain and phase performance is to run the model open-loop. 
   Like the actual device, without feedback, even a small
   amount of offset can cause the circuit to saturate to
   either supply rail.  Because of the saturation, the model
   gives a much lower open-loop gain.  Thus the model needs
   to be run closed-loop.  Typically the easiest way to do
   this is to run the model in an inverting op amp
   configuration and have SPICE plot the log of the output
   minus the log of the inverting input.


TRANSIENT ANALYSIS

   One of the most difficult problems in using SPICE is
   convergence.  As the number of nodes increases, so do the
   calculations needed for convergence.  If the analysis
   quits due to non-convergence then adding the following
   line to the circuit net-list will help in most cases:

     .OPTIONS  ITL4=40

   This increases the number of iterations from the default
   of 10 to 40.  SPICE simulator will then make 40
   iterations to try to find the next point of the transient
   solution before going to a smaller time step.


NEGATIVE CAPACITANCE

   Some SPICE simulators do not allow the use of a negative
   capacitor, which is used in some macro-models to properly
   shape the frequency response.  Those simulators will
   issue an error message stating that the negative
   capacitor is not permissible.  When this problem is
   encountered, change the sign of the negative capacitor to
   positive.  Then, change the signs of the two resistors in
   the same stage to negative.   


POWER DISSIPATION

   All the models accurately model the supply current of the
   part including the output current.  Thus to calculate the
   power dissipation of the circuit, the supply current
   should be multiplied by the supply voltage.  This may
   give a different number compared to the total power
   dissipation printed at the end of all SPICE output files. 
   This is due to higher than normal internal currents,
   which are not reflected in the supplies.  The noise
   models are especially affected by this because of the
   large currents needed to keep the noise low.  Thus,
   always use the actual supply currents to calculate the
   total power dissipation.

