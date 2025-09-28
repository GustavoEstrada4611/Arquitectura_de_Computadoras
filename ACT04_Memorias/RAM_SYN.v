/*Actvidad 04 Diseño y simulacion de memorias | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 20/09/2025 */

`timescale 1ns/1ns

module ram_syn (direccion, dato_s, Dato_E, EN, clk);
	input [7:0] direccion;
	input [7:0] Dato_E;
	input EN;
	input clk;
	output reg [7:0] dato_s;
	

reg [7:0] RAM [0:10]; 

initial
	begin
		RAM [0] =8'd90;
		RAM [1] =8'd80;
		RAM [2] =8'd70;
		RAM [3] =8'd60;
		RAM [4] =8'd50;
		RAM [5] =8'd40;
		RAM [6] =8'd30;
		RAM [7] =8'd20;
		RAM [8] =8'd10;
		RAM [9] =8'd100;
		RAM [10] =8'd101;
	end 

always @(posedge clk)
begin
    if (EN)
    begin
        RAM[direccion] = Dato_E;
    end
    dato_s = RAM[direccion];
end


endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/ACT04_Memorias

