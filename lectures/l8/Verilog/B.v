module B
	(  
		input  	p_l,
		input  	g_l,
	 	input   p_k,
	 	input   g_k,
	 	input   c_in,
	 	output  c_out,
	 	output  p_kl,
	    output  g_kl
   );


   assign p_kl = p_k & p_l;

   assign g_kl = g_k + (p_k * g_l);

   assign c_out = g_l + (p_l * c_in);

endmodule