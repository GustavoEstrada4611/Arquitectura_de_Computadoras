/*Practica 03/Participacion Pre Alu | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 31/08/2025 */

`timescale 1ns/1ns
module pre_alu (
	input [3:0]A,
	input [3:0]B,
	input sel,
	output reg [3:0]C
);

always @*
	begin
		case(sel)
			1'b0: C= A+B;
			1'b1: C= A&B;
		endcase
	end

endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/Practica03 
