//A module to synchronize a single cycle pulse from one clock domain to another


module pulse_syn(
	input logic clk_src, clk_dst, rst,
	input logic pulse_in,
	output logic pulse_out
	);

	logic src_toggle, dst_toggle, dst_toggle_d;

	always_ff @(posedge clk_src or posedge rst)
	begin
		if (rst) src_toggle <= 0;
		
		elseif (pulse_in) src_toggle <= ~src_toggle;
	end

	always_ff @(posedge clk_dst or posedge rst)
	begin
		if (rst) {dst_toggle, dst_toggle_d} <= 0;
		else {dst_toggle, dst_toggle_d} <= {src_toggle, dst_toggle}; 
		//basically dual synchronizers. dst_toggle changes with
		//src_toggle change, which changes for every pulse. In the
		//next clk_dst, dst_toggle becomes dst_toggle_d. dst_toggle
		//if dst_toggle is 1 in one dst_clk edge, it becomes 0 in the
		//next edge. So, exor only gives on high pulse. This adds
		//a delay, sure, but makes sure pulse is stable
	end

	assign pulse_out = dst_toggle ^ dst_toggle_d;
endmodule

