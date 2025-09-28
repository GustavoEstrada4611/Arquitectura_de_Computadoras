/*Actvidad 04 Diseño y simulacion de memorias | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 20/09/2025 */

`timescale 1ns/1ns

module ram_tb;
    reg [7:0] direccion;
    reg [7:0] Dato_E;
    reg EN;
	
    wire [7:0] dato_s;

    ram DUV (
        .direccion(direccion),
        .dato_s(dato_s),
        .Dato_E(Dato_E),
        .EN(EN)
    );

    initial begin
        $monitor("Tiempo=%0t | EN=%b | Dir=%d | Dato_E=%d | Dato_S=%d",
                  $time, EN, direccion, Dato_E, dato_s);

        // Pruebas De Lectura (EN=0)
        EN = 0;
        #5 direccion = 0;
        #5 direccion = 1;
        #5 direccion = 2; 
        #5 direccion = 5; 
        #5 direccion = 10; 

        // PRUEBAS DE ESCRITURA (EN=1)
        EN = 1;
        #5 direccion = 3; Dato_E = 8'd111;
        #5 direccion = 6; Dato_E = 8'd77;
        #5 direccion = 8; Dato_E = 8'd55;  
        #5 direccion = 9; Dato_E = 8'd22; 
        #5 direccion = 10; Dato_E = 8'd200;

        // Lectura Post-Escritura
        EN = 0;
        #5 direccion = 3;
        #5 direccion = 6;
        #5 direccion = 8;
        #5 direccion = 9;
        #5 direccion = 10;

        #10;
        $stop;
    end

endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/ACT04_Memorias