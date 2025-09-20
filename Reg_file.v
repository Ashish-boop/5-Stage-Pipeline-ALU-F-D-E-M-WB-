`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:07:03
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(A1, A2, A3, RFW, RD1, RD2, WD, clk);

// declaring the inputs
input clk,RFW;
input [31:0] WD;
input [4:0] A1, A2, A3;

// declaring the outputs
output [31:0] RD1, RD2;

// declaring the Reg memory
reg [31:0] RegFile [31:0];

// Regfile logic

always @(posedge clk)
begin
    if (RFW) begin
        RegFile [A3] <= WD;
    end
end

// Assign the Regfile

assign RD1 = RegFile[A1];
assign RD2 = RegFile[A2];


initial begin
     
    RegFile[0] = 32'd0;
    RegFile[1] = 32'd1;
    RegFile[2] = 32'd2;
    RegFile[3] = 32'd3;
    RegFile[4] = 32'd4;
    RegFile[5] = 32'd5; 
    RegFile[6] = 32'd6;
    RegFile[7] = 32'd7;
    RegFile[8] = 32'd8;
    RegFile[9] = 32'd9;
    RegFile[10] = 32'd10;
    RegFile[11] = 32'd11;
    RegFile[12] = 32'd12;
    RegFile[13] = 32'd13;
    RegFile[14] = 32'd14;
    RegFile[15] = 32'd15;
    RegFile[16] = 32'd16;
    RegFile[17] = 32'd17;
    RegFile[18] = 32'd18;
    
    
end

endmodule
