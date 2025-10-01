/*Practica 05 Burrito | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 29/09/2025 */

`timescale 1ns/1ns

module Burrito(    
	input [4:0] Dir1,   
	input [4:0] Dir2,   
	input [4:0] DirEs, 
	input [3:0] Selec 
	);

	wire [31:0] C1, C2, C3;   
 
	alu_extendida Tortilla(
		.A(C1),
		.B(C2),
		.sel(Selec),
		.C(C3)
	);

	rb Relleno(
		.RW(1),
		.RR1(Dir1),
		.RR2(Dir2),
		.wR(DirEs),
		.RD1(C1),
		.RD2(C2),
		.wD(C3)
	);

endmodule

