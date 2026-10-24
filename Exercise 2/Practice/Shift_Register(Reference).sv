module shift_register
 (
 input logic clk, // clock
 input logic rstn, // reset
 input logic [1:0] ctrl, // control
 input logic [7:0] par_in, // parallel input
 input logic ser_in, // serial input

 output logic [7:0] par_out,// parallel output
 output logic ser_out // serial output
 );
always_ff @(posedge clk, negedge rstn)
begin
if (rstn == 1'b0)
par_out <= 0;
else
begin
case (ctrl)
0: par_out <= par_out;
1: par_out <= {ser_in,par_out[7:1]};
2: par_out <= {par_out[6:0],ser_in};
3: par_out <= par_in;
default: par_out <= 0;
endcase
end
end
always_comb
begin
case (ctrl)
0: ser_out = 1'b0;
1: ser_out = par_out[0];
2: ser_out = par_out[7];
3: ser_out = 1'b0;
default: ser_out = 1'b0;
endcase
end
endmodule
