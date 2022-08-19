module lc3_ram
  (clk,
   r_w,
   cs,
   data_in,
   addr,
   ready,
   data_out
   );

  parameter DATA_WIDTH = 16;
  parameter DEPTH = 65024;
  localparam ADDR_WIDTH = $clog2(DEPTH);

  input                           clk;
  input                           r_w;
  input                           cs;
  input [DATA_WIDTH - 1 : 0]      data_in;
  input [ADDR_WIDTH - 1 : 0]      addr;
  output                          ready;
  output [DATA_WIDTH - 1 : 0]     data_out;

  reg [DATA_WIDTH - 1 : 0]        data_out;
  reg [DATA_WIDTH - 1 : 0]        ram [0 : DEPTH - 1];

  always @(posedge clk)
    begin
      if (cs == 1'b1)
        begin
          if (r_w == 1'b1)
            begin
              ram[addr] <= data_in;
            end
          data_out <= ram[addr];
        end
    end


endmodule
