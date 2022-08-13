import my_pkg::*;
class functional_coverage;	
virtual ALU_if m_ALU_if;
	virtual clk_if m_clk_if;
	event ok;
	real curr_func_cov;

covergroup functional_cov ;
		//option.at_least = 16;
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
		third_input_2: coverpoint m_ALU_if.ALU_sel { bins instructions[16] = {[0:15]} ;
                 }
    //cross first_input_2, second_input_2;
		cross third_input_2, first_input_2,second_input_2;
		//cross third_input_2, second_input_2;
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



