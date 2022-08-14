import my_pkg::*;
typedef class test;
module tb;
 
  clk_if m_clk_if0();
  ALU_if m_ALU_if0();
  alu u0 (m_ALU_if0.A,m_ALU_if0.B,m_ALU_if0.ALU_sel,m_ALU_if0.ALU_out,m_ALU_if0.Carry_out);

  initial begin
    test t0;	
		test t1;	

    t0 = new();
    t0.e0.m_ALU_if = m_ALU_if0;
    t0.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h0;
    t0.run();

    t1 = new();
    t1.e0.m_ALU_if = m_ALU_if0;
    t1.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h1;
    t1.run();
 
    #50 $finish;
  end
endmodule

/*module sub;
  clk_if m_clk_if0();
  ALU_if m_ALU_if0();
  alu u0 (m_ALU_if0.A,m_ALU_if0.B,m_ALU_if0.ALU_sel,m_ALU_if0.ALU_out,m_ALU_if0.Carry_out);
  initial begin
    test t0;
	
	
    t0 = new();
    t0.e0.m_ALU_if = m_ALU_if0;
    t0.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h1;
    t0.run();
end 
endmodule
*/

