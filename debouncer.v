module debouncer(clk,reset,btn_in,btn_out);
  
  input wire clk;
  input wire reset;
  input wire btn_in;
  output wire btn_out;

  reg ff1,ff2,ff3;
  
  always @ (posedge clk or posedge reset)
  begin
    if (reset)
    begin
      ff1 <= 0;
      ff2 <= 0;
      ff3 <= 0;
    end
    else
    begin
      ff1 <= btn_in;
      ff2 <= ff1;
      ff3 <= ff2;
    end
  end
  
  assign btn_out = ff1 && ff2 && (~ff3);
endmodule
