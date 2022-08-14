import my_pkg::*;
class functional_coverage;	
virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	event ok;
	real curr_func_cov;

covergroup functional_cov;
		option.at_least = 4;
		option.per_instance = 1;
		third_input_2: coverpoint m_ALU_if.ALU_sel { bins instructions[16] = {[0:15]} ;
                 }
endgroup

 function new();
			functional_cov = new;
 endfunction

task run();
forever begin
@(ok)
functional_cov.sample();
curr_func_cov = functional_cov.get_inst_coverage();
$display("this coverage related to scoreboard = ", curr_func_cov );
end
endtask
endclass



