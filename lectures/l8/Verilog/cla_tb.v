module cla_tb;

   reg [3:0]  a;
   reg [3:0]  b;
   reg        c_in;
   wire [3:0] s;
   wire       c_out;

   
   // Instantiate the Unit Under Test (UUT)
   cla uut (
      .a(a),
      .b(b),
      .c_in(c_in),
      .s(s),
      .c_out(c_out)
		);
 
   
   initial begin
      $dumpfile("cla.vcd");
      $dumpvars;
      
       a=  "0001";
       b=  "0000";
       c_in = 0;

       #5
       a= "0001";
       b= "0000";
       c_in = 1;

       #5

       a= -80;
       b= 40;


      end 

endmodule

