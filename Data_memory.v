`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:26:41
// Design Name: 
// Module Name: Data_memory
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


module Data_memory (
    input  wire [31:0] A,    // byte address
    input  wire        clk,
    input  wire        WE,
    output [31:0] RD,
    input  wire [31:0] WD
);
    reg [31:0] Data_mem [0:1023];

    integer k;
    initial begin
        for (k = 0; k < 1024; k = k + 1)
            Data_mem[k] = 32'h0;
        // sample initial data
        Data_mem[0] = 32'd40;
    end

    always @(posedge clk) begin
        if (WE)
            Data_mem[A[31:2]] <= WD;
    
    end
    
  assign  RD = Data_mem[A[31:2]];
endmodule
