//Practica 6 Quesadilla
//COMPLETAR
`timescale 1ns/1ns

module quesadilla(
	input clk,
	output [31:0] InstQ
	);
	
wire [31:0] C1, C2;

PC queso(.clk(clk), .next(C1), );

MemInstrucciones tortilla();

ADD salsa(.A(4), .B(C1), );	