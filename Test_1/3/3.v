`timescale 1ns / 1ps

module ex_3(
                     input         clk,
                     input         rst,
                     input         x_is_valid,
                     input 	[3:0]   x,

                     output reg [5:0] y,
                     output reg y_is_valid
                     );

   

   reg [3:0]aux [3:0];

   reg [1:0] aux_0, aux_1, aux_2, aux_3; 
   reg[3:0] count;



   	always@(posedge clk)
    	if(rst) begin
    		aux[0] <= 4'd0;
            aux[1] <= 4'd0;
            aux[2] <= 4'd0;
            aux[3] <= 4'd0;
            aux_0 <= 2'd0;
            aux_1 <= 2'd0;
            aux_2 <= 2'd0;
            aux_3 <= 2'd0;
            y_is_valid <= 0;
            y <= 0;


    	end
    	else if (x_is_valid)
            aux[aux_0] <= x;

            
    		aux_0 <= aux_0 + 2'b1;
            aux_1 <= aux_0 + 2'b2;
            aux_2 <= aux_0 + 2'b3;
            aux_3 <= aux_0;


            if(count >3) begin
                y <= (aux[aux_0] + aux[aux_1] + aux[aux_2] + aux[aux_3]) >> 2; 
            end
        end

    always@(posedge clk)
        if(rst) begin
            count <=0;

        end
        else if (x_is_valid)
            count <= count+1;
            if (count == 4)
                y_is_valid <=1;
        end
    	

endmodule

module ex_3_tb();

    reg clk, rst, x_valid, y_valid;
    reg [3:0] x;
    reg [5:0] y;


    ex_3 ex_3_1(
        .clk(clk),
        .rst(rst),
        .x(x),
        .x_is_valid(x_valid),
        .y(y),
        .y_is_valid(y_valid)
    );


    initial begin
        $dumpfile("dump.vcd");
        $dumvars();

        rst = 1;
        clk = 1;

        always #20 clk = ~clk;
        @(posedge clk) #2 rst=0;


        x = 3;
        #50

        x = 4;
        #50

        x = 5;
        #50


        x = 6;
        #50


        x = 7;
        #50


        x = 8;
        #50


endmodule;