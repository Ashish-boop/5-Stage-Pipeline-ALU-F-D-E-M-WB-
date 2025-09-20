`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 18:12:38
// Design Name: 
// Module Name: Memory
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


module Memory(Alu_out, DM_WD_M, DM_Write_M, Result_M, RF_WE_M, RD_M, clk, rst, Alu_out_WB, ResultSrc_WB, DM_RD_out_WB, RF_WE_WB, RD_WB);
// declaring the inputs
input [31:0] Alu_out, DM_WD_M;
input DM_Write_M, Result_M, RF_WE_M, clk, rst;
input [4:0] RD_M;
// declaring the outputs
output [31:0] Alu_out_WB, DM_RD_out_WB;
output ResultSrc_WB, RF_WE_WB;
output [4:0] RD_WB;
// declaring wires
wire [31:0] DM_RD_out;

// declaring regs
reg [31:0] Alu_out_M, DM_RD_out_M;
reg Result, RF_WE;
reg [4:0] RD;
// instantiating the modules
Data_memory Data_memory_M(
            .A(Alu_out), 
            .clk(clk),
            .WE(DM_Write_M),
            .RD(DM_RD_out),
            .WD(DM_WD_M)
);

// Memory Cycle 

always @(posedge clk)
begin
    if (rst) begin
        Alu_out_M <= 32'h00000000;
        DM_RD_out_M <= 32'h00000000;
        Result <= 1'b0;
        RF_WE <= 1'b0;
        RD <= 5'h00;
    end
    else begin
        Alu_out_M <= Alu_out;
        DM_RD_out_M <= DM_RD_out;
        Result <= Result_M;
        RF_WE <= RF_WE_M;
        RD <= RD_M;
    end
end

// output assignment
assign Alu_out_WB = Alu_out_M;
assign DM_RD_out_WB = DM_RD_out_M;
assign ResultSrc_WB = Result;
assign RF_WE_WB = RF_WE;
assign RD_WB = RD;

endmodule
