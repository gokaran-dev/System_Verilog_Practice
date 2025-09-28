//Implementing a sequence in SVA that detcts three consequetive high signals
//a sequence describe an ordered set of events. Basically, did the signal have these values across clock cycles?
//A sequence can be reused inside other sequences or properties. Property can assert a failure but sequence cannot.
//
sequence three_high;
	sig[*3]; // [*] this is a sequence repeat operator, which tells us how many times a particular value should repeat. 
		// here we are describing how many times the value of signal
		// must be high. 
endsequence

assert property(@(posedge clk) three_high); //checks that for every clock cycle, sig stays high for three clock cycles. 

//so, if a check is raised at t0, signal will be checked for t0,t1,t2
//at t1, another signal wcheck will be raised, it will go for t1,t2,t3
//at t2, another signal check will be raised, it will go for t2,t3,t4 
//These checks will run parallely. That is the system will launch multiple threads


//sig[*n] repeat n times
//sig[*n:m] repeat in the range of n to m
//sig[*n:$] repeat for atleast n, no upwards range.
//expression must be inside brackets. So, (~sig[*3]) is correct, but ~sig[*3] will probably through an error
//(bus == 4'b1011)[*3]) checks for the repetition of the sequence 1011.
