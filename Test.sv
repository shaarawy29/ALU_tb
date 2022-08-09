import my_pkg::*;
typedef class env;

class test;
  env e0;
  mailbox drv_mbx;
  
  function new();
    drv_mbx = new();
    e0 = new();
  endfunction
  
  virtual task run();
    e0.d.drv_mbx = drv_mbx;
    e0.run();
  endtask
endclass
