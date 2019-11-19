`timescale 1ns / 1ps

// momoria total = 4MB
//cada chip = 0.125 MB - 18 bits
// simm density = 8 * 0.125
// n simms = total / 1MB = 4 simms
// 21 bits - 18(por chip) + 2(para endereçar os 4 simm) + 1(para scolher a linha)


module simm 
   (
      input[18:0] addr
      input [3:0] cas,
      input [1:0] ras
      output [15:0] data
   );

endmodule : simm



module chip
   (
      input cas,
      input ras,
      input we,   
      input [20:0] addr, 
      output[15:0] data 
   );
  
  wire [7:0] ras_decoded

  always @(*) begin
      case (addr[20:28]):
          2'd0: begin
            ras_decoded[0] <= ras;
         end
          2'd1: begin
            ras_decoded[1] <= ras;
         end
          2'd2: begin
            ras_decoded[2] <= ras;
         end
          2'd3: begin
            ras_decoded[3] <= ras;
         end
          2'd4: begin
            ras_decoded[4] <= ras;
         end
          2'd5: begin
            ras_decoded[5] <= ras;
         end
          2'd6: begin
            ras_decoded[6] <= ras;
         end
          2'd7: begin
            ras_decoded[7] <= ras;
         end

  end

   sim0 sim(
         .addr(addr[17:0]),
         .cas({cas, cas, cas, cas}),
         .ras(ras_decoded[1:0]),
         .data(data)
      );

   sim1 sim(
         .addr(addr[17:0]),
         .cas({cas, cas, cas, cas}),
         .ras(ras_decoded[3:2]),
         .data(data)
      );

   sim2 sim(
      .addr(addr[17:0]),
      .cas({cas, cas, cas, cas}),
      .ras(ras_decoded[5:4]),
      .data(data)
      );


   sim3 sim(
      .addr(addr[17:0]),
      .cas({cas, cas, cas, cas}),
      .ras(ras_decoded[7:6]),
      .data(data)
      );

endmodule : chip
