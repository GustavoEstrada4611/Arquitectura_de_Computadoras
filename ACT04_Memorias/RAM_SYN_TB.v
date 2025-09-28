/*Actvidad 04 Diseño y simulacion de memorias | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 20/09/2025 */

`timescale 1ns/1ns

module tb_ram_syn;

    reg clk;
    reg EN;
    reg [7:0] direccion;
    reg [7:0] Dato_E;

    wire [7:0] dato_s;

    ram_syn DUV (
        .direccion(direccion),
        .dato_s(dato_s),
        .Dato_E(Dato_E),
        .EN(EN),
        .clk(clk)
    );

    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial 
    begin
        EN = 0;
        direccion = 0;
        Dato_E = 0;

        $display("Tiempo | EN | Direccion | Dato_E | Dato_S (Salida)");
        $monitor("%6d | %b  | %9d | %6d | %16d", $time, EN, direccion, Dato_E, dato_s);

        //CASO DE PRUEBA 1: Lectura de un valor pre-inicializado
        #10;
        EN = 0;
        direccion = 3;
        @(posedge clk);        
        #10;
        //CASO DE PRUEBA 2: Lectura de otra dirección
        direccion = 9;
        @(posedge clk);
        #10;
        //CASO DE PRUEBA 3: Escritura simple
        EN = 1;
        direccion = 0;
        Dato_E = 8'd255;
        @(posedge clk);
        #10;
        //CASO DE PRUEBA 4: Verificar que el dato escrito se mantiene
        EN = 0;
        direccion = 0;
        @(posedge clk);
        #10;
        //CASO DE PRUEBA 5: Escribir en otra dirección y verificar
        EN = 1;
        direccion = 5;
        Dato_E = 8'd123;
        @(posedge clk);        
        #10;
        EN = 0;
        direccion = 0;
        @(posedge clk);
        #20;
		$stop;
    end

endmodule