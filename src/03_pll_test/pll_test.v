//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/

`timescale 1ns / 1ps

module pll_test(
	input   clk,
	input   rst_n,
	output  clkout1,        //pll clock output
	output  clkout2,        //pll clock output
	output  clkout3,        //pll clock output
	output  clkout4         //pll clock output
	);

wire locked;

pll pll_inst
(
	// Clock in ports
	.inclk0(clk),           // IN 50Mhz
	// Clock out ports
	.c0(clkout2),           // OUT 25Mhz
	.c1(clkout1),           // OUT 50Mhz
	.c2(clkout3),           // OUT 75Mhz
	.c3(clkout4),           // OUT 100Mhz
	// Status and control signals
	.areset(~rst_n),        // IN
	.locked(locked)         //The signal of PLL normal operation
	);                      // OUT

endmodule
