//low power FSM can be created by one hot encoding or gray encoding. One hot
//encoding is preferred because any two stages only differ by 1 bit. In
//grayencoding only subsequent bits differ by 1

module low_power_FSM (
	input logic clk,
	input logic rst,
	input logic in
	);

	typedef enum logic [4:0] {
		IDLE = 5'b00001;
		START = 5'b00010;
		PREPROCESS = 5'b00100;
		PROCESS = 5'b01000;
		END = 5'b10000;
		} state_t;
	
	state_t state;

	always_ff @(posedge clk)
	begin
		if (rst)
			begin
				state <= IDLE;
			end
		case (state)
			IDLE: state <= in ? START:IDLE;
			START: state <= in ? PREPROCESS:IDLE;
			PREPROCESS: state <= in ? PROCESS:IDLE;
			PROCESS: state <= in ? END:IDLE;
			default: state <= IDLE;
		endcase
	end
endmodule
