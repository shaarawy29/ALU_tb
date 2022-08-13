import my_pkg::*;
class coverage_sub;
  virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	real curr_cov =10;
  event trigger;
	//event ok;
	event cov_done;
	//real curr_func_cov;

  covergroup cg_sub @(trigger);
		//option.per_instance = 1;
    first_input_sub: coverpoint m_ALU_if.A {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    second_input_sub: coverpoint m_ALU_if.B {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
		//third_input: coverpoint m_ALU_if.ALU_sel { bins instructions[16] = { [0:15] };
      //           }
    cross first_input_sub, second_input_sub;
		//cross third_input, first_input,second_input;
		//cross third_input, second_input;
endgroup

	/*covergroup functional_cov @(ok);
		first_input_2: coverpoint m_ALU_if.A {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    second_input_2: coverpoint m_ALU_if.B {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    cross first_input_2, second_input_2;
endgroup*/

	task run();
		forever begin
    @(posedge m_clk_if.clk);
		if(m_ALU_if.ALU_sel == 4'h1) begin
      ->trigger;
      curr_cov = cg_sub.get_inst_coverage(); 
			//curr_func_cov = functional_cov.get_inst_coverage();
      $display("current_covergae =", curr_cov);
			//$display("this coverage related to scoreboard = ", curr_func_cov );
			if(this.curr_cov > 99.5) begin
				$display("from the coverage i'm done hhhhhh");
				-> cov_done;
			end
			end
     end
	endtask
    
    function new();
    	cg_sub = new;
			//functional_cov = new;
    endfunction
//reference book was written in the form of input and not an interface 
//check this if any error happend later 
  

  
endclass

