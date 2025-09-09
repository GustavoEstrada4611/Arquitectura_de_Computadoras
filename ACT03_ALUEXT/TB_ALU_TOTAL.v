/*Actvidad 03 ALU | Arquitectura de Computadoras
Estrada Rivera Gustavo de Jesus 220746114 | 07/09/2025 */

`timescale 1ns/1ns
module alu_extendida_TB();

reg  [3:0] A_tb;
reg  [3:0] B_tb;
reg  [3:0] sel_tb;
wire [3:0] C_tb;

alu_extendida DUV (
	.A(A_tb),
	.B(B_tb),
	.sel(sel_tb),
	.C(C_tb)
);

initial
begin
	$monitor("Tiempo=%0t | A=%d, B=%d, sel=%b | Resultado C = %d (%b)",
			 $time, A_tb, B_tb, sel_tb, C_tb, C_tb);
	sel_tb = 4'b0000;
	A_tb = 4'd5; B_tb = 4'd3;
	#100;
	A_tb = 4'd9; B_tb = 4'd2;
	#100;
	sel_tb = 4'b0001;
	A_tb = 4'd10; B_tb = 4'd4;
	#100;
	A_tb = 4'd3; B_tb = 4'd5;
	#100;
	sel_tb = 4'b0010;
	A_tb = 4'b1010; B_tb = 4'b1100;
	#100;
	sel_tb = 4'b0011;
	A_tb = 4'b1010; B_tb = 4'b1100;
	#100;
	sel_tb = 4'b0100;
	A_tb = 4'b1010; B_tb = 4'b1100;
	#100;
	sel_tb = 4'b0101;
	A_tb = 4'd9; B_tb = 4'd9;
	#100;
	A_tb = 4'd9; B_tb = 4'd8;
	#100;
	sel_tb = 4'b0110;
	A_tb = 4'd10; B_tb = 4'd5;
	#100;
	A_tb = 4'd5; B_tb = 4'd10;
	#100;
	sel_tb = 4'b0111;
	A_tb = 4'b0011; B_tb = 4'd1;
	#100;
	A_tb = 4'b0011; B_tb = 4'd2;
	#100;
	sel_tb = 4'b1000;
	A_tb = 4'b1100; B_tb = 4'd1;
	#100;
	A_tb = 4'b1100; B_tb = 4'd2;
	#100;
	$stop;
end

endmodule
