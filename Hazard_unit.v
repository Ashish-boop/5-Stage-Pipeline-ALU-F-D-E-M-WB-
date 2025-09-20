`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2025 17:51:32
// Design Name: 
// Module Name: Hazard_unit
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


module Hazard_unit(rst, RegWriteM, RegWriteW, RD_M, RD_WB, Rs1_E, Rs2_E, ForwardAE, ForwardBE);

// declaration of input and output
input rst, RegWriteM, RegWriteW;
input [4:0] RD_M, RD_WB, Rs1_E, Rs2_E;
output [1:0] ForwardAE, ForwardBE;


assign ForwardAE =  ((RegWriteM == 1'b1) & (RD_M != 5'd0) & (RD_M == Rs1_E)) ? 2'b10 :
                    ((RegWriteW == 1'b1) & (RD_WB != 5'd0) & (RD_WB == Rs1_E)) ? 2'b01 : 2'b00;
                       
assign ForwardBE =  ((RegWriteM == 1'b1) & (RD_M != 5'd0) & (RD_M == Rs2_E)) ? 2'b10 :
                    ((RegWriteW == 1'b1) & (RD_WB != 5'd0) & (RD_WB == Rs2_E)) ? 2'b01 : 2'b00;
                       

endmodule
