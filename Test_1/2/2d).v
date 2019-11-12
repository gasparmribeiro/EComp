`timescale 1ns / 1ps
module test_ex1 (
                  input [3:0] a,
                  input [3:0] b,
                  output [7:0] c
                  );


   assign c = (b[0]? a:0) + ((b[1]? a : 0)<<1) + ((b[2]? a : 0)<<2) + ((b[3]? a : 0)<<3);


endmodule
