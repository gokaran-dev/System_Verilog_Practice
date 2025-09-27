module johnson_counter #(parameter N=5) (
	input clk,
	input rst,
	output logic [N-1:0] count
	);

	always_ff @(posedge clk or posedge rst)
	begin
		if(rst == 1)
		begin
			count <= 0;
		end

		else
		begin
			count <= {~count[0],count[N-1:1]};
		end

	end
endmodule
