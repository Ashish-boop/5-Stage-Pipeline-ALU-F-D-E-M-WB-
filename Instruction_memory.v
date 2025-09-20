`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2025 22:17:10
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(PC_in,Instr);
// declaring the input
input [31:0] PC_in;

// declaring the output
output reg [31:0] Instr;

//assigning the output
always @(*) begin
    Instr <= PC_in;
end

endmodule
