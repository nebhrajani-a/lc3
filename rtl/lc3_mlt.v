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
      // while (1)
        // begin
          // #10;
          // if (lc3_mlt.DUT.lc3_pc_u8.pc == 16'h3000)
        // begin
          // for (i = 0; i < 8; ++i)
            // begin
          // i = 3;
            // if (lc3_mlt.DUT.lc3_pc_u8.pc >= 'h3008)
              // begin
              //   $display("FLAG R%0d: %0d", i, lc3_mlt.DUT.lc3_regfile_u9.registers[i]);
              // begin
              //   $display("PC: %x", lc3_mlt.DUT.lc3_pc_u8.pc);
              //       $display("NZP: %b%b%b", lc3_mlt.DUT.lc3_nzp_u7.data_bus[15]
              // ,lc3_mlt.DUT.lc3_nzp_u7.data_bus == {16{1'b0}},
              // ~lc3_mlt.DUT.lc3_nzp_u7.data_bus[15]);
              //   i = 1;
              //   $display("FLAG R%0d: %0d", i, lc3_mlt.DUT.lc3_regfile_u9.registers[i]);

              // end
              //   if (lc3_mlt.DUT.lc3_nzp_u7.ld_cc)
              //     begin
              //     $display("BUS: %x", lc3_mlt.DUT.data_bus);
              //       $display("NZP: %b%b%b", lc3_mlt.DUT.lc3_nzp_u7.data_bus[15]
              // ,lc3_mlt.DUT.lc3_nzp_u7.data_bus == {16{1'b0}},
              // ~lc3_mlt.DUT.lc3_nzp_u7.data_bus[15]);
              //     end
              // end
            // end
          // $display("IR: %x", lc3_mlt.DUT.lc3_ir_u4.ir);
          // #10;
        // end // while (1)
    end

endmodule
