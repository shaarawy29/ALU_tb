import my_pkg::*;
typedef class packet;
class generator;
 	int coverage = 10;
	event drv_done;
	mailbox drv_mbx;
  
	task run();
    while (coverage < 100) begin
		packet item = new;
		item.randomize();
        $display("T=%0t [Generator]", $time);
        drv_mbx.put(item);
        $display("T=%0t [Generator] Wait for driver to be done", $time);     
        @( drv_done) ;
      end
	endtask
endclass
