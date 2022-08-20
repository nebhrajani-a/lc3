module lc3_pc
  (clk,
   rst,
   pcmux,
   ld_pc,
   addr_out,
   gate_pc,
   data_bus
   );

  input         clk;
  input         rst;
  input  [1:0]  pcmux;
  input         ld_pc;
  input  [15:0] addr_out;
  input         gate_pc;
  inout  [15:0] data_bus;

  reg    [15:0] pc;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          pc <= 16'h3000; // starting program position (without OS)
        end
      else if (ld_pc)
        begin
          case (pcmux)
            2'b00:   pc <= pc + 1'b1;
            2'b01:   pc <= data_bus;
            2'b10:   pc <= addr_out;
            default: pc <= pc + 1'b1;
          endcase
        end
    end // always @ (posedge clk or negedge rst)

  assign data_bus = (gate_pc == 1'b1) ? pc : {16{1'bz}};

endmodule
