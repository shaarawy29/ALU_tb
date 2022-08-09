module tb;
  bit clk;
  
  clk_if m_clk_if();
  ALU_if m_ALU_if();
  ALU u0 (m_ALU_if);
  
  initial begin
    test t0;
    
    t0 = new;
    t0.eo.m_ALU_if = m_ALU_if;
    t0.eo.m_clk_if = m_clk_if;
    t0.run();
    
    #50 $finish;
  end
endmodule
