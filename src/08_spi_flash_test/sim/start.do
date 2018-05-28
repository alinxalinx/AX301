if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog "spi_flash_test_tb.v"
vlog -vlog01compat -work work +incdir+../src {../src/*.v}
vlog -vlog01compat -work work +incdir+M25P16 {M25P16/*.v}


vsim -t 1ps -L rtl_work -L work -voptargs="+acc"  spi_flash_test_tb

# Set the window types
view wave
view structure
view signals
#add wave
add wave -radix hexadecimal spi_flash_test_tb/dut/*
add wave -radix hexadecimal spi_flash_test_tb/dut/spi_flash_top_m0/*
add wave -radix hexadecimal spi_flash_test_tb/dut/spi_flash_top_m0/spi_flash_cmd_m0/*
run 10000 ms
