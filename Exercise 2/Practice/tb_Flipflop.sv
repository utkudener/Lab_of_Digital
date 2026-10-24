`timescale 1ns/1ps

module tb_Flipflop();

 logic rstn,clk,in,out;

 flip_flop DUT(.clk(clk), .rstn(rstn), .in(in), .out(out));
 
 always
  begin 
   #5 clk=~clk;
  end

 initial 
  begin 
   clk=0;
   rstn = 1;
   in=0;
   #2
   rstn=0;
   @(negedge clk);
   rstn=1;
   in=1;
   @(negedge clk);
   in=0;
   @(negedge clk);
   $stop;
  end 
endmodule