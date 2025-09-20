`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:25:25
// Design Name: 
// Module Name: Control_unit
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



module Control_unit (
    input  wire [6:0] opcode,
    input  wire [2:0] func3,
    input  wire [6:0] func7,
    output wire DM_WE,
    output wire RF_WE,
    output wire Extend_Src,
    output wire ResultSrc,
    output wire AluSrc,
    output wire [2:0] Alu_control   
);

    // Instruction type detection
    wire is_load   = (opcode == 7'b0000011);  // LW
    wire is_store  = (opcode == 7'b0100011);  // SW
    wire is_rtype  = (opcode == 7'b0110011);  // R-type
    wire is_itype  = (opcode == 7'b0010011);  // I-type ALU 

    // Memory control
    assign DM_WE = is_store;

    // Register file write enable
    assign RF_WE = (is_load | is_rtype | is_itype);

    // Immediate source select
    assign Extend_Src = is_store; // S-type immediate for store, else I-type

    // Result source select
    assign ResultSrc = is_load; // load -> data memory, else ALU

    // ALU source select
    assign AluSrc = (is_load | is_store | is_itype); // I-type also uses imm

    // ALU control logic
    // Default = ADD (000)
    wire is_sub  = (is_rtype && func3 == 3'b000 && func7[5] == 1'b1);
    wire is_add  = (is_rtype && func3 == 3'b000 && func7[5] == 1'b0) |
                   (is_load | is_store) |
                   (is_itype && func3 == 3'b000); // ADDI
    wire is_and  = ((is_rtype | is_itype) && func3 == 3'b111);
    wire is_or   = ((is_rtype | is_itype) && func3 == 3'b110);
    wire is_slt  = ((is_rtype | is_itype) && func3 == 3'b010);
    wire is_xor  = ((is_rtype | is_itype) && func3 == 3'b100);
    wire is_sll  = ((is_rtype | is_itype) && func3 == 3'b001);
    wire is_srl  = ((is_rtype | is_itype) && func3 == 3'b101 && func7[5] == 1'b0);
    

    // Encoding ALU module
    assign Alu_control = is_add ? 3'b000 :
                         is_sub ? 3'b001 :
                         is_and ? 3'b010 :
                         is_or  ? 3'b011 :
                         is_slt ? 3'b100 :
                         is_xor ? 3'b101 :
                         is_sll ? 3'b110 :
                         is_srl ? 3'b111 :
                         3'b000; 

endmodule


