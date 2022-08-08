interface adder_if();
  logic rstn;
  logic [7:0] A;
  logic [7:0] B;
  logic [3:0] ALU_sel;
  logic [7:0] ALU_out;
  logic Carry_out;
  
endinterface

interface clk_if();
  logic tb_clk;
  
  initial tb_clk <= 0;
  
  always #10 tb_clk = ~tb_clk;
endinterface
