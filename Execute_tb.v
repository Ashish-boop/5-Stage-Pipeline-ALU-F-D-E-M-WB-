`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 16:48:04
// Design Name: 
// Module Name: Execute_tb
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


module Execute_tb();

// declaring the inputs and outputs 
reg [31:0] RD1_E, RD2_E, Extend_E;
reg Alu_src_E, DM_Write_E, Result_E, RF_WE_E, clk, rst;
reg [1:0] Alu_op_E;

wire [31:0] Alu_out_M;
wire DM_Write_M, Result_M;


// instantiating the module
Execute uut(
            .RD1_E(RD1_E),
            .RD2_E(RD2_E), 
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
            .Alu_out_M(Alu_out_M) );

// initializing the clk
initial begin
clk = 0;
forever #5 clk = ~ clk;
end

// initializing the values
initial begin
rst = 1;

#20 rst = 0;
RD1_E = 32'd4;
RD2_E = 32'd5;
Extend_E = 32'd6;
Alu_src_E = 1'b0;
Alu_op_E = 2'b00;

#20 rst = 0;
RD1_E = 32'd4;
RD2_E = 32'd5;
Extend_E = 32'd6;
Alu_src_E = 1'b1;
Alu_op_E = 2'b01;

#20 rst = 0;
RD1_E = 32'd4;
RD2_E = 32'd5;
Extend_E = 32'd6;
Alu_src_E = 1'b1;
Alu_op_E = 2'b10;

#20 rst = 0;
RD1_E = 32'd4;
RD2_E = 32'd5;
Extend_E = 32'd6;
Alu_src_E = 1'b1;
Alu_op_E = 2'b11;

end 

initial begin 

$monitor($time, "Alu_out_M : %h", Alu_out_M);

end
    
endmodule
