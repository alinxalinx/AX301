#############Create work library#############
vlib work

#############Compile sources#############
vlog "tb.v"
vlog "../src/*.v"

vsim -voptargs=+acc work.tb

# Set the window types
view wave
view structure
view signals

add wave -radix hexadecimal tb/DUT/*
#add wave -radix hexadecimal tb/DUT/*
run 100ms