module multi_tb;

  parameter T = 10;

   reg [1:0]  a;
   reg [1:0]  b;
   wire[3:0]  s;

   
   // Instantiate the Unit Under Test (UUT)
   multi uut (
      .a(a),
      .b(b),
      .s(s)
		);
 
  
      always #T    a[0] = ! a[0];

      always #(2*T) a[1] = !a[1];

      always #(4*T) b[0] = !b[0];
      
      always #(6*T) b[1] = !b[1];

    initial begin
      $dumpfile("multi.vcd");
      $dumpvars(0, multi_tb);

      a = 0;
      b = 0;


      #(17*T)
      $finish;


      end 

endmodule

