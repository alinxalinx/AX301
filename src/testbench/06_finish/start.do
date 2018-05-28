#############Create work library#############
vlib work

#############Compile sources#############
vlog "led_test_tb.v"
vlog "led_test.v"

vsim -voptargs=+acc work.led_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal led_test_tb/dut/*
run 200 ns