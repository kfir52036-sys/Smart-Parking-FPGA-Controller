module parking_logic(
    input wire clk,              
    input wire reset,
    input wire car_enter,        
    input wire car_exit,         
    
    output reg [3:0] current_cars, 
    output reg led_ready,        
    output reg led_full          
);

  localparam STATE_EMPTY = 2'b00;
  localparam STATE_AVAILABLE = 2'b01;
  localparam STATE_FULL = 2'b10;
  
  reg [1:0] current_state;
  
  always @(posedge clk or posedge reset)
  begin
    if (reset)
    begin
      current_state <= STATE_EMPTY;
      current_cars <= 0;
    end
    
    else
    begin
      case (current_state)
        STATE_EMPTY:
        begin
          if(car_enter)
          begin
            current_cars <= 1;
            current_state <= STATE_AVAILABLE;
          end
          else
          current_state <= STATE_EMPTY;
        end
        
        STATE_AVAILABLE:
        begin
        if (car_enter==1)
        begin
          current_cars <= current_cars + 1;
          if(current_cars==8)
          begin
             current_state <= STATE_FULL;
          end
          else
          begin
             current_state <= STATE_AVAILABLE;
          end
        end
        else if (car_exit)
        begin
          current_cars <= current_cars - 1;
          if(current_cars==1)
          begin
             current_state <= STATE_EMPTY;
          end
          else
          begin
             current_state <= STATE_AVAILABLE;
          end 
        end        
        end
        
        STATE_FULL:
        begin
          if (car_exit)
          begin
            current_cars <= 8;
            current_state <= STATE_AVAILABLE;
          end
            
          else
          begin
            current_state <= STATE_FULL;
          end

        end
      endcase
    end
    
  end
  
  always @(*)
  begin
    case(current_state)
    STATE_EMPTY:
    begin
      led_ready <= 1;
      led_full <= 0;
    end
    STATE_AVAILABLE:
    begin
      led_ready <= 1;
      led_full <=  0;  
    end
    STATE_FULL:
    begin
      led_ready <= 0;
      led_full <=  1;
    end
    default:
    begin
      led_ready <= 0;
      led_full <=  0;
    end
    endcase
  end
endmodule
