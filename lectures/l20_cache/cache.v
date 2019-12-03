`timescale 1ns / 1ps

module cache_mod(
			input 			clk,
			input 			reset,
			input 			valid,
			input 			write,
			input  [7:0] 	address,
			input  [31:0] 	data_in,
			output [31:0]	data_out,
		);

	reg [31:0] cache [255:0];

	always @(posedge clk) begin
		if(valid) begin
			if(write)
				cache[address] <= data_in;
		end else begin
			data_out <= cache[address];
		end
	end
endmodule

module tag(
		input 				clk,
		input 				reset,
		input 				valid,
		input 				write,
		input  [7:0] 		address,
		input  [23:0] 		data_in,
		output [23:0]		data_out,
		);

	reg [23:0] tag_memory [255:0];
endmodule

module cache (
	      input             clk,
	      input 			reset,
	      input 			write,
	      input 			valid,
	      input  [34:0]   	address,
	      input  [32:0]     data_in,
	      output [32:0]     data_out,
	      output			ready,
	 
	      input  [34:0] 	address,
	      input  [31:0]     data_in,
	      output [31:0]     data_out,
	      output 			hit_miss
	      );
	
	wire [2:0] 			offset;
	wire [7:0] 			set; 
	wire [23:0] 		tag;
	wire [23:0] 		tag_out;
	wire [7:0] 			one_hot;
	wire [31:0] 		data_out0, data_out1, data_out2, data_out3, data_out4, data_out5, data_out6, data_out7

	reg [31:0] 			temp_data_out;
	reg [23:0] 	  			temp_tag;

	assign offset = address[`ADDR_BITS-`TAG-`INDEX_W-1 -: 0];
	assign set = address[`ADDR_BITS-`TAG-1 -: INDEX_W];
	assign tag = address[`ADDR_BITS-1 -: TAG];

	always @ (posedge clk)
	if (valid) begin
		one_hot = {offset == 3'd7, offset == 3'd6, offset == 3'd5, offset == 3'd4, offset == 3'd3, offset == 3'd2, offset == 3'd1, offset == 3'd0};


		if(write == 0) begin
			temp_tag <= tag_out;
			case (offset)
				3'b000   :  temp_data_out <= data_out0;
				3'b001   :  temp_data_out <= data_out1;
				3'b010   :  temp_data_out <= data_out2;
				3'b011   :  temp_data_out <= data_out3;
				3'b100   :  temp_data_out <= data_out4;
				3'b101   :  temp_data_out <= data_out5;
				3'b110   :  temp_data_out <= data_out6;
				3'b111   :  temp_data_out <= data_out7;
			endcase // offset
			
			if(temp_tag == tag) begin
				hit_miss <= 1;
				data_out <= temp_data_out;
			end
			else
				hit_miss <= 0;
		end
	end

	tag tag (
			.clk(clk),
			.reset(reset),
			.valid(1),
			.write(write),
			.address(set),
			.data_in(tag),
			.data_out(tag_out)
			);

	cache0 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[0]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out0)
					);

	cache1 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[1]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out1)
					);

	cache2 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[2]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out2)
					);

	cache3 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[3]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out3)
					);


	cache4 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[4]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out4)
					);

	cache5 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[5]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out5)
					);

	cache6 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[6]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out6)
					);

	cache7 cache_mod (
					.clk(clk),
					.reset(reset),
					.valid(one_hot[7]),
					.write(write),
					.address(set),
					.data_in(data_in),
					.data_out(data_out7)
					);

endmodule