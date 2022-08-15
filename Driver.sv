import my_pkg::*;
typedef class packet;
  class driver;
    virtual ALU_if m_ALU_if;
    virtual clk_if m_clk_if;
    event drv_done;
    mailbox drv_mbx;
    
    task run();
      $display("T=%0t [Driver] starting .....", $time);
      
      for(int i =  0; i < 4; i++) begin
        packet item;
        $display("T=%0t [Driver] waiting for item....",$time);
        
        drv_mbx.get(item);
        @(posedge m_clk_if.clk);
        item.print("Drver");
        m_ALU_if.A = item.A;
        m_ALU_if.B = item.B;
        //m_ALU_if.ALU_sel = item.ALU_sel;
        ->drv_done;
      end
    endtask
  endclass
