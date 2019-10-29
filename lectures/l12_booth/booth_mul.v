`timescale 1ns / 1ps

module booth_mul (
                    input         clk,
                    input         rst,
                     
                    input [31:0]   M, 
                    input [31:0]   m,
                    output[63:0]   p,
                    output reg	done

                    );

   reg [64:0]       pm;
   reg 				pc;
   reg [5:0]		counter;

   assign p = pm[64:1];

	always@(posedge clk)
    	if(rst) begin
       		pm <= 65'b0;
        	pc <= 0;
        	counter <=0;
        	done <= 0;
   		end
    	else begin
    		counter <= counter +1;
     		pc <= pc+1;
     		case(pc)
   				0: pm[32:1] <= m;
   				1: begin
   					case(pm[1:0]) 
   						2'b01 : begin 
							pm[64:32] <= (pm[64:33] + M);
							pm[31:0]  <= pm[32:1];
						end
						2'b10 : begin
							pm[64:32] <= pm[64:33] - M;
							pm[31:0] <= pm[32:1];
						end

						default: begin 
							pm[63:0] <= pm[64:1];
						end

					endcase // pm[1:0]


					if(counter != 32)
						pc <= pc;
					else if (counter == 32) begin
						pc<=pc;
						done <= 1;
						counter <= 32;
					end
   				end
   			endcase
   		end



  
endmodule


module booth_mul_tb ();

   reg clk, rst;
   reg [31:0] m, M;
   wire [63:0] p;
   wire        done;
   
   booth_mul mult0 (
                       .clk(clk),
                       .rst(rst),
                     
                       .M(M), 
                       .m(m),
                       .p(p),
                       .done(done)
                     );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      
      rst = 1;
      clk = 1;

      M=32'd6;
      m=32'd2;

      @(posedge clk) #1 rst=0;

      @(posedge done) $display("%d", p);
      
      @(posedge clk) $finish;
   end
   
   always #10 clk = ~clk;
 
endmodule
