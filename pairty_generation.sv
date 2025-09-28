//for parity generation and error detection 
module parity #(parameter N = 8) (
	input  logic [N-1:0] data,
	output logic parity
	);

	assign parity = ^data; //checks for even odd parity. 1 for odd, 0 for even
endmodule

