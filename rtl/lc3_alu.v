// flop out?
module lc3_alu
  (alu_k,
   op_a,
   op_b,
   alu_out
   );

  input  [1:0]   alu_k;
  input  [15:0]  op_a;
  input  [15:0]  op_b;
  output [15:0]  alu_out;

  reg    [15:0]  alu_out;

  always @(*)
    begin
      case (alu_k)
        2'b00:   alu_out = op_a + op_b;
        2'b01:   alu_out = op_a & op_b;
        2'b10:   alu_out = ~op_a;
        2'b11:   alu_out = op_a;
        default: alu_out = op_a;
      endcase
    end

endmodule
