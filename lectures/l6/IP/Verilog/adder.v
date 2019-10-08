module adder
	#(
		parameter N=32
	) 

	(  

	input [N-1:0] 	a,
	input [N-1:0] 	b,
 
 	output        carry,
    output [N-1:0] res
   );

   
   wire[N:0] result;

   assign result = a +b;

   assign res = result[N-1:0];
   assign carry = result[N];

endmodule