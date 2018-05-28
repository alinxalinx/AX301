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
module spi_flash_cmd(
	input            sys_clk,
	input            rst,
	input[7:0]       cmd,                      //flash command
	input            cmd_valid,                //flash command valid
	output           cmd_ack,                  //flash command response
	input[23:0]      addr,                     //flash command address
	input[7:0]       data_in,                  //flash command write data
	input[8:0]       size,                     //flash command data size
	output reg       data_req,                 //data request, ahead of a clock cycle
	output reg[7:0]  data_out,                 //flash command read data
	output reg       data_valid,               //flash command read data valid
	//to spi master
	output reg       CS_reg,
	output reg       wr_req,
	input            wr_ack,
	output reg[7:0]  send_data,
	input[7:0]       data_recv
);
//State machine code
parameter S_IDLE         = 0;
parameter S_CS_LOW       = 1;
parameter S_CS_HIGH      = 2;
parameter S_KEEP_CS_LOW  = 3;
parameter S_READ_BYTES   = 4;
parameter S_WRITE_BYTES  = 5;
parameter S_CMD_LATCH    = 6;
parameter S_WR_CMD_CODE  = 7;
parameter S_CMD_ACK      = 8;

reg[4:0]           state,next_state;
reg[8:0]           byte_cnt; //byte counter
reg                wr_ack_d0;//delay wr_ack
reg[7:0]           cmd_code;
reg[8:0]           byte_size;//Command length correction

assign cmd_ack = (state == S_CMD_ACK) ? 1'b1 : 1'b0;
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_ack_d0 <= 1'b0;
	else
		wr_ack_d0 <= wr_ack;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_req <= 1'b0;
	else
		wr_req <= (state == S_READ_BYTES || state == S_WR_CMD_CODE || state == S_WRITE_BYTES ) ? 1'b1 : 1'b0;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		data_req <= 1'b0;
	else
		data_req <= ( (state == S_WRITE_BYTES ) && (byte_cnt >= 9'd2) && (byte_cnt != byte_size - 9'd1) && wr_ack_d0 == 1'b1 ) ? 1'b1 : 1'b0;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		state <= S_IDLE;
	else
		state <= next_state;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		CS_reg <= 1'b0;
	else if(state == S_CS_LOW)
		CS_reg <= 1'b0;
	else if(state == S_CS_HIGH || state == S_IDLE)
		CS_reg <= 1'b1;
end

always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		data_valid <= 1'b0;
	else if(state == S_READ_BYTES && byte_cnt >= 9'd3 && wr_ack == 1'b1 && cmd == `CMD_READ )
		data_valid <= 1'b1;
	else if(state == S_READ_BYTES && byte_cnt >= 9'd0 && wr_ack == 1'b1 && (cmd == `CMD_RDID  || cmd == `CMD_RDSR) )
		data_valid <= 1'b1;
	else
		data_valid <= 1'b0;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		data_out <= 8'd0;
	else if(state == S_READ_BYTES && byte_cnt >= 9'd3 && wr_ack == 1'b1 && cmd == `CMD_READ)
		data_out <= data_recv;
	else if(state == S_READ_BYTES && byte_cnt >= 9'd0 && wr_ack == 1'b1 && (cmd == `CMD_RDID  || cmd == `CMD_RDSR) )
		data_out <= data_recv;
	else
		data_out <= data_out;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		send_data <= 8'd0;
	else if(state == S_WR_CMD_CODE)
		send_data <= cmd_code;
	else if(state == S_READ_BYTES)
		if(byte_cnt == 8'd0)
			send_data <= addr[23:16];
		else if(byte_cnt == 8'd1)
			send_data <= addr[15:8];
		else if(byte_cnt == 8'd2)
			send_data <= addr[7:0];
		else
			send_data <= 8'h0;
	else if(state == S_WRITE_BYTES)
		if(byte_cnt == 8'd0)
			send_data <= addr[23:16];
		else if(byte_cnt == 8'd1)
			send_data <= addr[15:8];
		else if(byte_cnt == 8'd2)
			send_data <= addr[7:0];
		else
			send_data <= data_in;
	else
		send_data <= 8'h0;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		byte_cnt <= 9'd0;
	else if(state == S_READ_BYTES || state == S_WRITE_BYTES)
		if(wr_ack == 1'b1)
			byte_cnt <= byte_cnt + 9'd1;
		else
			byte_cnt <= byte_cnt;
	else
		byte_cnt <= 9'd0;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		byte_size <= 9'd0;
	else if(state == S_CMD_LATCH)
		case(cmd)
			`CMD_RDID       :  byte_size <= size;
			`CMD_RDSR       :  byte_size <= size;
			`CMD_WRSR       :  byte_size <= 9'd1;
			`CMD_READ       :  byte_size <= 9'd3 + size;
			`CMD_FAST_READ  :  byte_size <= 9'd3 + size;
			`CMD_PP         :  byte_size <= 9'd3 + size;
			`CMD_SE         :  byte_size <= 9'd3 + size;
			default         :  byte_size <= 9'd0;
		endcase
	else
		byte_size <= byte_size;
end
always@(posedge sys_clk or posedge rst)
begin
	if(rst == 1'b1)
		cmd_code <= 8'd0;
	else if(state == S_CMD_LATCH)
		cmd_code <= cmd;
	else
		cmd_code <= cmd_code;
end

always@(*)
begin
	case(state)
		S_IDLE:
			if(cmd_valid == 1'b1)
				next_state <= S_CMD_LATCH;
			else
				next_state <= S_IDLE;
		S_CMD_LATCH:
			next_state <= S_CS_LOW;
		S_CS_LOW:
			next_state <= S_WR_CMD_CODE;
		S_WR_CMD_CODE:
			if(wr_ack  == 1'b1 && ((cmd == `CMD_WREN) || (cmd == `CMD_WRDI)  || (cmd == `CMD_BE)))
				next_state <= S_KEEP_CS_LOW;
			else if(wr_ack  == 1'b1 && ((cmd == `CMD_RDSR) || (cmd == `CMD_RDID) || (cmd == `CMD_READ)  || (cmd == `CMD_FAST_READ)) )
				next_state <= S_READ_BYTES;
			else if(wr_ack  == 1'b1 && ((cmd == `CMD_WRSR) || (cmd == `CMD_PP) || (cmd == `CMD_SE)))
				next_state <= S_WRITE_BYTES;
			else
				next_state <= S_WR_CMD_CODE;
		S_READ_BYTES:
			if(wr_ack  == 1'b1 && byte_cnt == byte_size - 9'd1)
				next_state <= S_KEEP_CS_LOW;
			else
				next_state <= S_READ_BYTES;
		S_WRITE_BYTES:
			if(wr_ack  == 1'b1 && byte_cnt == byte_size - 9'd1)
				next_state <= S_KEEP_CS_LOW;
			else
				next_state <= S_WRITE_BYTES;
		S_KEEP_CS_LOW:
			next_state <= S_CS_HIGH;
		S_CS_HIGH:
			next_state <= S_CMD_ACK;
		S_CMD_ACK:
			next_state <= S_IDLE;
		default:
			next_state <= S_IDLE;
	endcase
end


endmodule