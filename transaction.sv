//module transaction;
  class packet;
    rand bit[7:0] A;
    rand bit[7:0] B;
    rand bit[3:0] ALU_sel;
    bit[7:0] ALU_out;
    bit Carry_out;
    
    function void print(string tag="");
      $display("T=%0t %s A=0x%0h B=0x%0h ALU_sel=0x%h ALU_out=0x%0h Carry_out=0x%0h", $time, tag, A, B, ALU_sel, ALU_out, Carry_out);
    endfunction
    
    function void copy(packet temp);
      this.A = temp.A;
      this.B = temp.B;
      this.ALU_sel = temp.ALU_sel;
      this.Carry_out = temp.Carry_out;
      this.ALU_out = temp.ALU_out;
    endfunction
  endclass
//endmodule
