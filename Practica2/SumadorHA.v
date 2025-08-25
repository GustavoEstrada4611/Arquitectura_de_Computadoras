`timescale 1ns/1ns
module HA (
	input A,
	input B,
	output AS,
	output S
	);
	
assign AS= A & B;
assign S= A ^ B;

endmodule