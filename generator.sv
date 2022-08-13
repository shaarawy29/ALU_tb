import my_pkg::*;
typedef class packet;
class generator;
 	real curr_cov;
	event drv_done;
	event cov_done;
	bit done = 0;
	mailbox drv_mbx;
  
	task run();
		fork begin
    	while (done == 0) begin
			packet item = new;
			item.randomize();
      	  $display("T=%0t [Generator]", $time);
        	drv_mbx.put(item);
        	$display("T=%0t [Generator] Wait for driver to be done", $time);     
        	@( drv_done);
				end
      end
		begin
			@(cov_done);
				done = 1;
				$display("from the generator the cov_done is done");
		end
		join_any
	endtask
endclass
