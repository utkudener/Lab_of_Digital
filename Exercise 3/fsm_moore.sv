module fsm_moore(
    input logic rst,
    input logic clk, 
    input logic a,
    input logic b,
    output logic Z,
    output logic Y);

enum logic [1:0] {S0, S1, S2} state,next_state;

always_ff@(posedge clk)
begin 
    if(rst)
        state <= S0;
    else 
        state <= next_state;
end

always_comb
begin
Y=0;Z=0;
case(state)
    S0:if(a)
        next_state = S1;
    else
        next_state = S0;
    S1: Y=1;
    if(b)
        next_state = S2;
    else
        next_state = S1;
    S2:Z=1;
        next_state = S0;
    default:
        next_state = S0;
endcase
end 
endmodule
