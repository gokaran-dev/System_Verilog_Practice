//Implementing a sequence in SVA that detcts three consequetive high signals

sequence three_high;
	sig[*3];
endsequence

assert property(@(posedge clk) three high);
