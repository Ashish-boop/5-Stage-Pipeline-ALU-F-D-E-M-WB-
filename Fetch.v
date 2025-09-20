`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:27:55
// Design Name: 
// Module Name: Fetch
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


module Fetch(clk,rst,Instr_D);
// declaring the input
input clk,rst;

// declaring output
output [31:0] Instr_D;

// declaring internal the wire
wire [31:0] PC_in, PC_out, Instr;

// declaring the register
reg [31:0] Instr_F;
// instantiating the PC module
PC_reg PC_F(
        .clk(clk), 
        .rst(rst), 
        .PC_in(PC_in), 
        .PC_out(PC_out));
        
// instantiating the adder
Adder adder_F(
        .PC(PC_out),
        .PC_next(PC_in));
        
// instantiating the Instrction memory module
Instruction_mem IM_F(
        .A(PC_out),
        .RD(Instr));  
        
// fetch cycle logic
always @(posedge clk)
begin
    if (rst) begin
        Instr_F <= 32'h00000000;
    end
    else begin
        Instr_F <= Instr;
    end
end

// assigning output
assign Instr_D = Instr_F;

endmodule
