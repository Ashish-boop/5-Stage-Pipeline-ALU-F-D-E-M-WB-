`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 19:14:30
// Design Name: 
// Module Name: Top_module
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


module Top_module(clk,rst);

// declaring the inputs
input clk,rst;


// wire declaration
// from Fetch to decode
wire [31:0] Instr_D_wire;

// From decode to Execute
wire [31:0] RD1_E_wire, RD2_E_wire, Extend_E;
wire Alu_src_E, DM_Write_E, Result_E, RF_WE_E;
wire [2:0] Alu_op_E;
wire [4:0] RD_E, RD1_E, RD2_E;
// from Execute to Memory
wire DM_Write_M, Result_M, RF_WE_M;
wire [31:0] Alu_out_M, DM_WD_M;
wire [4:0] RD_M;
// from memory to write back
wire [31:0] Alu_out_WB, DM_RD_out_WB;
wire ResultSrc_WB, RF_WE_WB;
wire [4:0] RD_WB;
// from Write back to decode
wire [31:0] Result_out_final;
wire RF_WE_final;
wire [4:0] RD_WB_final;

// hazard unit to muxes
wire [1:0] ForwardAE, ForwardBE;

// mux to ALU
wire [31:0] SrcA, SrcB;
// instantiation of modules

// fetch
    Fetch Fetch_u(
            .clk(clk),
            .rst(rst),
            .Instr_D(Instr_D_wire));
            
// Decode
    Decode Decode_u(
            .Instr_D(Instr_D_wire), 
            .RF_WD_D(Result_out_final), 
            .RF_write(RF_WE_final), 
            .clk(clk), 
            .rst(rst), 
            .RD1_E(RD1_E_wire), 
            .RD2_E(RD2_E_wire),
            .RDW(RD_WB_final), 
            .Extend_E(Extend_E), 
            .Alu_op_E(Alu_op_E), 
            .Alu_src_E(Alu_src_E), 
            .DM_Write_E(DM_Write_E), 
            .Result_E(Result_E), 
            .RF_WE_E(RF_WE_E),
            .RD_E(RD_E),
            .Rs1_E(RD1_E),
            .Rs2_E(RD2_E));
            
 // Execute
    Execute Execute_u(
            .RD1_E(SrcA), 
            .RD2_E(SrcB), 
            .Extend_E(Extend_E), 
            .Alu_op_E(Alu_op_E),
            .Alu_src_E(Alu_src_E), 
            .DM_Write_E(DM_Write_E), 
            .Result_E(Result_E), 
            .RF_WE_E(RF_WE_E), 
            .clk(clk), 
            .rst(rst), 
            .DM_Write_M(DM_Write_M), 
            .Result_M(Result_M), 
            .Alu_out_M(Alu_out_M), 
            .DM_WD_M(DM_WD_M), 
            .RF_WE_M(RF_WE_M),
            .RD_E(RD_E),
            .RD_M(RD_M));

 // Memory
    Memory Memory_u(
            .Alu_out(Alu_out_M), 
            .DM_WD_M(DM_WD_M), 
            .DM_Write_M(DM_Write_M), 
            .Result_M(Result_M), 
            .RF_WE_M(RF_WE_M), 
            .clk(clk), 
            .rst(rst), 
            .Alu_out_WB(Alu_out_WB), 
            .ResultSrc_WB(ResultSrc_WB), 
            .DM_RD_out_WB(DM_RD_out_WB), 
            .RF_WE_WB(RF_WE_WB),
            .RD_M(RD_M),
            .RD_WB(RD_WB));
            
  // Write Back
    Write_back Write_back_u(
            .Alu_out_WB(Alu_out_WB), 
            .DM_RD_out_WB(DM_RD_out_WB), 
            .RF_WE_WB(RF_WE_WB), 
            .ResultSrc_WB(ResultSrc_WB),  
            .Result_out_final(Result_out_final), 
            .RF_WE_final(RF_WE_final),
            .RD_WB(RD_WB), 
            .RD_WB_final(RD_WB_final));
            
    // Hazard Unit
    Hazard_unit Hazard_unit_u(
            .rst(rst), 
            .RegWriteM(RF_WE_M), 
            .RegWriteW(RF_WE_final), 
            .RD_M(RD_M), 
            .RD_WB(RD_WB_final), 
            .Rs1_E(RD1_E), 
            .Rs2_E(RD2_E), 
            .ForwardAE(ForwardAE), 
            .ForwardBE(ForwardBE)); 
            
     // Mux Alu A
     Mux_3to1 Mux_Alu_A (
            .a(RD1_E_wire),
            .b(Result_out_final),
            .c(Alu_out_M),
            .s(ForwardAE),
            .d(SrcA));
     
     // Muc Alu B
     Mux_3to1 Mux_Alu_B (
            .a(RD2_E_wire),
            .b(Result_out_final),
            .c(Alu_out_M),
            .s(ForwardBE),
            .d(SrcB));  
        
endmodule
