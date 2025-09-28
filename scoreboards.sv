//Scoreboard: It monitors the output of a DUT. 
//It compares these outputs against expected results. 
//If the data does not match, a flag can be raised. It makes the verifying complex protocols easy. 

//Implement a queue based scoreboard

int exp_q[$], act_q[$]; //creates associative arrays for expected and actual queues.

task comparea90;
	if (exp_q.size() && act_q.size())
	begin
		if(exp_q.push.front()!=act_q.push.front)
			$error("Mismatch");
	end
endtask
