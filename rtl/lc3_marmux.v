module lc3_marmux
  (marmux,
   ir,
   addr_out,
   marmux_out
   );

  input         marmux;
  input [15:0]  ir;
  input [15:0]  addr_out;
  output [15:0] marmux_out;

  assign marmux_out = marmux == 1'b0
                      ? {{8{1'b0}}, ir[7:0]}
                      : addr_out;

endmodule
