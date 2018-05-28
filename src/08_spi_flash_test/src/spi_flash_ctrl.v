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
//  2017/5/3     meisq          1.0         Original
//*******************************************************************************/
`include "spi_flash_defines.v"
module spi_flash_ctrl(
	input             sys_clk,
	input             rst,
	input             flash_read,                     //flash read request
	input             flash_write,                    //flash write request
	input             flash_bulk_erase,               //flash full erase request
	input             flash_sector_erase,             //flash sector erase request
	output            flash_read_ack,                 //flash read request response
	output            flash_write_ack,                //flash write request response
	output            flash_bulk_erase_ack,           //flash full erase request response
	output            flash_sector_erase_ack,         //flash sector erase request response
	input[23:0]       flash_read_addr,                //flash read address
	input[23:0]       flash_write_addr,               //flash write address
	input[23:0]       flash_sector_addr,              //flash sector erase address
	input[7:0]        flash_write_data_in,            //flash write data
	input[8:0]        flash_read_size,                //flash read size
	input[8:0]        flash_write_size,               //flash write size
	output            flash_write_data_req,           //flash write data request,ahead of a clock cycle
	output reg[7:0]   flash_read_data_out,            //flash read data
	output reg        flash_read_data_valid,          //flash read valid
	// to flash cmd
	output reg[7:0]   cmd,                            //flash command
	output reg        cmd_valid,                      //flash command valid
	input             cmd_ack,                        //flash command response
	output reg[23:0]  addr,                           //flash command address
	output[7:0]       data_in,                        //flash command write data
	output reg[8:0]   size,                           //flash command data size
	input             data_req,                       //data request, ahead of a clock cycle
	input[7:0]        data_out,                       //flash command read data
	input             data_valid                      //flash command read data valid
);
//State machine code
localparam S_IDLE       = 0;
localparam S_SE         = 1; //sector erase
localparam S_BE         = 2; //bulk erase
localparam S_READ       = 3; //read
localparam S_WRITE      = 4; //write
localparam S_ACK        = 5;
localparam S_CK_STATE   = 6;
localparam S_WREN       = 7;

reg[4:0] state,next_state;
reg[7:0] state_reg;//Status register
assign data_in = flash_write_data_in;

assign flash_read_ack = (state == S_ACK) && flash_read == 1'b1 ? 1'b1 : 1'b0;
assign flash_write_ack = (state == S_ACK) && flash_write == 1'b1 ? 1'b1 : 1'b0;
assign flash_bulk_erase_ack = (state == S_ACK) && flash_bulk_erase == 1'b1 ? 1'b1 : 1'b0;
assign flash_sector_erase_ack = (state == S_ACK) && flash_sector_erase == 1'b1 ? 1'b1 : 1'b0;
assign flash_write_data_req = data_req;

always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		state <= S_IDLE;
	else
		state <= next_state;
end
//State jump,combinational logic
always@(*)
begin
	case(state)
		S_IDLE:
			if(flash_bulk_erase == 1'b1)
				next_state <= S_WREN;//write enable register is first opened
			else if(flash_sector_erase == 1'b1)
				next_state <= S_WREN;////write  request, write enable register is first opened
			else if(flash_read == 1'b1)
				next_state <= S_READ;
			else if(flash_write == 1'b1)
				next_state <= S_WREN;//write  request,  write enable register is first opened
			else
				next_state <= S_IDLE;
		S_WREN:
			if(cmd_ack == 1'b1 && flash_bulk_erase == 1'b1)
				next_state <= S_BE;
			else if(cmd_ack == 1'b1 && flash_sector_erase == 1'b1)
				next_state <= S_SE;
			else if(cmd_ack == 1'b1 && flash_write == 1'b1)
				next_state <= S_WRITE;
			else
				next_state <= S_WREN;
		S_BE:
			if(cmd_ack == 1'b1)
				next_state <= S_CK_STATE; //check  status register
			else
				next_state <= S_BE;
		S_SE:
			if(cmd_ack == 1'b1)
				next_state <= S_CK_STATE;//check  status register
			else
				next_state <= S_SE;
		S_READ:
			if(cmd_ack == 1'b1)
				next_state <= S_ACK;
			else
				next_state <= S_READ;
		S_WRITE:
			if(cmd_ack == 1'b1)
				next_state <= S_CK_STATE;//check  status register
			else
				next_state <= S_WRITE;
		S_CK_STATE:
			if(cmd_ack == 1'b1  &&  state_reg[0] == 1'b0)//status register, not busy
				next_state <= S_ACK;
			else
				next_state <= S_CK_STATE;
		S_ACK:
			next_state <= S_IDLE;
		default:
			next_state <= S_IDLE;
	endcase
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		cmd <= `CMD_READ;
	else
		case(state)
			S_BE:
				cmd <= `CMD_BE;
			S_SE:
				cmd <= `CMD_SE;
			S_CK_STATE:
				cmd <= `CMD_RDSR;
			S_READ:
				cmd <= `CMD_READ;
			S_WRITE:
				cmd <= `CMD_PP;
			S_WREN:
				cmd <= `CMD_WREN;
			default:
				cmd <= `CMD_READ;
		endcase
end
//Command length
always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		size <= 9'd0;
	else
		case(state)
			S_CK_STATE:
				size <= 9'd1;
			S_READ:
				size <= flash_read_size;
			S_WRITE:
				size <= flash_write_size;
			default:
				size <= 9'd0;
		endcase
end
//address selection
always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		addr <= 1'b0;
	else if(state == S_IDLE && flash_sector_erase == 1'b1)
		addr <= flash_sector_addr;
	else if(state == S_IDLE && flash_read == 1'b1)
		addr <= flash_read_addr;
	else if(state == S_IDLE && flash_write == 1'b1)
		addr <= flash_write_addr;
end
//status register
always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		state_reg <= 8'd0;
	else if(state == S_CK_STATE && data_valid == 1'b1)
		state_reg <= data_out;
	else
		state_reg <= state_reg;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		flash_read_data_out <= 8'd0;
	else if(state == S_READ && data_valid == 1'b1)
		flash_read_data_out <= data_out;
	else
		flash_read_data_out <= data_out;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		flash_read_data_valid <= 1'd0;
	else if(state == S_READ && data_valid == 1'b1)
		flash_read_data_valid <= 1'b1;
	else
		flash_read_data_valid <= 1'b0;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst)
		cmd_valid <= 1'b0;
	else
		case(state)
			S_READ,S_WRITE,S_BE,S_WREN,S_SE:
				if(cmd_ack == 1'b1)
					cmd_valid <= 1'b0;
				else
					cmd_valid <= 1'b1;
			S_CK_STATE:
				if(cmd_ack == 1'b1)
					cmd_valid <= 1'b0;
				else
					cmd_valid <= 1'b1;
			default:
				cmd_valid <= 1'b0;
		endcase
end

endmodule