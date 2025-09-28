//N bit LFSR
//LFSR: Linear Feedback Shift Register.
//The value which is sihfted is the result of XOR operation of selected bits.
//Used for Pseudo Random Generation, testpatterns, scramblers.
//TAPS: Tells the system about the bits which will participate in the feedback exor mechanism. 
//TAPS is a mask, wherever value is 1, that bit is inlucded in the feedback.


moduel lfsr #(parameter N = 8, TAPS=8'b10111000) (
	input clk,reset,
	output reg [N-1:0] q
	);

	always_ff @(posedge clk or posedge reset)
	begin
		if (reset) q <= {N{1'b1}}
		
		else q <= {q[N-2:0], ^(q & TAPS)}; //bits where TAPS is 1 is allowed to go into EXOR feedback
		//we start from q[N-2] because q[N-1] is dropped from the sequence, and a new bit is shifted from the LSB
	end
endmodule
