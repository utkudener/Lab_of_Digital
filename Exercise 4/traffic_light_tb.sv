module traffic_light_tb;

logic clk, rstn;
logic red, yellow, green;

// DUT
traffic_light dut (
    .clk(clk),
    .rstn(rstn),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock: 10ns periyot
always #5 clk = ~clk;

initial begin
    clk = 0;
    rstn = 0;           // reset active
    #20;
    rstn = 1;           // reset deactive


    #3200;

    $finish;
end

endmodule