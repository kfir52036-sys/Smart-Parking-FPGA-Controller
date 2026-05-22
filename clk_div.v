module clk_div(clk,reset,clk_out);
  input wire clk;
  input wire reset;
  output reg clk_out;
  
  reg [15:0] cnt ;
  
  always @(posedge clk or posedge reset)
  begin
    if (reset) 
    begin
      cnt <= 0;
      clk_out <= 0;
    end
    else
    begin
      if (cnt==49999)
      begin
        clk_out <= ~ clk_out;
        cnt <= 0;
      end
      else
      begin
        cnt = cnt + 1;
      end
    end
  end
endmodule
