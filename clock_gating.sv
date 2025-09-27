//clockgating in system verilog. Passing the enable signal through a flip flop
//gives us a stable enable signal. However that is not enough for a glitch
//free gated clock generation

module gated_clock (
	input clk,
	input enable,
	output gclk
	);

	reg en_latched;
	
	//this ensures that the enable signal is sampled during the negative
	//edge. If enable signal is sampled at the positive edge, then the
	//propogation delay may shorten or expan the clock on time. Creating
	//a glitch, a timing mismatch
	always @(negedge clk)
	begin
		en_latched <= enable;
	end

	assign gclk = clk & en_latched;

endmodule
