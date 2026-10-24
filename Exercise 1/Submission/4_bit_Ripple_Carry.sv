module ripple_carry_4bit
(
 input logic [3:0] A,B,
 input logic CIN,

 output logic [3:0] SUM,
 output logic COUT 

);

 logic [4:0] INT;
 genvar i;

 assign INT[0] = CIN;
 
 generate 
  for(i=0;i<4;i++)
   begin 
    full_adder_beh fab_0_i (.A(A[i]), .B(B[i]), .CIN(INT[i]), .SUM(SUM[i]), .COUT(INT[i+1]));    
   end 
 endgenerate
 assign COUT = INT[4];
endmodule

