import my_pkg::*;
//typedef class functional_coverage;
class scoreboard;
  mailbox scb_mbx;
  event ok;
  //functional_coverage f;
  task run();
    forever begin
      packet item, ref_item;
      scb_mbx.get(item);
      item.print("Scoreboard");
      
      ref_item = new();
      ref_item.copy(item);
      
      begin
        case(ref_item.ALU_sel)
       	 4'b0000: // Addition
	     	{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A + ref_item.B ; 
         4'b0001: // subtraction
		{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A - ref_item.B ; 
	 4'b0010: // multiplication
		{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A * ref_item.B ;
	 4'b0011: // division
		{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A / ref_item.B ;
	 4'b0100: // logical shift left
		{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A << ref_item.B ; 
	 4'b0101: // logical shift right
		{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A >> ref_item.B ; 
	 4'b0110: // rotate left
		{ref_item.Carry_out,ref_item.ALU_out} = {ref_item.A[6:0],ref_item.A[7]} ; 
	 4'b0111: // rotate right
		{ref_item.Carry_out,ref_item.ALU_out} = {ref_item.A[0],ref_item.A[7:1]};
         4'b1000: //logical and
          	{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A & ref_item.B;
         4'b1001://Logical or
          	{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A | ref_item.B;
         4'b1010://Logical Xor
          	{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A ^ ref_item.B;
         4'b1011://Logical nor
          	{ref_item.Carry_out,ref_item.ALU_out} = ~(ref_item.A | ref_item.B);
         4'b1100:// Logical nand
          	{ref_item.Carry_out,ref_item.ALU_out} = ~(ref_item.A & ref_item.B);
         4'b1101: // Logical xnor
          	{ref_item.Carry_out,ref_item.ALU_out} = ~(ref_item.A ^ ref_item.B);
         4'b1110: // Greater comparison
          	{ref_item.Carry_out,ref_item.ALU_out} = (ref_item.A > ref_item.B)?8'd1:8'd0;
         4'b1111: // Equal comparison 
          	{ref_item.Carry_out,ref_item.ALU_out} = (ref_item.A == ref_item.B)?8'd1:8'd0; 
        default:{ref_item.Carry_out,ref_item.ALU_out} = ref_item.A & ref_item.B; 
       endcase
      
				
       if(ref_item.ALU_out == item.ALU_out)
	         begin
        	$display("[%t0] scoreboard pass! output match ref_item=0x%0h item=0x%0h",$time,ref_item.ALU_out,item.ALU_out);
		   if((ref_item.ALU_sel == 4'b0000)/*for addition*/ || (ref_item.ALU_sel == 4'b0010)/*for multiplication*/)
	      	begin
			   if(ref_item.Carry_out == item.Carry_out)
			      begin
        			$display("[%t0] scoreboard pass! Carry match ref_item=0x%0h item=0x%0h",$time,ref_item.Carry_out,item.Carry_out);
				$display("Right Instruction!");
       			end
        		else begin
         			$display("[%t0] scoreboard Error! Carry mismatch ref_item=0x%0h item=0x%0h",$time,ref_item.Carry_out,item.Carry_out);
				$display("Wrong Instruction!");
        		end  
		end
		else begin
			$display("Right Instruction!");
		end
        end
        else begin
         	$display("[%t0] scoreboard Error! output mismatch ref_item=0x%0h item=0x%0h",$time,ref_item.ALU_out,item.ALU_out);
		$display("Wrong Instruction!");
        end
       
 if((ref_item.ALU_out == item.ALU_out) && (ref_item.Carry_out == item.Carry_out) && (item.ALU_sel == 4'h0))begin
          $display("if condition of addition");
					->ok;
					end
				if((ref_item.ALU_out == item.ALU_out) && (item.ALU_sel != 4'h0))begin
          $display("if condition of the other 15 instruction");
					->ok;
				end
       end
    end
  endtask   
endclass

                     
        
