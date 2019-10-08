module adder_tb;
   

   parameter N = 32;
   reg [N-1:0]  a;
   reg [N-1:0]  b;
   wire [N-1:0]  res;
   wire       carry;

   
   // Instantiate the Unit Under Test (UUT)
   adder #(.N(N)) uut (
      .a(a),
      .b(b),
      .res(res),
      .carry(carry)
		);
 
   
   initial begin
      $dumpfile("adder.vcd");
      $dumpvars;
      
       a=  32'h50;
       b=  32'h20;



       #5
      a= 32'hAC87;
       b= 32'hFF25;

              #5

       a= 32'h04;
       b= 32'h03;


      end 

endmodule

