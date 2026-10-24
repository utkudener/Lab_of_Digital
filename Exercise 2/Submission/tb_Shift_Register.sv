`timescale 1ns/1ps

module tb_shift_register;
 logic rstn, clk;
 logic [1:0] ctrl;
 logic [7:0] par_input;
 logic ser_input;
 logic [7:0] par_output;
 logic ser_output;
 
 shift_register DUT(.rstn(rstn), 
	.clk(clk), 
	.ctrl(ctrl), 
	.par_input(par_input), 
	.ser_input(ser_input),
	.par_output(par_output),
    	.ser_output(ser_output));

 always
  begin 
   #5 clk=~clk;
  end
 

 initial 
  begin 
   clk = 0;
   rstn = 0;
   #10;
   rstn = 1;
   ctrl = 2'b00;
   par_input = 8'b01010101;
   ser_input = 1;	
   @(negedge clk);

   rstn = 1;
   ctrl = 2'b01;
   par_input = 8'b01010101;
   ser_input = 1;	
   repeat (4) @(negedge clk);

   rstn = 1;
   ctrl = 2'b10;
   par_input = 8'b01010101;
   ser_input = 1;	
   repeat (4) @(negedge clk);

   rstn = 1;
   ctrl = 2'b11;
   par_input = 8'b01010101;
   ser_input = 1;	
   @(negedge clk);

   rstn = 0;
   ctrl = 2'b10;
   par_input = 8'b01010101;
   ser_input = 1;	
   repeat (4) @(negedge clk);

   rstn = 1;
   ctrl = 2'b01;
   par_input = 8'b11111111;
   ser_input = 1;	
   #10;
  $stop;
  end 
endmodule