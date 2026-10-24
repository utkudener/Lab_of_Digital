module ripple_carry_adder
(
 input logic[3:0]A,
 input logic[3:0]B,
 input logic CIN,

 output logic[3:0] SUM,
 output logic COUT

);

 logic[2:0] INT;

 full_adder fa_0_i (.A(A[0]), .B(B[0]), .CIN(CIN), .SUM(SUM[0]), .COUT(INT[0]));
 full_adder fa_1_i (.A(A[1]), .B(B[1]), .CIN(INT[0]), .SUM(SUM[1]), .COUT(INT[1]));
 full_adder fa_2_i (.A(A[2]), .B(B[2]), .CIN(INT[1]), .SUM(SUM[2]), .COUT(INT[2]));
 full_adder fa_3_i (.A(A[3]), .B(B[3]), .CIN(INT[2]), .SUM(SUM[3]), .COUT(COUT));

endmodule
