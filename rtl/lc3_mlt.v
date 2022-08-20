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
      for (t = 0; t < 100; ++t)
        begin
          for (i = 0; i < 8; ++i)
            begin
            if (lc3_mlt.DUT.lc3_regfile_u9.registers[i] != 1'b0)
              $display("FLAG R%0d: %0d", i, lc3_mlt.DUT.lc3_regfile_u9.registers[i]);
            end
          // $display("IR: %b", lc3_mlt.DUT.lc3_ir_u4.ir);
          // $display("PC: %b", lc3_mlt.DUT.lc3_pc_u8.pc);
          // $display("MEM: %b", lc3_mlt.DUT.lc3_regfile_u9.lc3_mem_u6.raminst.ram[lc3_mlt.DUT.lc3_pc_u8.pc]);
          // $display("BUS: %b", lc3_mlt.DUT.data_bus);
          #10;
        end
      $finish;
    end

endmodule
