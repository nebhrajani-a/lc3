// purely combinational (!)
module lc3_alu
  (aluk,
   sr1out,
   ir,
   sr2out,
   gate_alu,
   data_bus
   );

  input  [1:0]   aluk;
  input  [15:0]  sr1out;
  input  [15:0]  ir;
  input  [15:0]  sr2out;
  input          gate_alu;
  output [15:0]  data_bus;

  reg    [15:0]  alu_comp;
  wire [15:0]    op_b;

  assign op_b = (ir[5] == 1'b1) ? {{11{ir[4]}}, ir[4:0]} : sr2out;

  always @(*)
    begin
      case (aluk)
        2'b00:   alu_comp = sr1out + op_b;
        2'b01:   alu_comp = sr1out & op_b;
        2'b10:   alu_comp = ~sr1out;
        2'b11:   alu_comp = sr1out;
        default: alu_comp = sr1out;
      endcase
    end

  assign data_bus = (gate_alu == 1'b1) ? alu_comp : {16{1'bz}};

endmodule
