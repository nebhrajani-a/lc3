module lc3_mem
  (clk,
   rst,
   ld_mar,
   ld_mdr,
   mio_en,
   r_w,
   gate_mdr,
   data_bus,
   ready
   );

  input         clk;
  input         rst;
  input         ld_mar;
  input         ld_mdr;
  input         mio_en;
  input         r_w;
  input         gate_mdr;
  inout [15:0]  data_bus;
  output        ready;

  reg [15:0]    mar;
  reg [15:0]    mdr;
  wire [15:0]   ram_out;

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          mar <= {16{1'b0}};
          mdr <= {16{1'b0}};
        end
      else
        begin
          if (ld_mar)
            begin
              mar <= data_bus;
            end
          if (ld_mdr)
            begin
              mdr <= (mio_en == 1'b1) ? ram_out : data_bus;
            end
        end
    end

  lc3_ram raminst
    (.clk(clk),
     .r_w(r_w),
     .cs(mio_en),
     .data_in(mdr),
     .addr(mar),
     .ready(ready),
     .data_out(ram_out)
     );

  assign data_bus = (gate_mdr == 1'b1) ? mdr : {16{1'bz}};

endmodule
