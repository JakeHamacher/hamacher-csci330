module gated_sr_latch_testbench;

  reg s, r, enable, clk;
  wire q, q_n;

  gated_sr_latch gated_sr_latch_inst (
    .s(s),
    .r(r),
    .enable(enable),
    .clk(clk),
    .q(q),
    .q_n(q_n)
  );

  initial begin
    // Title
    $display(" S | R | EN | Q(t) | ~Q(t) | Q(t+1) | ~Q(t+1)");
    $display("---------------------------------------------");

    // Test Case 1
    s = 1'b0;
    r = 1'b0;
    enable = 1'b1;
    #10; // Introduce a delay of 10 time units
    clk = 1'b1; #5; clk = 1'b0; // Clock edge
    $display("| %b | %b | %b  |   %b   |   %b   |   %b    |    %b", s, r, enable, q, ~q, q, ~q);

    // Test Case 2
    s = 1'b0;
    r = 1'b1;
    enable = 1'b1;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b | %b  |   %b   |   %b   |   %b    |    %b", s, r, enable, q, ~q, q, ~q);

    // Test Case 3
    s = 1'b1;
    r = 1'b0;
    enable = 1'b1;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b | %b  |   %b   |   %b   |   %b    |    %b", s, r, enable, q, ~q, q, ~q);

    // Test Case 4
    s = 1'b1;
    r = 1'b1;
    enable = 1'b1;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b | %b  |   %b   |   %b   |   X    |    X", s, r, enable, q, ~q);

    // Test Case 5 (Disable latch)
    s = 1'b0;
    r = 1'b0;
    enable = 1'b0;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b | %b  |   %b   |   %b   |   X    |    X", s, r, enable, q, ~q);

    $finish; // End simulation
  end

endmodule
