//4 bit gray to binary converter 

module gray_binary(
	input logic [3:0] gray_in,
	output logic [3:0] binary_out
	);

	binary_out[3] = gray_in[3];
	
	genvar i;
	generate
		for(i = 2; i >= 0; i = i - 1)
		begin
			assign binary_out[i] = binary_out[i+1] ^ gray_in[i];
		end
	endgenerate

endmodule

