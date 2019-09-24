`timescale 1ns / 1ps

//compute p**q, where q=4


module top ( //top level module
	input 	      clk,
	input 	      rst,

	input [7:0]   data_in,
	input 	      data_in_valid,
	output [31:0] data_out,
	output 	      data_out_valid
);


   //counter signals
   wire 	      cnt_rst, cnt_en;
   wire [1:0] 	      count;
   
   //register signals
   wire 	      reg_en;
   wire [31:0] 	      reg_data_in, reg_data_out;
   wire [31:0] 	      reg_data_inA, reg_data_outA;
   wire [31:0] 	      reg_data_inB, reg_data_outB;
   
//combinatorial assignments
   assign data_out = reg_data_out;
   assign data_out_valid = data_in_valid;

   assign reg_data_inA = data_in * data_in;
   assign reg_data_inB = data_in * data_in;
   assign reg_data_in = reg_data_outA * reg_data_outB;
		     
//instantiate components
   counter cnt (
	       	.clk(clk),
	       	.rst(cnt_rst),
	       	.en(cnt_en),
	       	.data_out(count)
		);

   register preg (
	       	    .clk(clk),
	       	    .en(reg_en),
	       	    .data_in(reg_data_in),
	       	    .data_out(reg_data_out)
		    );
	register Areg (
	       	    .clk(clk),
	       	    .en(reg_en),
	       	    .data_in(reg_data_inA),
	       	    .data_out(reg_data_outA)
		    );
	register Breg (
	       	    .clk(clk),
	       	    .en(reg_en),
	       	    .data_in(reg_data_inB),
	       	    .data_out(reg_data_outB)
		    );

   control controler (
		      //top interface
		      .clk(clk),
		      .rst(rst),
		      .data_in_valid(data_in_valid),
		      //counter interface 
		      .cnt_data(count),
		      .cnt_rst(cnt_rst), 
		      .cnt_en(cnt_en),
		      //register interface
		      .reg_en(reg_en)
		      );
endmodule
