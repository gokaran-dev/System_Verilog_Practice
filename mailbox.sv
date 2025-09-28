//A mailbox based producer consumer model:
//Mailbox: built in object for system verilog whic acts like a message queue between parallel processes. Cannot be synthesized
//Consider this as a FIFO Queue, first in first out. However it has a blocking feature. If empty, consumer waits for get()
//if the mailbox is full, put() waits till the mailbox is empty, or like a fifo it has an empty slot
//tasks are another non synthesizable, they are available in verilog, but they are extended in system verilog.
//using tasks we can run multiple instances at the same time.

mailbox mb = new();

task producer();
	int data = 100;
	mb.put(data);
endtask

task consumer();
	int d;
	mb.get(d);
	$display("Receieved = %0d",d);
endtask
