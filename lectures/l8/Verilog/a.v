module A
	(  
		input  	a,
		input  	b,
	 	input   c_in,
	 	output  p,
	 	output  g,
	    output  s
   );


   assign s = a ^ b ^c_in;

   assign p = a ^ b;
   assign g = a & b;

endmodule