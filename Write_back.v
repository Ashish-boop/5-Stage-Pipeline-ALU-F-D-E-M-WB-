`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 18:56:59
// Design Name: 
// Module Name: Write_back
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


module Write_back(Alu_out_WB, DM_RD_out_WB, RF_WE_WB, ResultSrc_WB, Result_out_final, RF_WE_final, RD_WB, RD_WB_final );

// declaration of inputs
input [31:0] Alu_out_WB, DM_RD_out_WB;
input wire ResultSrc_WB, RF_WE_WB;
input [4:0] RD_WB;

// declaration of output
output [31:0] Result_out_final;
output RF_WE_final;
output [4:0] RD_WB_final;

assign RF_WE_final = RF_WE_WB;
assign RD_WB_final = RD_WB;

// instantiation of mux
Mux_2to1 Mux_WB (.in1(Alu_out_WB), .in2(DM_RD_out_WB), .sel(ResultSrc_WB),.out(Result_out_final));



endmodule
