module half_adder
(
 input logic A,
 input logic B,

 output logic SUM,
 output logic COUT
);

assign SUM = A^B;
assign COUT = A&B;

endmodule