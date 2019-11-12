module test_ex1 (
                  input clk,
                  input [3:0] a,
                  input [3:0] b,
                  output reg [7:0] c
                  );

   reg signed [7:0]                  y0, y1, y2;
   reg signed [3:0] s_a;
    reg signed [7:0] c_a;

   assign s_a = a

   assign c = s_c;

   always @(posedge clk) begin 
        y0 <= b[0]? s_a:0;
        y1 <= y0 + ((b[1]? s_a : 0)<<1);
        y2 <= y1 + ((b[2]? s_a : 0)<<2);
        s_c  <= y2 + ((b[3]? s_a : 0)<<3);
   end

endmodule
