//designing a N bit paramterized RCA using generate function

module CLA #(parameter N = 4) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	input logic Cin,
	output logic [N-1:0] Sum,
	output logic carry
	);

	logic [N:0] c; 
	assign c[0] = Cin;
	
	genvar i;
	generate
		for (i = 0; i<N; i=i+1)
		begin
			assign {c[i+1],Sum[i]} = A[i]+B[i]+c[i];
		end
	endgenerate
	
	assign carry = c[N];
endmodule
