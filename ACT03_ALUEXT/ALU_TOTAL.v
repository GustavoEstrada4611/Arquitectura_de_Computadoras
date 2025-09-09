/*Actvidad 03 ALU Extendida | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 07/09/2025 */

`timescale 1ns/1ns
module alu_extendida (
	input  [3:0] A,        
	input  [3:0] B,        
	input  [3:0] sel,     
	output reg [3:0] C 
);

always @*
	begin
		case(sel)
			// Operaciones Simples
			4'b0000: C = A + B;       // Suma
			4'b0001: C = A - B;       // Resta

			// Compuertas Logicas
			4'b0010: C = A & B;       // AND
			4'b0011: C = A | B;       // OR
			4'b0100: C = A ^ B;       // XOR

			// Comparaciones
			4'b0101: C = (A == B) ? 4'b0001 : 4'b0000; // Igualdad (A == B)
			4'b0110: C = (A > B)  ? 4'b0001 : 4'b0000; // Mayor que (A > B)

			// Desplazamientos lógicos
			4'b0111: C = A << B;      // Desplazamiento a la izquierda
			4'b1000: C = A >> B;      // Desplazamiento a la derecha

			default: C = 4'b0000;
		endcase
	end

endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/ACT03_ALUEXT