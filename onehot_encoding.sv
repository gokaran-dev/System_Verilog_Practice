//paramterized one-hot to binary encoding

module onehot_encoding #(parameter N = 8) (
	input  logic [N-1:0] in,
	output logic [$clog2(N)-1:0] out
	);

	integer i;
	reg [$clog2(N)-1:0] temp;

	always_combo 
	begin
		temp = 0;
		for (i = 0; i < N; i = i +1)
		begin
			if (in[i]) temp = i; //basically this gives the index where we get 1 in one hot encoding. 
		end
	end
	
	//that index is then assigned to out.
	assign out = temp;
endmodule
