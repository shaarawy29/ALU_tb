import my_pkg::*;
typedef class packet;
class generator;
	event drv_done;
	mailbox drv_mbx;
  
	task run();
		fork begin
    	for(int i =0; i < 4;i++) begin
					packet item = new;
					if(i == 0) begin
						item.upper.constraint_mode(0);
						item.lower_middle.constraint_mode(0);
						item.upper_middle.constraint_mode(0);
					end
					if(i == 1) begin
						item.lower.constraint_mode(0);
						item.upper.constraint_mode(0);
						item.upper_middle.constraint_mode(0);
					end
					if(i == 2) begin
						item.upper.constraint_mode(0);
						item.lower_middle.constraint_mode(0);
						item.lower.constraint_mode(0);
					end
					if(i == 3) begin
						item.lower.constraint_mode(0);
						item.lower_middle.constraint_mode(0);
						item.upper_middle.constraint_mode(0);
					end
					item.randomize();
      	  $display("T=%0t [Generator]", $time);
        	drv_mbx.put(item);
        	$display("T=%0t [Generator] Wait for driver to be done", $time);     
        	@( drv_done);
				end
      end
		join_any
	endtask
endclass
