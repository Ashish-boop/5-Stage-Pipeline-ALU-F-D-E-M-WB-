`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 17:52:00
// Design Name: 
// Module Name: Mux_3to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_3to1(a,b,c,s,d);

// declaring the input and outputs
input [31:0] a,b,c;
input [1:0] s;


output [31:0] d;

// assign output

    assign d = (s == 2'b00) ? a : (s == 2'b01) ? b : (s == 2'b10) ? c : 32'h00000000;
endmodule
