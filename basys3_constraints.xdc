## השעון הראשי של המערכת (100MHz) - מחובר לפין W5
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## לחצנים (Buttons)
# לחצן מרכזי (U18) משמש כ-Reset
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
# לחצן עליון (T18) משמש ככניסת רכב
set_property PACKAGE_PIN T18 [get_ports car_enter]					
	set_property IOSTANDARD LVCMOS33 [get_ports car_enter]
# לחצן תחתון (U17) משמש כיציאת רכב
set_property PACKAGE_PIN U17 [get_ports car_exit]					
	set_property IOSTANDARD LVCMOS33 [get_ports car_exit]
 
## לדים (LEDs)
# לד 0 (U16) - לד אדום לחניון מלא
set_property PACKAGE_PIN U16 [get_ports led_full]					
	set_property IOSTANDARD LVCMOS33 [get_ports led_full]
# לד 15 (L1) - לד ירוק לחניון פנוי
set_property PACKAGE_PIN L1 [get_ports led_ready]					
	set_property IOSTANDARD LVCMOS33 [get_ports led_ready]
 
## תצוגת 7 סגמנטים (קתודות - seg)
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

## אנודות (בחירת ספרה - anode)
set_property PACKAGE_PIN U2 [get_ports {anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]