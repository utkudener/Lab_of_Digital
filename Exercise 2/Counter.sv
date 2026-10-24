module counter(
 input logic clk,
 input logic rstn, 
 input logic [1:0] ctrl,
 output logic [2:0] out);

 always_ff@(posedge clk, negedge rstn)
  begin 
   if(rstn == 1'b0)
    out <=1'b0;
   else 
    begin 
     case(ctrl)
      2'b00: out<=out;
      2'b01: out<=out + 1;
      2'b10: out<=out - 1;
      2'b01: out<=out ;
     endcase
    end
 end
endmodule 