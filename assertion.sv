//Assertion in system verilog to check that a req is always followed by ack
//within 3 clock cycles. 

//assertion: They are checks embedded in the design to see a signal behaves as expected. They report whenever something goes wrong
//Immediate Assertion: checked right when the execution happens. assert
//(signal == 1) else $error("signal should be 1!");
//Concurrent Assertion: Signals are checked with respect to clock.
//Property: reusable description of a behaviour over time. comparing with functions, property do not return a value. 
//SVA operators can be used here.

property req_ack_check;	
	@(posedge clk) req |-> ##[1:3] ack; //tells the simulator to check this property on every posedge of clock. 
	//Then we describe the behaviour of the signal
	// |-> this is an SVA operator, which says if event on the left has
	// occured, then the event on right should occur. Should occur when?
	// ##1 asks the system to wait for 1 clock cycle.
	// ##3 asks the system to wait for 3 clock cycles.
	// So the statement is basically saying, if req has been made, then
	// acknowledgment should go HIGH in 3 clock cycles. If not, we will
	// recieve error/false
endproperty

assert property(req_ack_check); //calling the propety.




//Assertion which handles resets
property req_ack_check;
	@(posedge clk)
		disable iff(reset) //stops the assertion from checking when reset is HIGH
		req |-> ##[1:3] ack;
endproperty 

//#5 waits for that much time, ##5 is for clock cycles, can only be used in
//sequences and properties
