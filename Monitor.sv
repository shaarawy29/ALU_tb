class monitor;
  virtual adder_if m_adder_vif;
  virtual clk_if m_clk_vif;
  
  mailbox scb_mbx;
  
  task run();
    $display("T=%Ot [Monitor] starting ...", $time);
    
    forever begin
      packet m_pkt = new();
      @(posedge m_clk_vif.tb_clk);
      #1;
      m_pkt.A = m_adder_vif.A;
      m_pkt.B = m_adder_vif.B;
      m_pkt.rstn = m_adder_vif.rstn;
      m_pkt.ALU_sel = m_adder_vif.ALU_sel;
      m_pkt.ALU_out = m_adder_vif.ALU_out;
      m_pkt.Carry_out = m_adder_vif.Carry_out;
      m_pkt.print("Monitor");
      scb_mbx.put(m_pkt);
    end
  endtask
endclass
