#############Create work library#############
vlib work

#############Compile sources#############
vlog "uart_test_tb.v"
vlog "../src/*.v"

vsim -voptargs=+acc work.uart_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal uart_test_tb/*
add wave -radix hexadecimal uart_test_tb/dut/*
add wave -radix hexadecimal uart_test_tb/dut/uart_rx_inst/*
add wave -radix hexadecimal uart_test_tb/dut/uart_tx_inst/*
run 5000 ms