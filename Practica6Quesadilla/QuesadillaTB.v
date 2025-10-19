//Practica 6 Quesadilla

`timescale 1ns/1ns


module quesadilla_tb();

reg clk_tb;
wire [31:0] InstQ_tb;

quesadilla DUV(.clk(clk_tb), .InstQ(InstQ_tb));

always @(clk_tb)
begin
	#50;
	clk_tb= 1`b0;
	#250;
end

endmodule