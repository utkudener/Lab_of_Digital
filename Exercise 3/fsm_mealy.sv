module fsm_mealy(
    input logic clk,
    input logic reset, 
    input logic a, 
    input logic b, 
    output logic Y,
    output logic Z);

enum logic [1:0] {S0,S1,S2} state, next_state;

always_ff@(posedge clk)
begin 
if(reset)
    state <= S0;
else 
    state <= next_state;
end

always_comb 
begin
Y=0;Z=0;
case(state)
    S0: if(a)
        begin 
            next_state = S1;
            Z=1;
        end
    else
        next_state = S0;
    S1: begin 
        Y=1;
        if(b)
            begin 
                next_state=S2;
                Z=1;
            end
        else
            next_state=S1;
    end
    S2: next_state = S0;
    
    default: begin 
        next_state = S0;
        Y=1'b1;
        Z=1'b1;
    end
endcase
end
endmodule