module mux21(
  input logic in0,
  input logic in1,
  input logic sel,
  output logic out);

  always_comb
    begin 
      case(sel)
        0:out = in0;
        1:out = in1;
        default: out = 1'bX;
      endcase
    end
endmodule 
