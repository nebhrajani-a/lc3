module lc3_regfile
  (clk,
   rst,
   ld_reg,
   drmux,
   sr1mux,
   ir,
   data_bus,
   sr1out,
   sr2out
   );

  input         clk;
  input         rst;
  input         ld_reg;
  input  [1:0]  drmux;
  input  [1:0]  sr1mux;
  input  [15:0] ir;
  input  [15:0] data_bus;
  output [15:0] sr1out;
  output [15:0] sr2out;

  reg    [15:0] registers [7:0];
  reg    [15:0] sr1out;

  integer       i;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          for (i = 0; i < 7; i = i + 1)
            begin
              registers[i] <= {16{1'b0}};
            end
        end
      else if (ld_reg)
        begin
          case (drmux)
            2'b00:   registers[ir[11:9]] <= data_bus;
            2'b01:   registers[3'b111] <= data_bus;
            2'b10:   registers[3'b110] <= data_bus;
            default: registers[ir[11:9]] <= data_bus;
          endcase // case (drmux)
        end
    end // always @ (posedge clk or negedge rst)

  always @(*)
    begin
      case (sr1mux)
        2'b00:   sr1out = registers[ir[11:9]];
        2'b01:   sr1out = registers[ir[8:6]];
        2'b10:   sr1out = registers[3'b110];
        default: sr1out = registers[ir[11:9]];
      endcase // case (sr1mux)
    end

  assign sr2out = registers[ir[2:0]];

endmodule
