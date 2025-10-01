/*Practica 05 Burrito | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 29/09/2025 */

`timescale 1ns/1ns

module alu_extendida (
	input  [31:0] A,
	input  [31:0] B,
	input  [3:0] sel,
	output reg [31:0] C
);

always @*
	begin
		case(sel)
			// Operaciones Aritméticas
			4'b0000: C = A + B;
			4'b0001: C = A - B;

			// Operaciones Lógicas
			4'b0010: C = A & B;
			4'b0011: C = A | B;
			4'b0100: C = A ^ B;

			// Comparaciones
			4'b0101: C = (A < B);
			4'b0110: C = (A > B);

			// Desplazamientos Lógicos
			4'b0111: C = A << B;   // Desplazamiento a la izquierda
			4'b1000: C = A >> B;   // Desplazamiento a la derecha
			
			default: C = 32'b0;
		endcase
	end

endmodule
