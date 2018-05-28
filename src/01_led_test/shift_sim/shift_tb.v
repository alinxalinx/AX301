`timescale 1 ns/1 ns
module shift_tb ;
reg clk ;
reg din ;
wire [7:0] q ;

initial
begin
  clk = 0 ;
  din = 0 ;
  forever
  begin
    #({$random}%100)
	 din = ~din ;
  end
end

always #10 clk = ~clk ;

shiftreg s0(
	.clock(clk),
	.shiftin(din),
	.q(q));

endmodule