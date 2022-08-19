module lc3_pc
  (clk,
   rst,
   pcmux,
   ld_pc,
   addr_out,
   data_bus,
   gate_pc,
   pc_out
   );

  input         clk;
  input         rst;
  input  [1:0]  pcmux;
  input         ld_pc;
  input  [15:0] addr_out;
  input  [15:0] data_bus;
  input         gate_pc;
  output [15:0] pc_out;

  reg    [15:0] pc;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b1)
        begin
          pc <= {16{1'b0}};
        end
      else if (ld_pc)
        begin
          case (pcmux)
            2'b00:   pc <= pc + 1'b1;
            2'b01:   pc <= data_bus;
            2'b10:   pc <= addr_out;
            default: pc <= pc + 1'b1;
          endcase
        end // else: !if(rst == 1'b1)
    end // always @ (posedge clk or negedge rst)

  assign pc_out = (gate_pc == 1'b1) ? pc : {16{1'bx}};

endmodule
