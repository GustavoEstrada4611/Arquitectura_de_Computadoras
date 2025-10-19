//Practica 6 Quesadilla

`timescale 1ns/1ns

module MemInstrucciones(
	input [31:0]Dir,
	output [31:0]InstActual
	);
	

reg [7:0] MI [0:255];
initial begin
	$readmemb ("instrucciones.txt", MI);
end

always @*
begin
	InstActual = {MI[Dir], MI[Dir+1], MI[Dir+2], MI[Dir+3]};
end

endmodule