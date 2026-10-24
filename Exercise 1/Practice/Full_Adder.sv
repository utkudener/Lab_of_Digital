module full_adder
(
input logic A,
input logic B, 
input logic CIN,
output logic SUM,
output logic COUT
);

logic S1, C1, C2;

half_adder ha_0_i(.A(A), .B(CIN), .SUM(S1),.COUT(C1));
half_adder ha_1_i(.A(B), .B(S1), .SUM(SUM), .COUT(C2));

assign COUT = C1^C2;

endmodule
