module lc3_datapath
  (clk,
   rst,
   );

  input         clk;
  input         rst;

  wire [15:0]   ir;
  wire          ben;
  wire          ready;
  wire          addr1mux;
  wire [1:0]    addr2mux;
  wire [1:0]    aluk;
  wire          clk;
  wire [1:0]    drmux;
  wire          gate_alu;
  wire          gate_marmux;
  wire          gate_mdr;
  wire          gate_pc;
  wire          ld_ben;
  wire          ld_cc;
  wire          ld_ir;
  wire          ld_mar;
  wire          ld_mdr;
  wire          ld_pc;
  wire          ld_reg;
  wire          marmux;
  wire          mio_en;
  wire [15:0]   pc;
  wire [1:0]    pcmux;
  wire          r_w;
  wire          rst;
  wire [1:0]    sr1mux;
  wire [15:0]   addr_out;
  wire [15:0]   data_bus;
  wire [15:0]   sr1out;
  wire [15:0]   sr2out;
  wire [25:0]   control_bits;

  assign {ld_ben, ld_mar, ld_mdr, ld_ir, ld_pc,
          ld_reg, ld_cc, gate_marmux, gate_mdr, gate_alu,
          gate_pc, marmux, pcmux, addr1mux, addr2mux, drmux,
          sr1mux, aluk, mio_en, r_w} = control_bits;

  lc3_addr_sel lc3_addr_sel_u1
    (.addr1mux(addr1mux),
     .addr2mux(addr2mux),
     .addr_out(addr_out),
     .ir(ir),
     .pc(pc),
     .sr1out(sr1out)
     );

  lc3_alu lc3_alu_u2
    (.aluk(aluk),
     .data_bus(data_bus),
     .gate_alu(gate_alu),
     .ir(ir),
     .sr1out(sr1out),
     .sr2out(sr2out)
     );

  lc3_control lc3_control_u3
    (.ben(ben),
     .clk(clk),
     .control_bits(control_bits),
     .ir(ir),
     .ready(ready),
     .rst(rst)
     );

  lc3_ir lc3_ir_u4
    (.clk(clk),
     .data_bus(data_bus),
     .ir(ir),
     .ld_ir(ld_ir),
     .rst(rst)
     );

  lc3_marmux lc3_marmux_u5
    (.addr_out(addr_out),
     .data_bus(data_bus),
     .gate_marmux(gate_marmux),
     .ir(ir),
     .marmux(marmux)
     );

  lc3_mem lc3_mem_u6
    (.clk(clk),
     .data_bus(data_bus),
     .gate_mdr(gate_mdr),
     .ld_mar(ld_mar),
     .ld_mdr(ld_mdr),
     .mio_en(mio_en),
     .r_w(r_w),
     .ready(ready),
     .rst(rst)
     );

  lc3_nzp lc3_nzp_u7
    (.ben(ben),
     .clk(clk),
     .data_bus(data_bus),
     .ir(ir),
     .ld_ben(ld_ben),
     .ld_cc(ld_cc),
     .rst(rst)
     );

  lc3_pc lc3_pc_u8
    (.addr_out(addr_out),
     .clk(clk),
     .data_bus(data_bus),
     .gate_pc(gate_pc),
     .ld_pc(ld_pc),
     .pcmux(pcmux),
     .pc(pc),
     .rst(rst)
     );

  lc3_regfile lc3_regfile_u9
    (.clk(clk),
     .data_bus(data_bus),
     .drmux(drmux),
     .ir(ir),
     .ld_reg(ld_reg),
     .rst(rst),
     .sr1mux(sr1mux),
     .sr1out(sr1out),
     .sr2out(sr2out)
     );

endmodule
