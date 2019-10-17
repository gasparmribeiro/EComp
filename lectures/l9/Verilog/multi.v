module multi
	(
		input  [1:0] 	a,
		input  [1:0] 	b,
	    output [3:0]  	s
   );


   wire pp0[1:0] , pp1 [1:0];
   wire carry;

   assign pp0[0]  = a[0] & b[0];
   assign pp0[1]  = a[1] & b[0];

   assign s[0] = pp0[0];

   assign pp1[0] = a[0] & b[1];
   assign pp1[1] = a[1] & b[1];


   full_adder adder1(

   			.a(pp0[1]),
   			.b(pp1[0]),
   			.c_in(1'b0),
   			.c_out(carry),
   			.res(s[1])
   );


  full_adder adder2(

			.a(carry),
			.b(pp1[1]),
			.c_in(1'b0),
			.c_out(s[3]),
			.res(s[2])
   );


endmodule

