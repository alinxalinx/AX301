#############Create work library#############
vlib work

#############Compile sources#############
vlog "shift_tb.v"
vlog "shiftreg.v"
vlog "220model.v"

vsim -voptargs=+acc work.shift_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal shift_tb/s0/*
run 100 ms