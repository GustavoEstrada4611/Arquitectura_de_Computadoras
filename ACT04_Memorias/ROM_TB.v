/*Actvidad 04 Diseño y simulacion de memorias | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 20/09/2025 */

`timescale 1ns/1ns

module rom_tb;
    reg [7:0] direccion;
    wire [7:0] dato_s;
	
    rom DUV (
        .direccion(direccion),
        .dato_s(dato_s)
    );

    initial begin
	
        $monitor("Tiempo=%0t | Direccion=%0d | Dato=%0d", $time, direccion, dato_s);

        direccion = 8'd0;  #10;
        direccion = 8'd3;  #10;
        direccion = 8'd6;  #10;
        direccion = 8'd9;  #10;
        direccion = 8'd10; #10;
        direccion = 8'd15; #10;

        $stop;
    end
endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/ACT04_Memorias