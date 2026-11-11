module fsm_vending(
    input logic clk,
    input logic rstn,
    input logic dime,
    input logic nickel, 
    output logic out);

enum logic [1:0] {S0,S5,S10,S15} state, next_state;

always_ff@(posedge clk)
begin
    if(!rstn)
        state <= S0;
    else 
        state <= next_state ;
end

always_comb
begin 
out = 0;
case(state)
    S0:begin 
        if(nickel)
            next_state=S5;
        else if(dime)
            next_state=S10;
        else 
            next_state=S0;
    end
    S5:begin
        if(nickel)
            next_state=S10;
        else if(dime)
            next_state=S15;
        else 
            next_state=S5;
    end  
    S10:begin
        if(nickel)
            next_state=S15;
        else if(dime)
            next_state=S15;
        else
            next_state=S10;
    end
    S15:begin
        out=1;
        next_state = S0; 
    end
    default: next_state = S0;
endcase
end
endmodule 