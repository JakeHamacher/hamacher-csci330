module sr_latch(input s, input r, input clk, output reg q, output reg q_n);

  reg internal_s, internal_r;

  always @(posedge clk) begin
    internal_s <= s;
    internal_r <= r;

    if (internal_r == 1'b0 && internal_s == 1'b0) begin
      q <= 1'b0;
      q_n <= 1'b1;
    end else if (internal_r == 1'b1 && internal_s == 1'b0) begin
      q <= 1'b1;
      q_n <= 1'b0;
    end else if (internal_r == 1'b0 && internal_s == 1'b1) begin
      q <= 1'b0;
      q_n <= 1'b1;
    end else begin
      // Undefined state for S=1 and R=1
      q <= 1'bx;
      q_n <= 1'bx;
    end
  end

endmodule