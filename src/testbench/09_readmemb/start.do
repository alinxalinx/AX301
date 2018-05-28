#############Create work library#############
vlib work

#############Compile sources#############
vlog "readmem.v"

vsim -voptargs=+acc work.readmem

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal readmem/*
run 1 ms