module n_full_adder
	#(
		parameter N=32
	) 

	(
		input  [N-1:0] 	a,
		input  [N-1:0] 	b,
	 	input			c_in,
	 	output  		c_out,
	    output [N-1:0]  res,
	    output 			overflow
   );


	wire [N:0] c;
	assign c[0] = c_in;

	genvar i;

	generate for(i = 0; i<N; i= i+1)

		full_adder my_full_adder(
									.a(a[i]),
									.b(b[i]),
									.c_in(c[i]),
									.c_out(c[i+1]),
									.res(res[i])
								);
	endgenerate

	assign c_out = c[N];

	assign overflow = c[N] ^ c[N-1];

endmodule
	