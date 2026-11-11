module shift_register
 (
  input  logic       clk,
  input  logic       rstn,
  input  logic [1:0] ctrl,
  input  logic [7:0] par_in,
  input  logic       ser_in,

  output logic [7:0] par_out,
  output logic       ser_out
 );

  always_ff @(posedge clk, negedge rstn)
  begin
    if (rstn == 1'b0)
      par_out <= 0;
    else
    begin
      case (ctrl)
        0: par_out <= par_out;
        1: par_out <= {ser_in, par_out[7:1]};   // shift right
        2: par_out <= {par_out[6:0], ser_in};    // shift left
        3: par_out <= par_in;                    // update
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