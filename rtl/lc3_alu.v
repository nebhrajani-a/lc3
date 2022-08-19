module lc3_alu
  (clk,
   rst,
   alu_k,
   op_a,
   op_b,
   gate_alu,
   alu_out
   );

  input          clk;
  input          rst;
  input  [1:0]   alu_k;
  input  [15:0]  op_a;
  input  [15:0]  op_b;
  input          gate_alu;
  output [15:0]  alu_out;

  reg    [15:0]  alu_out_reg;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          alu_out_reg <= {16{1'b0}};
        end
      else
        begin
          case (alu_k)
            2'b00:   alu_out_reg <= op_a + op_b;
            2'b01:   alu_out_reg <= op_a & op_b;
            2'b10:   alu_out_reg <= ~op_a;
            2'b11:   alu_out_reg <= op_a;
            default: alu_out_reg <= op_a;
          endcase // case (alu_k)
        end
    end // always @ (posedge clk or negedge rst)

  assign alu_out = (gate_alu == 1'b1) ? alu_out_reg : {16{1'bx}};

endmodule
