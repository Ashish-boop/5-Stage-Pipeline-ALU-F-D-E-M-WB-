`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:20:37
// Design Name: 
// Module Name: ALU
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


module ALU (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [2:0]  ALU_control,   
    output wire [31:0] ALU_out,
    output wire zero
);

    // Intermediate results
    wire [31:0] add_res  = A + B;                   // Add 
    wire [31:0] sub_res  = A - B;                   // Sub
    wire [31:0] and_res  = A & B;                   // And
    wire [31:0] or_res   = A | B;                   // Or
    wire [31:0] slt_res  = (A < B) ? 32'd1 : 32'd0; // Set less than 
    wire [31:0] xor_res  = A ^ B;                   // Xor
    wire [31:0] sll_res  = A << B[4:0];             // Shift Left
    wire [31:0] srl_res  = A >> B[4:0];             // Shift right
   
   

    // ALU control selection (nested ternary)
    assign ALU_out = (ALU_control == 3'b000) ? add_res :
                     (ALU_control == 3'b001) ? sub_res :
                     (ALU_control == 3'b010) ? and_res :
                     (ALU_control == 3'b011) ? or_res  :
                     (ALU_control == 3'b100) ? slt_res :
                     (ALU_control == 3'b101) ? xor_res :
                     (ALU_control == 3'b110) ? sll_res :
                     (ALU_control == 3'b111) ? srl_res :
                     32'd0;

    // Zero flag
    assign zero = (ALU_out == 32'd0);

endmodule
