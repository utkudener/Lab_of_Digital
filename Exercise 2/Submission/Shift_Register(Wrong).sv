module shift_register(
 input logic clk, //clock
 input logic rstn, //reset 
 input logic [1:0] ctrl,
 input logic [7:0] par_input, 
 input logic ser_input,
 
 output logic [7:0] par_output, 
 output logic ser_output); 

 always_ff@(posedge clk, negedge rstn)
  begin 
   if(rstn == 1'b0)
    begin
     par_output <= 8'b00000000;
     ser_output <= 1'b0;
    end
   else
    begin
    case(ctrl)
     2'b00: begin par_output <= par_output;//No shift
	    ser_output <= ser_output;
	    end
     2'b01: begin ser_output <= par_output[7]; //Shift left
	    par_output[7:0] <= {par_output[6:0],ser_input};
	    end
     2'b10: begin ser_output <= par_output[0]; //Shift right
	    par_output[7:0] <= {ser_input ,par_output[7:1]};
	    end
     2'b11: begin par_output <= par_input;//Update
	    ser_output <= ser_output;
 	    end
    endcase
    end
  end
endmodule