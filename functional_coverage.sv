import my_pkg::*;
class functional_coverage;	
virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	event ok;
	real curr_func_cov;

covergroup functional_cov;
							//option.per_instance = 1;
		third_input_2: coverpoint m_ALU_if.ALU_sel { 
									option.at_least = 4;
									//option.per_instance = 1;
									bins instructions[16] = {[0:15]} ;
                 }
		transition: coverpoint m_ALU_if.ALU_sel {
									option.at_least = 1;
									//option.per_instance = 1;
									bins t = (4'h0 => 4'h1 => 4'h2);
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



