`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:49:10
// Design Name: 
// Module Name: Fetch_tb
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


module Fetch_tb();
// declaring the inputs and outputs
reg clk,rst;
wire [31:0] Instr_D;

// instantiating the module
Fetch uut(.clk(clk),.rst(rst),.Instr_D(Instr_D));

// initilizing the clock
initial begin
clk = 0;
forever #5 clk = ~clk;
end

// initializing the values
initial begin
rst = 1;

#20 rst = 0;
end

//monitoring the values
initial begin
$monitor($time,"Instr_D : %h",Instr_D);
end


endmodule
