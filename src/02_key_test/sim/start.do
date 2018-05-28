#############Create work library#############
vlib work

#############Compile sources#############
vlog "key_test_tb.v"
vlog "../key_test.v"

vsim -voptargs=+acc work.key_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal key_test_tb/dut/*
run 100000 ms