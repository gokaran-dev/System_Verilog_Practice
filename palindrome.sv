//A number, if after being flipped on its y axis, is equal to the original then it is said to be a palindrome number
// <<{num} it is a streaming operator in system verilog which means stream the
// bits from left to right. So, MSB becomes LSB, and so on.
module palindrome #(parameter N = 8) (
	input  logic [N-1:0] num,
	output logic is_pal
	);

	assign is_pal = (num == {<<{num}}); //bit reversal. 

endmodule
