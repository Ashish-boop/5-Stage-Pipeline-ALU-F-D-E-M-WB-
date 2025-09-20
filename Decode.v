`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 02:00:59
// Design Name: 
// Module Name: Decode
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


module Decode(Instr_D, RF_WD_D, RF_write, clk, rst, RD1_E, RD2_E, Extend_E, Alu_op_E, Alu_src_E, DM_Write_E, Result_E, RF_WE_E,RD_E, RDW, Rs1_E, Rs2_E);

// declaring the inputs 
input clk, rst,RF_write;
input [31:0] Instr_D, RF_WD_D; 
input [4:0] RDW;

// declaring the outputs
output [31:0] RD1_E, RD2_E, Extend_E;
output Alu_src_E, DM_Write_E, Result_E, RF_WE_E;
output [2:0] Alu_op_E;
output [4:0] RD_E, Rs1_E, Rs2_E;

//declaring the internal wires
wire [31:0] RD1, RD2, sign_ext_D;
wire immSrc, ResultSrc, AluSrc, DM_WE, RF_WE;
wire [2:0] Alu_control;


// declaring the cycle registers
reg [31:0] RD1_D, RD2_D, Extend_D;
reg DM_WE_D, RF_WE_D, ResultSrc_D, AluSrc_D;
reg [2:0] Alu_control_D;
reg [4:0] RD_D, Rs1_D, Rs2_D ;

//instantiating the regfile module
Reg_file RG_E (
            .A1(Instr_D[19:15]), 
            .A2(Instr_D[24:20]), 
            .A3(RDW), 
            .RFW(RF_write), 
            .RD1(RD1), 
            .RD2(RD2), 
            .WD(RF_WD_D), 
            .clk(clk));
            
            
// instantiating the Sign extend module
Sign_extend SE_E(
            .instr(Instr_D),
            .immSrc(immSrc), 
            .out(sign_ext_D)
);


// instantiating the Control unit
Control_unit CU_E(
            .opcode(Instr_D[6:0]),
            .func3(Instr_D[14:12]),
            .func7(Instr_D[31:25]),
            .DM_WE(DM_WE),
            .RF_WE(RF_WE),
            .Extend_Src(immSrc),
            .ResultSrc(ResultSrc),
            .AluSrc(AluSrc),
            .Alu_control(Alu_control)
);

// Decode cycle logic

always @(posedge clk)
begin
    if (rst) begin
        RD1_D <= 32'b00000000;
        RD2_D <= 32'b00000000;
        Extend_D <= 32'b00000000;
        
        DM_WE_D <= 1'b0;
        RF_WE_D <= 1'b0;
        ResultSrc_D <= 1'b0;
        AluSrc_D <= 1'b0;
        Alu_control_D <= 2'b00;
        RD_D <= 5'd0;
        Rs1_D <= 5'd0;
        Rs2_D <= 5'd0;
        
    end
    else begin
        RD1_D <= RD1;
        RD2_D <= RD2;
        Extend_D <= sign_ext_D;
        
        DM_WE_D <= DM_WE;
        RF_WE_D <= RF_WE;
        ResultSrc_D <= ResultSrc;
        AluSrc_D <= AluSrc;
        Alu_control_D <= Alu_control;
        RD_D <= Instr_D[11:7];
        Rs1_D <= Instr_D[19:15];
        Rs2_D <= Instr_D[24:20];
    end
end


// assigning the outputs of Decode phase        
assign RD1_E = RD1_D;
assign RD2_E = RD2_D;
assign Extend_E = Extend_D;

assign Alu_src_E = AluSrc_D;
assign DM_Write_E = DM_WE_D;
assign Result_E = ResultSrc_D;
assign RF_WE_E = RF_WE_D;
assign Alu_op_E = Alu_control_D;
assign RD_E = RD_D;
assign Rs1_E = Rs1_D; 
assign Rs2_E = Rs2_D;
  
endmodule
