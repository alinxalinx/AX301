`timescale 1ns/1ns
module uart_test_tb;
parameter BAUD_RATE = 115200;
parameter UART_BIT_TIME = 1000000000 / BAUD_RATE;//ns
reg clk;
reg rst_n;
reg uart_rx;
wire uart_tx;
reg[7:0] rx_data;
initial
begin
	clk = 1'b0;
	rst_n = 1'b0;
	uart_rx = 1'b1;
	rx_data = 8'd0;
	#100
	rst_n = 1'b1;
	while(1)
	begin
	@(negedge uart_tx);
	#UART_BIT_TIME;
	#(UART_BIT_TIME/2) rx_data[0] = uart_tx;
	#UART_BIT_TIME rx_data[1] = uart_tx;
	#UART_BIT_TIME rx_data[2] = uart_tx;
	#UART_BIT_TIME rx_data[3] = uart_tx;
	#UART_BIT_TIME rx_data[4] = uart_tx;
	#UART_BIT_TIME rx_data[5] = uart_tx;
	#UART_BIT_TIME rx_data[6] = uart_tx;
	#UART_BIT_TIME rx_data[7] = uart_tx;
	#UART_BIT_TIME;
	$display("%c",rx_data);
	end
	
end
always#10 clk = ~clk;//50Mhz

uart_test dut(
	.clk    (clk    ),
	.rst_n  (rst_n  ),
	.uart_rx(uart_rx),
	.uart_tx(uart_tx)
);
endmodule 