import my_pkg::*;
class coverage;
  virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	real curr_cov;

  covergroup cg @(posedge m_clk_if.clk);
    first_input: coverpoint m_ALU_if.A {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    second_input: coverpoint m_ALU_if.B {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    cross first_input, second_input;
endgroup

	task run();
		forever @(posedge m_clk_if.clk) curr_cov = $get_coverage();
	endtask
    
    function new();
    	cg = new;
    endfunction
//reference book was written in the form of input and not an interface 
//check this if any error happend later 
  

  
endclass

