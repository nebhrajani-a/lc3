module lc3_addr_sel
  (addr1_mux,
   addr2_mux,
   ir,
   pc,
   sr1out,
   addr_out
   );

  input         addr1_mux;
  input  [1:0]  addr2_mux;
  input  [15:0] ir;
  input  [15:0] pc;
  input  [15:0] sr1out;
  output [15:0] addr_out;

  reg    [15:0] addr1_mux_out;
  reg    [15:0] addr2_mux_out;

  always @(*)
    begin
      case (addr1_mux)
        1'b0:    addr1_mux_out = pc;
        1'b1:    addr1_mux_out = sr1out;
        default: addr1_mux_out = pc;
      endcase
    end

  always @(*)
    begin
      case (addr2_mux)
        2'b00:   addr2_mux_out = {16{1'b0}};
        2'b01:   addr2_mux_out = {{10{ir[5]}}, ir[5:0]};
        2'b10:   addr2_mux_out = {{7{ir[5]}}, ir[8:0]};
        2'b11:   addr2_mux_out = {{5{ir[5]}}, ir[10:0]};
        default: addr2_mux_out = 4'h0;
      endcase
    end

  assign addr_out = addr1_mux_out + addr2_mux_out;

endmodule
