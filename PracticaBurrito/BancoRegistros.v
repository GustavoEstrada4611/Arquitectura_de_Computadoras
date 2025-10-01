/*Practica 05 Burrito | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 29/09/2025 */

`timescale 1ns/1ns

module rb(
	input RW,         
	input [4:0] RR1,   
	input [4:0] RR2,    
	input [4:0] wR,     
	input [31:0] wD,   
	output reg [31:0] RD1, 
	output reg [31:0] RD2
	);

    reg [31:0] regs [0:31];
	
	initial
	begin	
		$readmemb("Datos.txt", regs);
	end
	
always @*
begin
    if (RW) 
	begin
		regs[wR] = wD; 
    end
	RD1 = regs[RR1];
    RD2 = regs[RR2];
end
   
endmodule

