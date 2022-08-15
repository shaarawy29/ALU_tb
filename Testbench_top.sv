import my_pkg::*;
typedef class test;
module tb;
 
  clk_if m_clk_if0();
  ALU_if m_ALU_if0();
  alu u0 (m_ALU_if0.A,m_ALU_if0.B,m_ALU_if0.ALU_sel,m_ALU_if0.ALU_out,m_ALU_if0.Carry_out);

  initial begin
    test t0;	
		test t1;	
		test t2;
		test t3;
		test t4;
		test t5;
		test t6;
		test t7;	
		test t8;	
		test t9;
		test t10;
		test t11;
		test t12;
		test t13;
		test t14;
		test t15;
		test t16;

    t0 = new();
    t0.e0.m_ALU_if = m_ALU_if0;
    t0.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h0;
    t0.run();
		#5;
		
    t1 = new();
    t1.e0.m_ALU_if = m_ALU_if0;
    t1.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h1;
    t1.run();
		#5;

    t2 = new();
    t2.e0.m_ALU_if = m_ALU_if0;
    t2.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h2;
    t2.run();
		#5;
		
		t3 = new();
    t3.e0.m_ALU_if = m_ALU_if0;
    t3.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h3;
    t3.run();
		#5;

		t4 = new();
    t4.e0.m_ALU_if = m_ALU_if0;
    t4.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h4;
    t4.run();
		#5;

		t5 = new();
    t5.e0.m_ALU_if = m_ALU_if0;
    t5.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h5;
    t5.run();
		#5;

    t6 = new();
    t6.e0.m_ALU_if = m_ALU_if0;
    t6.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h6;
    t6.run();
		#5;
		
    t7 = new();
    t7.e0.m_ALU_if = m_ALU_if0;
    t7.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h7;
    t7.run();
		#5;

    t8 = new();
    t8.e0.m_ALU_if = m_ALU_if0;
    t8.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h8;
    t8.run();
		#5;
		
		t9 = new();
    t9.e0.m_ALU_if = m_ALU_if0;
    t9.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'h9;
    t9.run();
		#5;

		t10 = new();
    t10.e0.m_ALU_if = m_ALU_if0;
    t10.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'ha;
    t10.run();
		#5;

    t11 = new();
    t11.e0.m_ALU_if = m_ALU_if0;
    t11.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'hb;
    t11.run();
		#5;
		
    t12 = new();
    t12.e0.m_ALU_if = m_ALU_if0;
    t12.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'hc;
    t12.run();
		#5;

    t13 = new();
    t13.e0.m_ALU_if = m_ALU_if0;
    t13.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'hd;
    t13.run();
		#5;
		
		t14 = new();
    t14.e0.m_ALU_if = m_ALU_if0;
    t14.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'he;
    t14.run();
		#5;

		t15 = new();
    t15.e0.m_ALU_if = m_ALU_if0;
    t15.e0.m_clk_if = m_clk_if0;
		m_ALU_if0.ALU_sel = 4'hf;
    t15.run();
		#5;
		
		fork begin
				t16 = new();
				t16.e0.m_ALU_if = m_ALU_if0;
    		t16.e0.m_clk_if = m_clk_if0;
				t16.run();
			end
			begin
				m_ALU_if0.ALU_sel = 4'h0;
				#20;
				m_ALU_if0.ALU_sel = 4'h1;
				#20;
				m_ALU_if0.ALU_sel = 4'h2;
				#20;
			end
		join_any
		#5 $finish;

  end
endmodule

