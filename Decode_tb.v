`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 13:40:05
// Design Name: 
// Module Name: Decode_tb
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


module Decode_tb();

reg clk, rst, RF_write;
reg [31:0] Instr_D, RF_WD_D;

wire [31:0] RD1_E, RD2_E, Extend_E;
wire Alu_src_E, DM_Write_E, Result_E, RF_WE_E;
wire [1:0] Alu_op_E;

// DUT
Decode uut (
    .Instr_D(Instr_D),
    .RF_WD_D(RF_WD_D),
    .RF_write(RF_write),
    .clk(clk),
    .rst(rst),
    .RD1_E(RD1_E),
    .RD2_E(RD2_E),
    .Extend_E(Extend_E),
    .Alu_op_E(Alu_op_E),
    .Alu_src_E(Alu_src_E),
    .DM_Write_E(DM_Write_E),
    .Result_E(Result_E),
    .RF_WE_E(RF_WE_E)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// stimulus
initial begin
    rst = 1; RF_write = 0; RF_WD_D = 0;
    #20 rst = 0;

    // test instructions
    #20 Instr_D = 32'h00208333; // add
    #20 Instr_D = 32'h40208333; // sub
    #20 Instr_D = 32'h0020f333; // and
    #20 Instr_D = 32'h00918113; // addi
end

// monitor
always @(posedge clk) begin
    $monitor("Time=%0t | Instr=%h | RD1=%h RD2=%h Imm=%h | AluCtrl=%b AluSrc=%b DM_WE=%b Result=%b RF_WE=%b",
             $time, Instr_D, RD1_E, RD2_E, Extend_E, Alu_op_E, Alu_src_E, DM_Write_E, Result_E, RF_WE_E);
end

endmodule

