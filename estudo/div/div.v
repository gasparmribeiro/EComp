`timescale 1ns / 1ps

module div (
		//input         clk,
		//input         rst,
		input 	[7:0]   D, 
		input   [7:0]   d,
		output reg [7:0] q,
		output reg [7:0] r,
	);

	reg [7:0] Dext;

	always @ (D, d) begin
		q = 4'b1111;
		Dext = {4'b0, D};

		if( (d<<3) > Dext)
			q[3] = 0;
		else
			Dext = Dext - (d<<3);

		if( (d<<2) > Dext)
			q[2] = 0;
		else
			Dext = Dext - (d<<2);


		if( (d<<1) > Dext)
			q[1] = 0;
		else
			Dext = Dext - (d<<1);


		if( (d) > Dext)
			q[0] = 0;

		else
			Dext - d;


		r = Dext;
   
   end

endmodule : div

module div_tb();

	reg[3:0] d, D;

	div div0(
		.D(D),
		.d(d),
		.q(q),
		.r(r)
	);


	initial begin
		$dumpfile("dump.vcd");
		$dumvars();

		D = 15;
		d = 2;
		#100

		D = 0;
		d = 2;
		#100;


endmodule;