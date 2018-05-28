# Copyright (C) 2017  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition
# File: D:\intel_project\AX301\demo\12_3_an070_lcd_test\lcd070_test.tcl
# Generated on: Tue Mar 20 16:07:34 2018

package require ::quartus::project

set_location_assignment PIN_E1 -to clk
set_location_assignment PIN_B9 -to lcd_b[0]
set_location_assignment PIN_A8 -to lcd_b[1]
set_location_assignment PIN_B8 -to lcd_b[2]
set_location_assignment PIN_A7 -to lcd_b[3]
set_location_assignment PIN_B7 -to lcd_b[4]
set_location_assignment PIN_A6 -to lcd_b[5]
set_location_assignment PIN_B6 -to lcd_b[6]
set_location_assignment PIN_A5 -to lcd_b[7]
set_location_assignment PIN_B5 -to lcd_dclk
set_location_assignment PIN_A4 -to lcd_de
set_location_assignment PIN_B13 -to lcd_g[0]
set_location_assignment PIN_A12 -to lcd_g[1]
set_location_assignment PIN_B12 -to lcd_g[2]
set_location_assignment PIN_A11 -to lcd_g[3]
set_location_assignment PIN_B11 -to lcd_g[4]
set_location_assignment PIN_A10 -to lcd_g[5]
set_location_assignment PIN_B10 -to lcd_g[6]
set_location_assignment PIN_A9 -to lcd_g[7]
set_location_assignment PIN_B4 -to lcd_hs
set_location_assignment PIN_D8 -to lcd_r[0]
set_location_assignment PIN_C8 -to lcd_r[1]
set_location_assignment PIN_F8 -to lcd_r[2]
set_location_assignment PIN_E7 -to lcd_r[3]
set_location_assignment PIN_C6 -to lcd_r[4]
set_location_assignment PIN_D6 -to lcd_r[5]
set_location_assignment PIN_D5 -to lcd_r[6]
set_location_assignment PIN_A13 -to lcd_r[7]
set_location_assignment PIN_A3 -to lcd_vs
set_location_assignment PIN_N13 -to rst_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_b[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_dclk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_de
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_g[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_hs
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_r[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to lcd_vs
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to rst_n
set_location_assignment PIN_C2 -to lcd_pwm
