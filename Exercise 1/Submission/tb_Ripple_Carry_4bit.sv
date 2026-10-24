`timescale 1ns/1ps
module tb_Ripple_Carry_4bit();
 logic [3:0] A;
 logic [3:0] B;
 logic [3:0] SUM;
 logic CIN, COUT;
 ripple_carry_4bit DUT(.A(A), .B(B), .CIN(CIN), .SUM(SUM), .COUT(COUT));
 initial 
  begin 
   A = 0;
   B = 0;
   CIN = 0;
   #2;
   A = 5;
   B = 2;
   CIN = 1;
   #2;
   A = 4;
   B = 3;
   CIN = 0;
   #2;
   A = 15;
   B = 1;
   CIN = 0;
   #2;
   $stop;
 end
endmodule
