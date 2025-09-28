//a 8x1 mux using array indexing

module mux_8x1 (
	input logic [7:0] D,
	input logic [2:0] sel,
	output logic y);

	assign y = D[sel];

endmodule 
