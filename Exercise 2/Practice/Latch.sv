module latch(
  input logic clk, 
  input logic rstn,
  input logic in,
  output logic out);


  always_latch
    begin
    if(rstn==1'b0)
      out <= 1'b0;
    else 
      if(clk == 1'b1)
        out <= in; 

    end
endmodule   