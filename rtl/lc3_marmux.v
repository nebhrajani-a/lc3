module lc3_marmux
  (marmux,
   ir,
   addr_out,
   gate_marmux,
   marmux_out
   );

  input         marmux;
  input [15:0]  ir;
  input [15:0]  addr_out;
  input         gate_marmux;
  output [15:0] marmux_out;

  wire          marmux_mux_out;

  assign marmux_mux_out = (marmux == 1'b1)
                           ? addr_out
                          : {{8{1'b0}}, ir[7:0]};

  assign marmux_out = (gate_marmux == 1'b1)
                      ? marmux_mux_out
                      : {16{1'bx}};

endmodule
