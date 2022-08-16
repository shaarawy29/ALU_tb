import my_pkg::*;
class functional_coverage;	
virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	event ok;

covergroup functional_cov;
		third_input_2: coverpoint m_ALU_if.ALU_sel { 
									option.at_least = 4;
									option.weight = 16;
									bins instructions[16] = {[0:15]} ;
                 }
		transition: coverpoint m_ALU_if.ALU_sel {
									option.weight = 1;
									bins t = (4'h0 => 4'h1 => 4'h2);
		}
endgroup

 function new();
			functional_cov = new;
 endfunction

task run();
for(int i = 0; i < 4; i++) begin
@(ok)
functional_cov.sample();
end
endtask
endclass



