import my_pkg::*;
typedef class driver;
typedef class generator;
typedef class monitor;
typedef class scoreboard;
typedef class coverage;
typedef class functional_coverage;
typedef class coverage_sub;
class env;
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  coverage c;
	coverage_sub c_sub;
  functional_coverage f;
  
  mailbox scb_mbx;
  mailbox drv_mbx;
  
  virtual ALU_if m_ALU_if;
  virtual clk_if m_clk_if;
  
  event drv_done;
  event ok;
	
	real curr_cov;
  
  function new();
    d = new;
    m = new;
    s = new;
    g = new;
    c = new;
		c_sub = new;
    f = new;
    
    scb_mbx = new();
    drv_mbx = new();
    
  endfunction
  
  virtual task run();
    //connecting vitual interface handles
    d.m_ALU_if = m_ALU_if;
    m.m_ALU_if = m_ALU_if;
    d.m_clk_if = m_clk_if;
    m.m_clk_if = m_clk_if;
		c.m_ALU_if = m_ALU_if;
		c.m_clk_if = m_clk_if;
    f.m_ALU_if = m_ALU_if;
		f.m_clk_if = m_clk_if;
		c_sub.m_ALU_if = m_ALU_if;
		c_sub.m_clk_if = m_clk_if;
    //connecting the mailboxesx 
    d.drv_mbx = drv_mbx;
    g.drv_mbx = drv_mbx;
    
    m.scb_mbx = scb_mbx;
    s.scb_mbx = scb_mbx;
    
    //connecting the events
    d.drv_done = drv_done;
    g.drv_done = drv_done;
		g.cov_done = c.cov_done;
		g.cov_done_sub = c_sub.cov_done;
    //c.ok = ok;
    s.ok = ok;
    f.ok = ok;

		//curr_cov = c.curr_cov;
		//g.curr_cov = c.curr_cov;
    
    fork 
      g.run();
      d.run();
      s.run();
      m.run();
			//begin
			//if(this.m_ALU_if.ALU_sel == 4'h0) begin
				//g.cov_done = c.cov_done;
				c.run();
				//end
			//end
			//begin
			//if(this.m_ALU_if.ALU_sel == 4'h1) begin
				//g.cov_done_sub = c_sub.cov_done;
				c_sub.run();
				//end
			//end
      f.run();
  			begin
				forever begin
					@(c.cov_done);
					g.curr_cov = c.curr_cov;
				end
			end
    join_any
  endtask

	//virtual task assign_cov();
		
	//endtask

endclass
    