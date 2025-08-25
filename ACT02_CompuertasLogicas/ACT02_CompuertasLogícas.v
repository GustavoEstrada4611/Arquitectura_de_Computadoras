/* ACT02 Compuertas Logicas | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 22/08/2025 */

`timescale 1ns/1ns
module compuertas_logicas (
    input A,
	input B,
    output AND,
	output NAND,
    output OR,
	output NOR,
    output NOT,
    output XOR,
    output XNOR
);

assign AND  = A & B;
assign NAND = ~(A & B);
assign OR   = A | B;
assign NOR  = ~(A | B);
assign NOT = ~A;
assign XOR  = A ^ B;
assign XNOR = ~(A ^ B);

endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/ACT02_CompuertasLogicas



