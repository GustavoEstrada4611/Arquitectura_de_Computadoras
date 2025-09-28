/*Practica 04 Banco de memorias | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 22/09/2025 */

`timescale 1ns/1ns

module tb_rb;

    reg [4:0]  RR1;
    reg [4:0]  RR2;
    reg [4:0]  wR;
    reg [31:0] wD;
    reg        RW;

    wire [31:0] RD1;
    wire [31:0] RD2;

    rb DUV (
        .RR1(RR1),
        .RR2(RR2),
        .wR(wR),
        .wD(wD),
        .RW(RW),
        .RD1(RD1),
        .RD2(RD2)
    );
	
    initial 
    begin
        $display("Tiempo| RW | RR1 | RR2 |  wR |           wD           |          RD1           |          RD2");
        $monitor("%5d | %b  | %2d  | %2d  | %2d  | 0x%h | 0x%h | 0x%h", $time, RW, RR1, RR2, wR, wD, RD1, RD2);

        //CASO 1: Lectura inicial de dos registros
        #10;
        RR1 = 5;
        RR2 = 10;
        RW  = 0;

        //CASO 2: Escritura en un registro
        #10;
        RW = 1;         
        wR = 3;         
        wD = 32'hAAAAAAAA;

        //CASO 3: Verificar la escritura leyendo el registro modificado
        #10;
        RW = 0;         
        RR1 = 3;       
        RR2 = 5;  

        //CASO 4: Intento de escritura con RW deshabilitado
        #10;
        RW = 0;        
        wR = 7;
        wD = 32'hDEADBEEF;

        //CASO 5: Verificar que la escritura en Caso 4 fue ignorada
        #10;
        RR1 = 7;        
        RR2 = 3;   

        //CASO 6: Lectura y Escritura simultánea en la misma dirección
        #10;
        RW = 1;
        wR = 15;        
        RR1 = 15;       
        RR2 = 0;
        wD = 32'hFFFF0000;

        #20;
        $stop;
    end

endmodule

//Repositorio en GitHub: https://github.com/GustavoEstrada4611/Arquitectura_de_Computadoras/tree/main/Practica04