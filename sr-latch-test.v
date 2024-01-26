module sr_latch_testbench;

  reg s, r, clk;
  wire q, q_n;

  sr_latch sr_latch_inst (
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .q_n(q_n)
  );

  initial begin
    // Title
    $display(" S | R | Q(t) | ~Q(t) | Q(t+1) | ~Q(t+1)");
    $display("---------------------------------------");

    // Test Case 1
    s = 1'b0;
    r = 1'b0;
    #10; // Introduce a delay of 10 time units
    clk = 1'b1; #5; clk = 1'b0; // Clock edge
    $display("| %b | %b |   %b   |   %b   |   %b    |    %b", s, r, q, ~q, q, ~q);

    // Test Case 2
    s = 1'b0;
    r = 1'b1;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b |   %b   |   %b   |   %b    |    %b", s, r, q, ~q, q, ~q);

    // Test Case 3
    s = 1'b1;
    r = 1'b0;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b |   %b   |   %b   |   %b    |    %b", s, r, q, ~q, q, ~q);

    // Test Case 4
    s = 1'b1;
    r = 1'b1;
    #10;
    clk = 1'b1; #5; clk = 1'b0;
    $display("| %b | %b |   %b   |   %b   |   X    |    X", s, r, q, ~q);

    $finish; // End simulation
  end

endmodule