
import my_pkg::*;
typedef class test;
module tb;

  //bit clk;
 
  clk_if m_clk_if();
  ALU_if m_ALU_if();
  alu u0 (m_ALU_if.A,m_ALU_if.B,m_ALU_if.ALU_sel,m_ALU_if.ALU_out,m_ALU_if.Carry_out);
  
  initial begin
    test t0;
    
    t0 = new;
    t0.e0.m_ALU_if = m_ALU_if;
    t0.e0.m_clk_if = m_clk_if;
    t0.run();
    
    #50 $finish;
  end
endmodule

