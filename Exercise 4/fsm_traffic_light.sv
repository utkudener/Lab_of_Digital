module traffic_light(
    input logic clk,
    input logic rstn,
    output logic red,
    output logic yellow,
    output logic green);


enum logic [1:0] {S0,S1,S2,S3} state, next_state;
logic [7:0] cnt = 0;

always_ff@(posedge clk)
begin
    if(!rstn)
    begin
        state <= S0;
        cnt <= 0;
    end
    else begin
        state <= next_state;
        if(state != next_state)
            cnt<=0;
        else 
            cnt <= cnt + 1;
    end
end

always_comb
begin
next_state = state;
red=0;yellow=0;green=0;
case(state)
    S0:begin
        red = 1;
        if(cnt==99)
            next_state = S1;
        
    end
    S1:begin
        yellow = 1;
        if(cnt==9)
            next_state = S2;
    end
    S2:begin 
        green = 1;
        if(cnt==199)
            next_state = S3;
    end
    S3:begin
        yellow = 1;
        if(cnt==9)
            next_state = S0;
    end
    default:begin
    red=0;yellow=0;green=0;
    end

endcase 
end

endmodule

