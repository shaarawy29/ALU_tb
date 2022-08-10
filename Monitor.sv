import my_pkg::*;
class monitor;
  virtual ALU_if m_ALU_if;
  virtual clk_if m_clk_if;
  
  mailbox scb_mbx;
  
  task run();
    $display("T=%Ot [Monitor] starting ...", $time);
    
    forever begin
      packet m_pkt = new();
      @(posedge m_clk_if.clk);
      #3;
      m_pkt.A = m_ALU_if.A;
      m_pkt.B = m_ALU_if.B;
      m_pkt.ALU_sel = m_ALU_if.ALU_sel;
      m_pkt.ALU_out = m_ALU_if.ALU_out;
      m_pkt.Carry_out = m_ALU_if.Carry_out;
      m_pkt.print("Monitor");
      scb_mbx.put(m_pkt);
    end
  endtask
endclass
