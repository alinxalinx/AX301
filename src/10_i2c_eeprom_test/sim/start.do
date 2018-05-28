if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog "*.v"
vlog -vlog01compat -work work +incdir+../src/i2c_master {../src/i2c_master/*.v}
vlog -vlog01compat -work work +incdir+../src {../src/*.v}


vsim -t 1ps -L rtl_work -L work -voptargs="+acc"  i2c_eeprom_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal i2c_eeprom_test_tb/dut/*
run 10000 ms
