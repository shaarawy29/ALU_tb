import my_pkg::*;
typedef class env;

class test;
  env e0;
  mailbox drv_mbx;
 // virtual ALU_if m_ALU_if;
  //virtual clk_if m_clk_if;
  
  function new();
		//this.m_ALU_if = m_ALU_if;
		//this.m_clk_if = m_clk_if; 
    drv_mbx = new();
    e0 = new();
  endfunction
  
  virtual task run();
    e0.d.drv_mbx = drv_mbx;
		//e0.assign_cov();
    //e0.m_ALU_if = m_ALU_if;
    //e0.m_clk_if = m_clk_if;
    e0.run();
  endtask
endclass
