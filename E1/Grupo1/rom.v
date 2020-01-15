`timescale 1ns / 1ps

Module ROM(
	input [9:0] addr,
	output reg [31:0] data
	);

	reg [31:0] rom [2**10 - 1:0]


	initial $readmemb("init.bin", rom, 0, 2**10 - 1);

	//o ficheio .bin nao foi feito


	data <= rom[addr];

end module 

module rom_tb()

	reg[9:0] addr;
	wire [31:0] data_out;


	rom a(
		.addr(addr),
		data(data_out)
	);


	initial begin

			$dumpfile("dump.vcd");
			$dumpvars(0, rom_tb);

	addr = 0;
	#5
	addr = 1
	#5
	addr = 2;
	#5
	addr = 3;
	#5


	$finish