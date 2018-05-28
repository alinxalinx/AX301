#############Create work library#############
vlib work

#############Compile sources#############
vlog "key_debounce_tb.v"
vlog "../src/*.v"

vsim -voptargs=+acc work.key_debounce_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal key_debounce_tb/dut/*
add wave -radix hexadecimal key_debounce_tb/dut/ax_debounce_m0/*
run 10000 ms