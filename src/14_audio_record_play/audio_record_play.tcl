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
# File: D:\intel_project\AX301\demo\14_audio_record_play\audio_record_play.tcl
# Generated on: Tue Mar 20 15:16:46 2018

package require ::quartus::project

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to rst_n
set_location_assignment PIN_F15 -to sdram_addr[12]
set_location_assignment PIN_D16 -to sdram_addr[11]
set_location_assignment PIN_F14 -to sdram_addr[10]
set_location_assignment PIN_D15 -to sdram_addr[9]
set_location_assignment PIN_C16 -to sdram_addr[8]
set_location_assignment PIN_C15 -to sdram_addr[7]
set_location_assignment PIN_B16 -to sdram_addr[6]
set_location_assignment PIN_A15 -to sdram_addr[5]
set_location_assignment PIN_A14 -to sdram_addr[4]
set_location_assignment PIN_C14 -to sdram_addr[3]
set_location_assignment PIN_D14 -to sdram_addr[2]
set_location_assignment PIN_E11 -to sdram_addr[1]
set_location_assignment PIN_F11 -to sdram_addr[0]
set_location_assignment PIN_F13 -to sdram_ba[1]
set_location_assignment PIN_G11 -to sdram_ba[0]
set_location_assignment PIN_J12 -to sdram_cas_n
set_location_assignment PIN_F16 -to sdram_cke
set_location_assignment PIN_B14 -to sdram_clk
set_location_assignment PIN_K10 -to sdram_cs_n
set_location_assignment PIN_L15 -to sdram_dq[15]
set_location_assignment PIN_L16 -to sdram_dq[14]
set_location_assignment PIN_K15 -to sdram_dq[13]
set_location_assignment PIN_K16 -to sdram_dq[12]
set_location_assignment PIN_J15 -to sdram_dq[11]
set_location_assignment PIN_J16 -to sdram_dq[10]
set_location_assignment PIN_J11 -to sdram_dq[9]
set_location_assignment PIN_G16 -to sdram_dq[8]
set_location_assignment PIN_K12 -to sdram_dq[7]
set_location_assignment PIN_L11 -to sdram_dq[6]
set_location_assignment PIN_L14 -to sdram_dq[5]
set_location_assignment PIN_L13 -to sdram_dq[4]
set_location_assignment PIN_L12 -to sdram_dq[3]
set_location_assignment PIN_N14 -to sdram_dq[2]
set_location_assignment PIN_M12 -to sdram_dq[1]
set_location_assignment PIN_P14 -to sdram_dq[0]
set_location_assignment PIN_G15 -to sdram_dqm[1]
set_location_assignment PIN_J14 -to sdram_dqm[0]
set_location_assignment PIN_K11 -to sdram_ras_n
set_location_assignment PIN_J13 -to sdram_we_n
set_location_assignment PIN_N13 -to rst_n
set_location_assignment PIN_E1 -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_addr[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ba[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ba[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cas_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cke
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dq[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dqm[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_dqm[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_ras_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to sdram_we_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk
set_location_assignment PIN_B4 -to wm8731_adcdat
set_location_assignment PIN_A2 -to wm8731_bclk
set_location_assignment PIN_B3 -to wm8731_dacdat
set_location_assignment PIN_A3 -to wm8731_daclrc
set_location_assignment PIN_B1 -to wm8731_scl
set_location_assignment PIN_C2 -to wm8731_sda
set_location_assignment PIN_B5 -to wm8731_adclrc
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_adcdat
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_adclrc
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_bclk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_dacdat
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_daclrc
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_scl
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to wm8731_sda
set_location_assignment PIN_M15 -to key
