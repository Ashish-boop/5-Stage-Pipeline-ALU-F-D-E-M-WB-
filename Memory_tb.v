`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 18:39:30
// Design Name: 
// Module Name: Memory_tb
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


module Memory_tb();
reg [31:0] Alu_out, DM_WD_M;
reg DM_Write_M, Result, clk, rst;

wire [31:0] Alu_out_WB, DM_RD_out_WB;
wire Result_WB;

// instantiating memory module
Memory uut(
            .Alu_out(Alu_out), 
            .DM_WD_M(DM_WD_M), 
            .DM_Write_M(DM_Write_M), 
            .Result(Result), 
            .clk(clk), 
            .rst(rst), 
            .Alu_out_WB(Alu_out_WB), 
            .Result_WB(Result_WB), 
            .DM_RD_out_WB(DM_RD_out_WB));
            
//initilizing clk
initial begin
clk = 0;
forever #5 clk = ~clk;
end

// initializing signals
initial begin
rst = 1;
#20 rst = 0;
Alu_out = 32'd9;
DM_WD_M = 32'd99;
DM_Write_M = 1'b1;
end

initial begin
$monitor($time," Alu_out_WB : %h DM_RD_out_WB = %h Result_WB : %b", Alu_out_WB, DM_RD_out_WB, Result_WB);
end
   
endmodule
