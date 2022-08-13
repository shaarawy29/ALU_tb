
import my_pkg::*;
typedef class test;
module tb;

  //bit clk;
 
  clk_if m_clk_if0();
  ALU_if m_ALU_if0();
  alu u0 (m_ALU_if0.A,m_ALU_if0.B,m_ALU_if0.ALU_sel,m_ALU_if0.ALU_out,m_ALU_if0.Carry_out);

	/*clk_if m_clk_if1();
  ALU_if m_ALU_if1();
  alu u1 (m_ALU_if1.A,m_ALU_if1.B,m_ALU_if1.ALU_sel,m_ALU_if1.ALU_out,m_ALU_if1.Carry_out);*/

	/*clk_if m_clk_if2();
  ALU_if m_ALU_if2();
  alu u2 (m_ALU_if2.A,m_ALU_if2.B,m_ALU_if2.ALU_sel,m_ALU_if2.ALU_out,m_ALU_if2.Carry_out);

	clk_if m_clk_if3();
  ALU_if m_ALU_if3();
  alu u3 (m_ALU_if3.A,m_ALU_if3.B,m_ALU_if3.ALU_sel,m_ALU_if3.ALU_out,m_ALU_if3.Carry_out);*/
  
  initial begin
    test t0;
		test t1;
		/*test t2;
		test t3;*/

		//t0.m_ALU_if = m_ALU_if0;
		//t0.m_clk_if = m_clk_if0;
		
		/*t1.m_ALU_if = m_ALU_if1;
		t1.m_clk_if = m_clk_if1;

		t2.m_ALU_if = m_ALU_if2;
		t2.m_clk_if = m_clk_if2;

		t3.m_ALU_if = m_ALU_if3;
		t3.m_clk_if = m_clk_if3;*/
    t0 = new();
		/*t1 = new();
		t2 = new();
		t3 = new();*/
    t0.e0.m_ALU_if = m_ALU_if0;
    t0.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h0;
    t0.run();
		
		$display("first instance of class test done, instruction is addition+++++++++++++++++++++++++++++");
		
		t1 = new();
    t1.e0.m_ALU_if = m_ALU_if0;
    t1.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h1;
    t1.run();

		$display("second instance of class test done, instruction is subtration-----------------------------");


		/*t1 = new();
		t1.e0.m_ALU_if = m_ALU_if1;
    t1.e0.m_clk_if = m_clk_if1;
		m_ALU_if1.ALU_sel = 4'h2;
    t1.run();
		/*t1.run();
		t2.run();
		t3.run();*/
 
    #50 $finish;
  end
endmodule

