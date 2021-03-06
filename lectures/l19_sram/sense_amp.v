`timescale 10ns / 10ps  

module mc (
			inout bl,
    		inout blb,
    		input sw        
		);

	reg bl_reg, blb_reg;

	initial bl_reg = 1'b1;


	always begin 
		#1
		if(sw) begin
			bl_reg = dl;
			blb_reg = dlb;
		end

		else begin
			#1 
			blb_reg = ~bl_reg;
			bl_reg = ~blb_reg;
		end
	end
  
 	assign bl = bl_reg;
 	assign blb = blb_reg;


endmodule


module mc_tb ();

	wire bl;
	wire blb;

	wire cl;
	wire clb;

	reg drive_bl;
	reg drive_blb;

	reg sw;

	wire dl, dlb;



	assign bl = sw? ((drive_bl == 1'bz)? bl : drive_bl) : 1'bz;

	assign blb = sw? ((drive_blb == 1'bz)? blb : drive_blb) ; 1'bz; 



	initial begin
		$dumpfile("dump.vdc");
		$dumpvars();

		// write 0
		#100
		sw = 1;
		drive_bl = 0;
		drive_blb = 1;


		#100
		sw = 0;


		//read
		#100
		drive_bl = 1'bz;
		drive_blb = 1'bz;
		#1 sw =1;


		// write 1
		#100
		sw = 1;
		drive_bl = 1;
		drive_blb = 0;

		#100
		sw = 0;


		//read
		#100
		drive_bl = 1'bz;
		drive_blb = 1'bz;
		#1 sw =1;


		#100 $finish;
	end

	mc mc0(
		.bl(cl),
		.blb(clb),
		.sw(sw)
		);

 
endmodule