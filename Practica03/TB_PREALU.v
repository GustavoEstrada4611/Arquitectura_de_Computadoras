/*Practica 03/Participacion Pre Alu | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 31/08/2025 */

`timescale 1ns/1ns
module preALU_TB();

reg [3:0]A_tb;
reg [3:0]B_tb;
reg sel_tb;
wire [3:0]C_tb;

pre_alu DUV (
.A(A_tb), 
.B(B_tb), 
.sel(sel_tb), 
.C(C_tb)
);

initial
begin
	sel_tb = 1'b0;		
	A_tb = 4'd2; B_tb = 4'd3;
	#100;
	A_tb = 4'd7; B_tb = 4'd5;
	#100;
	A_tb = 4'd15; B_tb = 4'd1;
	#100;
	sel_tb = 1'b1;
	A_tb = 4'b0101; B_tb = 4'b0011;
	#100;
	A_tb = 4'b1111; B_tb = 4'b1010;
	#100;
	A_tb = 4'b1001; B_tb = 4'b0110;
	#100;
	$stop;
	end
	
endmodule
 

