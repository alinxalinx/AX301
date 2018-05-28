#############Create work library#############
vlib work

#############Compile sources#############
vlog "seg_test_tb.v"
vlog "../src/*.v"

vsim -voptargs=+acc work.seg_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal seg_test_tb/dut/*
add wave -radix hexadecimal seg_test_tb/dut/seg_scan_m0/*
run 10000 ms