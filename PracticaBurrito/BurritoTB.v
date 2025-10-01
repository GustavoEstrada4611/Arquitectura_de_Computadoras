/*Practica 05 Burrito | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 29/09/2025 */

`timescale 1ns/1ns


module Burrito_tb();

reg [17:0] instruccion;

Burrito DUV(
	.Dir1(instruccion[17:13]), 
	.Dir2(instruccion[12:8]),  
	.DirEs(instruccion[7:3]),
	.Selec({1'b0, instruccion[2:0]})
);

initial
begin
	$monitor("Tiempo=%0t | Instruccion=%b | Dir1=%d, Dir2=%d, DirEs=%d, Selec=%b",
			 $time, instruccion, DUV.Dir1, DUV.Dir2, DUV.DirEs, DUV.Selec);

	// OPERACION 1: ADD R3, R1, R2
	// Op1=1, Op2=2, Dest=3, Op=000 (ADD)
	instruccion = 18'b00001_00010_00011_000;
	#100;

	//OPERACION 2: AND R5, R3, R4 ---
	// Op1=3, Op2=4, Dest=5, Op=010 (AND)
	instruccion = 18'b00011_00100_00101_010;
	#100;

	//OPERACIÓN 3: MENOR QUE R6, R1, R2 ---
	// Op1=1, Op2=2, Dest=6, Op=101
	instruccion = 18'b00001_00010_00110_101;
	#100;

	$stop;
end

endmodule
