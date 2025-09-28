module priority_arbitor #(parameter N = 4) (
		input logic [N-1:0] req,
		output logic [N-1:0] grant
	);

	integer i;
	
	always_combo 
	begin
		grant = '0; // '0 means all bits are zero
		for (i = N-1; i >= 0; i = i-1)
		begin
			if (req[i]) //here we see which bit is raising request. 
			            //The highest bit is granted access, the loop then breaks
			begin
				grant[i] = 1;
				break;
			end
		end
	end
endmodule 
