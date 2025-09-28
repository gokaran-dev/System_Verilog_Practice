//a basic sequence detection using Mealy. Overlapping. In overlapping, one state is reduced.

module seq_detection (
	input logic clk,rst_n,din.
	output logic dout
	);

	logic [2:0] states;

	always_ff @(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			states <= 0;

		else
			states <= {states[1:0],din};
	end

	assign dout = (states = 3'b101 & din); //instead of making the last bit a part of the sequence, 
						//we simply see if the last bit is 1

endmodule

