import my_pkg::*;
typedef class test;
module test_9;
	clk_if m_clk_if();
  ALU_if m_ALU_if();
  alu u (m_ALU_if.A,m_ALU_if.B,m_ALU_if.ALU_sel,m_ALU_if.ALU_out,m_ALU_if.Carry_out);
program automatic test_9;
initial begin
		test t;
		t = new();
		t.e0.m_ALU_if = m_ALU_if;
   	t.e0.m_clk_if = m_clk_if;
		m_ALU_if.ALU_sel = 4'h9;
		t.run();
		#5 $finish;
end
endprogram
endmodule
