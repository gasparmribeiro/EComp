`timescale 1ns / 1ps


//guardar -- 0 1 1 2 3 5 8 13 21 34  

module rom (
			input [3:0] add,
            output [5:0] out        
            );

  
  	reg[5:0] rom[9:0];

	initial
	begin 
		$readmemb("data.bin", rom, 0,9);
	end


	assign out = rom[add];


endmodule


module rom_tb ();

	reg [3:0] add;
	reg [5:0] out;
    
   rom rom0 (
   			.add(add),
   			.out(out)
            );   

   initial begin

      $dumpfile("dump.vcd");
      $dumpvars;
      

      add = 0;
      #1

      add = 1;
      #1
      add = 2;
      #1
      add = 3;
      #1
      add = 4;
      #1
      add = 5;
      #1
      add = 6;
      #1
      add = 7;
      #1
      add = 8;
      #1
      add = 9;
      #1


      $finish;

    end 
 
endmodule

