interface clk_if();
  logic clk;
  
  initial clk <= 0;
  
  always #10 clk = ~clk;
endinterface
