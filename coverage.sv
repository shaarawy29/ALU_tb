import my_pkg::*;
class coverage;
  covergroup cg(ref bit[7:0]A, B, logic clk) @(posedge clk);
    first_input: coverpoint A {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    second_input: coverpoint B {bins lower = {[0:63]};
                  bins lower_middle = { [64:127] };
                  bins upper_middle = { [128:191] };
                  bins upper = { [192:255] };
                 }
    cross first_input, second_input;
    
  endgroup
endclass
