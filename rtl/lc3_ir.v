module lc3_ir
  (clk,
   rst,
   data_bus,
   ld_ir,
   ir
   );

  input              clk;
  input              rst;
  input [15:0]       data_bus;
  input              ld_ir;
  output [15:0]      ir;

  reg [15:0]         ir;


  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          ir <= {16{1'b0}};
        end
      else if (ld_ir)
        begin
          ir <= data_bus;
        end
    end

endmodule
