module lc3_nzp
  (clk,
   rst,
   ld_cc,
   ld_ben,
   data_bus,
   ir,
   ben,
   );

  input        clk;
  input        rst;
  input [15:0] ir;
  input [15:0] data_bus;
  input        ld_cc;
  input        ld_ben;
  output       ben;

  reg          n;
  reg          z;
  reg          p;
  reg          ben;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          n <= 1'b0;
          z <= 1'b0;
          p <= 1'b0;
          ben <= 1'b0;
        end
      else
        begin
          if (ld_cc)
            begin
              n <= data_bus[15];
              z <= data_bus == {16{1'b0}};
              p <= ~data_bus[15];
            end
          if (ld_ben)
            begin
              ben <= (ir[11] & n) | (ir[10] & z) | (ir[9] & p);
            end
        end
    end

endmodule
