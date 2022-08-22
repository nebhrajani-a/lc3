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
  parameter DEPTH = 'hffff;
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
  reg                             ready;

  initial
    begin
      $readmemh("lc3os.hex", ram, 'h0000);
      ram['hfe04] = {1'b1, {15{1'b0}}};
    end

  always @(posedge clk)
    begin
      if (cs == 1'b1)
        begin
          if (r_w == 1'b1)
            begin
              ram[addr] <= data_in;
            end
          data_out <= ram[addr];
          ready <= 1'b1;
        end
      else
        begin
          ready <= 1'b0;
        end
    end

  always @(addr)
    begin
      if (addr == 'hfe06)
        $write("%c", ram['hfe06]);
    end
  always @(ram['hfffe])
    begin
      if (ram['hfffe][15] == 1'b0)
        begin
          $finish;
        end
    end

endmodule
