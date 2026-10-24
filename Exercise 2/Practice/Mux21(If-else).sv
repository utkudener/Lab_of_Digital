module mux21(
  input logic in0,
  input logic in1,
  input logic sel,
  output logic out

);
  always @(in0,in1,sel)
  //always_comb  also possible all inputs are implicitly included in the sensitivity list 
    begin 
    if (sel == 1)
      out=in1;
    else
      out=in0;
    end

endmodule 