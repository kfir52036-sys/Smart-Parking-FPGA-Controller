module parking_top(
  input wire clk,
  input wire reset,
  input wire car_enter,
  input wire car_exit,
  
  output wire [3:0] anode,
  output wire [6:0] seg,
  output wire led_ready,
  output wire led_full
  );

wire car_enter_clean;
wire car_exit_clean;
wire [3:0] current_car_count;
wire clk_1kHz;

    clk_div clk_div1 (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_1kHz));

    debouncer debouncer_enter (
        .clk(clk_1kHz),
        .reset(reset),
        .btn_in(car_enter),
        .btn_out(car_enter_clean));

    debouncer debouncer_exit (
        .clk(clk_1kHz),
        .reset(reset),
        .btn_in(car_exit),
        .btn_out(car_exit_clean));
        
    parking_logic u_parking_logic (
        .clk(clk_1kHz),                         
        .reset(reset),
        .car_enter(car_enter_clean),      
        .car_exit(car_exit_clean),          
        .current_cars(current_car_count),   
        .led_ready(led_ready),              
        .led_full(led_full));

    seven_seg_driver u_seven_seg_driver (
        .display_num(current_car_count),  
        .an(anode),                        
        .seg(seg));
endmodule
