`timescale 1ns / 1ps

module div (
                     input         clk,
                     input         rst,
                     input         start,
                     input 	[7:0]   D, 
                     input  [7:0]   d,
                     output reg [7:0] q,
                     output reg [7:0] r,
                     output reg     done
                     );

   reg [3:0]                    counter;
   reg [7:0] 					d_reg;
   reg [15:0]					D_reg;
   reg 							q_in;
   reg [7:0]					sub;



   	always@(posedge clk)
    	if(rst) begin
    		counter <= 4'd0;
    		done = 0;
    	end
    	else if (start)
    		counter <= 4'd0;

    	else if (counter == 4'd8) begin
    		done <= 1;
     		q <= D_reg[7:0];
     		r <= D_reg[15:8];
     	end
    	else if (counter != 4'd8)begin
    		counter <= counter + 1'b1;
        end

   

    always@(posedge clk)
    	if(rst)begin
    		d_reg <= 8'd0;
        	
        end
    	else if (start) begin
        	d_reg <= d;
        end



    always@*   
    	if(D_reg[14:7] >= d_reg)begin
    		q_in = 1;
    		sub = D_reg[14:7] - d_reg;
    	end
    	else begin
    		q_in = 0;
    		sub = D_reg[14:7];
    	end

   
     always@(posedge clk)
     	if(rst)
     		D_reg <= 16'd0;
     	else if(start)
     		D_reg <= {8'd0, D};  
     	else if(counter != 4'd8) begin  
        	D_reg <= {sub, D_reg[6:0], q_in}; 
     	end

endmodule


module div_tb ();

   reg clk, rst;
   reg [7:0] d, D;
   wire [7:0] r, q;
   reg         start;
   wire        done;
   
   div mult0 (
                       .clk(clk),
                       .rst(rst),
                     
                       .D(D), 
                       .d(d),
                       .r(r),
                       .q(q),	
                       .start(start),
                       .done(done)
                     );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
      rst = 1;
      clk = 1;
      start = 0;

      D=8'd5;
      d=8'd2;

      @(posedge clk) #1 rst=0;

      #5 @(posedge clk) #1 start=1;
      @(posedge clk) #1 start=0;

      @(posedge done) $display("%d\n%d", q, r);
      
      @(posedge clk) $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule
