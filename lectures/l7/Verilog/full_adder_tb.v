module n_full_adder_tb;
   

   parameter N = 32;


   reg [N-1:0]  a;
   reg [N-1:0]  b;
   reg          c_in;
   wire [N-1:0] res;
   wire         c_out;

   
   // Instantiate the Unit Under Test (UUT)
   n_full_adder #(.N(N)) uut (
      .a(a),
      .b(b),
      .c_in(c_in),
      .res(res),
      .c_out(c_out)
		);
 
   
   initial begin
      $dumpfile("full_adder.vcd");
      $dumpvars;
      
       a=  -5;
       b=  -15;
       c_in =0;



       #5
       a= 10;
       b= -6;

       #5

       a= -80;
       b= 40;

       #5
       a= -80;
       b= 40;

      end 

endmodule

