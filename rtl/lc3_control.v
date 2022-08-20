module lc3_control
  (clk,
   rst,
   ready,
   ir,
   ben,
   control_bits
   );

  input         clk;
  input         rst;
  input         ready;
  input [15:0]  ir;
  input         ben;
  output [25:0] control_bits;

  reg [34:0]    control_store [0:63];
  reg [5:0]     state;

  // Infer a ROM for control store
  initial
    begin
      $readmemb("microcode.bin", control_store);
    end

  always @(posedge clk or negedge rst)
    begin
      if (rst == 1'b0)
        begin
          state <= 6'b010010; // start at state 18
        end
      else
        begin
          // IRD
          if (control_store[state][25] == 1'b1)
            begin
              state <= {2'b00, ir[15:12]};
            end
          else
            begin
              // review
              case (control_store[state][28:26])
                3'b000: state <= control_store[state][34:29];
                3'b001: state <= control_store[state][34:29] | {4'h0, ready, 1'b0};
                3'b010: state <= control_store[state][34:29] | {3'b000, ben, 2'b00};
                3'b011: state <= control_store[state][34:29] | {5'h0, ir[11]};
                default: state <= control_store[state][34:29];
              endcase
            end
        end
    end // always @ (posedge clk or negedge rst)

  assign control_bits = control_store[state][24:0];

endmodule
