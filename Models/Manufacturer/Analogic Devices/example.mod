OP AMP MODEL TEST CIRCUIT
*
*  This net-list will test the OP-42 model in a simple
*  inverting gain of -1 circuit.  Three different types
*  of waveforms will be simulated:  DC, AC and transient.
*  This file can be used as direct input to your SPICE
*  simulator software.
*  To look at the output, enter "TYPE EXAMPLE.OUT"
*  An output file generated using PSpice 4.04 is saved
*  in the file "COMPARE.OUT" to check your output.
*
X1   0   2   4   5   3   OP-42
RIN  1   2   2K
RF   3   2   2K
VP   4   0   DC 15
VN   5   0   DC -15
VIN  1   0   DC 0 AC 1 PULSE(-100M 100M 0 5N 5N 1U 2U)
.DC VIN -10 10 1
.PRINT DC V(3)
.AC DEC 10 10K 100MEG
.PLOT AC VM(3) VP(3)
.TRAN 20N 2U
.PLOT TRAN V(3)
.INC OP42.CIR
.END
