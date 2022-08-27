module lc3_mlt();

  reg clk;
  reg rst;

  integer i;
  integer t;

  lc3_datapath DUT(.clk(clk), .rst(rst));

  always
    begin
      clk <= 1;
      #5;
      clk <= 0;
      #5;
   end


  initial
    begin
      $dumpvars;
      rst <= 1'b0;
      #10;
      rst <= 1'b1;
      while (1) #1;
        // begin
          // for (i = 0; i < 8; ++i)
            // begin
            // if (lc3_mlt.DUT.lc3_regfile_u9.registers[i] != 1'b0)
              // $display("FLAG R%0x: %0x", i, lc3_mlt.DUT.lc3_regfile_u9.registers[i]);
            // end
          // $display("IR: %x", lc3_mlt.DUT.lc3_ir_u4.ir);
          // $display("PC: %x", lc3_mlt.DUT.lc3_pc_u8.pc);
          // $display("BUS: %x", lc3_mlt.DUT.data_bus);
          // #10;
        // end // for (t = 0; t < 100; ++t)
      // for (i = 0; i < 65536; ++i)
        // $display("MEM %4x: %x", i, lc3_mlt.DUT.lc3_regfile_u9.lc3_mem_u6.raminst.ram[i]);
      // $finish;
    end

endmodule
