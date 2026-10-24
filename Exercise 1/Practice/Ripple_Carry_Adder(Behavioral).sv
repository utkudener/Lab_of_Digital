module ripple_carry_adder_behavioral
(
 input logic [3:0] A,
 input logic [3:0] B,
 input logic CIN,

 output logic [3:0] SUM,
 output logic COUT
);

logic [4:0]INT;
genvar i;

assign INT[0] = CIN;

generate 
 for(i=0; i<4; i++)
  begin 
   assign SUM[i] = A[i]^B[i]^INT[i]; 
   assign INT[i+1] = (A[i]&B[i])|(INT[i]&(A[i]^B[i]));
  end
endgenerate

assign COUT = INT[4];

endmodule 