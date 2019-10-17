module full_adder
	(  
		input  	a,
		input  	b,
	 	input   c_in,
	 	output  c_out,
	    output  res
   );


   assign res = a ^ b ^c_in;

   assign c_out = (a ^ b) & c_in | (a & b);

endmodule