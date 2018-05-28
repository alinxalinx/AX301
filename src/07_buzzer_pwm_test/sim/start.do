#############Create work library#############
vlib work

#############Compile sources#############
vlog "buzzer_pwm_test_tb.v"
vlog "../src/*.v"

vsim -voptargs=+acc work.buzzer_pwm_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal buzzer_pwm_test_tb/dut/*
run 10000 ms