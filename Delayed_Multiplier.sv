//2 cycle delay multiplier.

module multiplier #(parameter N = 8) (
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	input reset,
	output logic [2*N:0] product
	);

	logic [N-1:0] a_1, b_1;
	logic [2*N:0] combo_product;
	
	//adds one cycle of delay
	always_ff @(posedge clk or negedge reset)
	begin
		if (!reset)
		begin
			a_1 <= 0;
			b_1 <= 0;
		end

		else
		begin
			a_1 <= a;
			b_1 <= b;
		end
	end

	assign combo_product = a_1 * b_1;
	
	//adds one cycle of delay in latching the calculated product onto as output
	always_ff @(posedge clk or negedge reset)
	begin
		if (!reset)
			product <= 0;

		else 
			product <= combo_product;
	
	end
endmodule
