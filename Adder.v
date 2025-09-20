`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2025 22:14:41
// Design Name: 
// Module Name: Adder
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


module Adder(PC,PC_next);
// decalring the inputs
input [31:0] PC;

// decalrignt the output
output [31:0] PC_next;

// output assignment

assign PC_next = PC + 32'd4; 

endmodule
