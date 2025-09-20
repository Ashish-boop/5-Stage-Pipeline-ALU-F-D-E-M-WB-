`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2025 22:10:18
// Design Name: 
// Module Name: PC_reg
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


module PC_reg(clk, rst, PC_in, PC_out);
// declaring the inputs
input  clk,rst;
input [31:0] PC_in;
// declaring the output
output reg [31:0] PC_out;

// PC logic
always @(posedge clk)
begin
    if (rst) begin
        PC_out <= 32'h00000000;
    end
    else begin
        PC_out <= PC_in;
    end
end
endmodule
