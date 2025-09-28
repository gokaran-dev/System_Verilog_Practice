//detecting overflow in 2's compliment 

module overflow_2 #(parameter N = 8) (
	input  logic [N-1:0] a,b,
	input  logic [N:0] sum,
	output logic overflow
	);
	
	//overflow occurs when two operands have the same sign, but the sum
	//has a different sign with respect to an operator
	assign overflow = (a[N-1] == b[N-1]) && (sum[N-1] != a[N-1]);

endmodule
