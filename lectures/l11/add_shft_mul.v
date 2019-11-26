`timescale 1ns / 1ps

module booth_mul (
                     input         clk,
                     input         rst,
                     
                     input signed [7:0]   a, 
                     input signed [7:0]   b,
                     output reg signed [15:0] c,
                     input         start,
                     output        done
                     );

   reg [3:0]                     counter;


   assign done = (counter == 4'd8);

   always@(posedge clk)
     if(rst)
       counter <= 4'd8;
     else if (start)
       counter <= 4'd0;
     else if (counter != 4'd8)
       counter <= counter + 1'b1;
   
   
     always@(posedge clk)
     if(rst)
       c <= 16'd0;
     else if (counter == 4'd7) begin
        c <= {c[15],c[15:1]} - (b[counter]? {{8{a[7]}},a}<<7: 16'd0); 
     end
     else if(counter != 4'd8) begin 
        c <= {c[15],c[15:1]} + (b[counter]? {{8{a[7]}},a}<<7: 16'd0); 
     end
endmodule


module booth_mul_tb ();

   reg clk, rst;
   reg [7:0] a, b;
   wire [15:0] c;
   reg         start;
   wire        done;
   
   booth_mul mult0 (
                       .clk(clk),
                       .rst(rst),
                     
                       .a(a), 
                       .b(b),
                       .c(c),
                       .start(start),
                       .done(done)
                     );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
      rst = 1;
      clk = 1;
      start = 0;

      a=8'hfe;
      b=8'h2;

      @(posedge clk) #1 rst=0;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;

      @(posedge done) $display("%d", c);
      
      @(posedge clk) $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule
