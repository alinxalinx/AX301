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

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/6/21    meisq         1.0         Original
//*************************************************************************/
module sd_card_audio(
	input                       clk,
	input                       rst_n,
	input                       key1,
	output[3:0]                 state_code,
	input                       bclk,         //audio bit clock
	input                       daclrc,       //DAC sample rate left right clock
	output                      dacdat,       //DAC audio data output 
	input                       adclrc,       //ADC sample rate left right clock
	input                       adcdat,       //ADC audio data input
	output                      sd_ncs,       //SD card chip select (SPI mode)  
	output                      sd_dclk,      //SD card clock
	output                      sd_mosi,      //SD card controller data output
	input                       sd_miso       //SD card controller data input
);
wire             button_negedge;              //press button ,one clock cycle    
wire             sd_sec_read;                 //SD card sector read
wire[31:0]       sd_sec_read_addr;            //SD card sector read address
wire[7:0]        sd_sec_read_data;            //SD card sector read data
wire             sd_sec_read_data_valid;      //SD card sector read data valid
wire             sd_sec_read_end;             //SD card sector read end
wire             wav_data_wr_en;              //wav audio data write enable
wire[7:0]        wav_data;                    //wav audio data
wire[15:0]       wrusedw;                     //fifo write Used Words
wire[31:0]       read_data;                   //fifo read data
wire             read_data_en;                //fifo read enable
wire             rdempty;                     //fifo read empty
wire[31:0]       tx_left_data;                //left channel audio data
wire[31:0]       tx_right_data;               //right channel audio data
wire             sd_init_done;                //SD card initialization completed
assign tx_left_data =  {16'd0,read_data[15:0]};
assign tx_right_data = {16'd0,read_data[31:16]};
ax_debounce#(.FREQ(100)) ax_debounce_m0
(
	.clk             (clk),
	.rst             (~rst_n),
	.button_in       (key1),
	.button_posedge  (),
	.button_negedge  (button_negedge),
	.button_out      ()
);

audio_tx audio_tx_m0
(
	.rst                       (~rst_n                     ),        
	.clk                       (clk                        ),
	.sck_bclk                  (bclk                       ),
	.ws_lrc                    (adclrc                     ),
	.sdata                     (dacdat                     ),
	.left_data                 (tx_left_data               ),
	.right_data                (tx_right_data              ),
	.read_data_en              (read_data_en               )
);

afifo_8i_32o_1024 audio_buf
	(
	.rdclk                     (clk                        ),          // Read side clock
	.wrclk                     (clk                        ),          // Write side clock
	.aclr                      (1'b0                       ),          // Asynchronous clear
	.wrreq                     (wav_data_wr_en             ),          // Write Request
	.rdreq                     (read_data_en & ~rdempty    ),          // Read Request
	.data                      (wav_data                   ),          // Input Data
	.rdempty                   (rdempty                    ),          // Read side Empty flag
	.wrfull                    (                           ),          // Write side Full flag
	.rdusedw                   (                           ),          // Read Used Words
	.wrusedw                   (wrusedw[9:0]               ),          // Write Used Words
	.q                         (read_data                  )
);

wav_read wav_read_m0(
	.clk                       (clk                        ),
	.rst                       (~rst_n                     ),
	.ready                     (                           ),
	.find                      (button_negedge             ),
	.sd_init_done              (sd_init_done               ),
	.state_code                (state_code                 ),
	.sd_sec_read               (sd_sec_read                ),
	.sd_sec_read_addr          (sd_sec_read_addr           ),
	.sd_sec_read_data          (sd_sec_read_data           ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid     ),
	.sd_sec_read_end           (sd_sec_read_end            ),
	.fifo_wr_cnt               (wrusedw                    ),
	.wav_data_wr_en            (wav_data_wr_en             ),
	.wav_data                  (wav_data                   )
);
sd_card_top  sd_card_top_m0(
	.clk                       (clk                        ),
	.rst                       (~rst_n                     ),
	.SD_nCS                    (sd_ncs                     ),
	.SD_DCLK                   (sd_dclk                    ),
	.SD_MOSI                   (sd_mosi                    ),
	.SD_MISO                   (sd_miso                    ),
	.sd_init_done              (sd_init_done               ),
	.sd_sec_read               (sd_sec_read                ),
	.sd_sec_read_addr          (sd_sec_read_addr           ),
	.sd_sec_read_data          (sd_sec_read_data           ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid     ),
	.sd_sec_read_end           (sd_sec_read_end            ),
	.sd_sec_write              (1'b0                       ),
	.sd_sec_write_addr         (32'd0                      ),
	.sd_sec_write_data         (                           ),
	.sd_sec_write_data_req     (                           ),
	.sd_sec_write_end          (                           )
);
endmodule 