## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {catod[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[0]}]
set_property PACKAGE_PIN W6 [get_ports {catod[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[1]}]
set_property PACKAGE_PIN U8 [get_ports {catod[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[2]}]
set_property PACKAGE_PIN V8 [get_ports {catod[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[3]}]
set_property PACKAGE_PIN U5 [get_ports {catod[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[4]}]
set_property PACKAGE_PIN V5 [get_ports {catod[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[5]}]
set_property PACKAGE_PIN U7 [get_ports {catod[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {catod[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
#	set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {anod[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[0]}]
set_property PACKAGE_PIN U4 [get_ports {anod[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[1]}]
set_property PACKAGE_PIN V4 [get_ports {anod[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[2]}]
set_property PACKAGE_PIN W4 [get_ports {anod[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anod[3]}]
	
set_property PACKAGE_PIN W19 [get_ports semnal_minute_in]						
	set_property IOSTANDARD LVCMOS33 [get_ports semnal_minute_in]
set_property PACKAGE_PIN U17 [get_ports start_stop_in]						
	set_property IOSTANDARD LVCMOS33 [get_ports start_stop_in]
set_property PACKAGE_PIN T17 [get_ports semnal_secunde_in]						
	set_property IOSTANDARD LVCMOS33 [get_ports semnal_secunde_in]	

	
## LEDs
set_property PACKAGE_PIN U16 [get_ports {detect_alarm}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {detect_alarm}]