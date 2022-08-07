module lc3_alu
  (alu_k,
   op_a,
   op_b,
   out
   );

  input      [1:0]   alu_k;
  input      [15:0]  op_a;
  input      [15:0]  op_b;
  output reg [15:0]  out;

  always @(*)
    begin
      case (alu_k)
        2'b00:   out = op_a + op_b;
        2'b01:   out = op_a & op_b;
        2'b10:   out = ~op_a;
        2'b11:   out = op_a;
        default: out = op_a;
      endcase
    end

endmodule
