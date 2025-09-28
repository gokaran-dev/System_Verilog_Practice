// GCD using euclidean algorithm. This method uses subtraction instead of division. 

module gcd #(parameter N = 16) (
	input  logic clk,reset,start,
	input  logic [N-1:0] a,b,
	output logic [N-1:0] result,
	output logic done
	);

	reg [N-1:0] x,y;

	always_ff @(posedge clk or negedge reset)
	begin
		if (!reset)
		begin
			x <= 0;
			y <= 0;
			done <= 0;
			result <= 0;
		end

		else if (start)
		begin
			x <= a;
			y <= b;
			done <= 0;
		end

		else if (x!=y)
		begin
			if(x>y) x <= x-y;

			else y <= y-x;
		end

		else 
		begin
			result <= x;
			done <= 1;
		end
	end
endmodule
