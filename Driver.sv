//module driver;
import my_pkg::*;
typedef class packet;
  class driver;
    virtual ALU_if m_ALU_if;
    virtual clk_id m_clk_if;
    event dr_done;
    mailbox drv_mbx;
    
    task run();
      $display("T=%0t [Driver] starting .....", $time);
      
      forever begin
        packet item;
        $display("T=%0t [Driver] waiting for item....",$time);
        
        drv_mbx.get(item);
        @(posedge m_clk_if.clk);
        item.print("Drver");
        m_ALU_if.A = item.A;
        m_ALU_if.B = item.B;
        m_ALU_if.ALU_sel = item.ALU_sel;
        m_ALU_if.ALU_out = item.ALU_out;
        m_ALU_if.Carry_out = item.Carry_out;
        ->dr_done;
      end
    endtask
  endclass
//endmodule
