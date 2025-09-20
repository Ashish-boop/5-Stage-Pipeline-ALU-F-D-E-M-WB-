`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 15:20:54
// Design Name: 
// Module Name: Execute
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

module Execute(RD1_E, RD2_E, Extend_E, Alu_op_E, Alu_src_E, DM_Write_E, Result_E, RF_WE_E, clk, rst, DM_Write_M, Result_M, Alu_out_M, DM_WD_M, RF_WE_M, RD_E, RD_M );

// declaring the inputs
input [31:0] Extend_E, RD1_E, RD2_E;
input Alu_src_E, DM_Write_E, Result_E, RF_WE_E, clk, rst;
input [2:0] Alu_op_E;
input [4:0] RD_E;

// declaring the outputs
output [31:0] Alu_out_M, DM_WD_M;
output DM_Write_M, Result_M, RF_WE_M;
output [4:0] RD_M;

// declaring the internal wires
wire [31:0] SrcB_E, Alu_out;
// declaring the registers (execute)
reg [31:0] Alu_out_E, DM_WD_E;
reg DM_WE, Result_EX, RF_WE;
reg [4:0] RD;
// instantiating the modules
ALU ALU_E(
    .A(RD1_E),
    .B(SrcB_E),
    .ALU_out(Alu_out),
    .ALU_control(Alu_op_E)
);


Mux_2to1 Mux_E(
    .in1(RD2_E),
    .in2(Extend_E),
    .sel(Alu_src_E),
    .out(SrcB_E)
);

//Execute cycle logic
always @(posedge clk) begin
    if (rst) begin
        Alu_out_E <= 32'h00000000;
        DM_WE <= 1'b0;
        Result_EX <= 1'b0;
        DM_WD_E <= 32'h00000000;
        RF_WE <= 1'b0;
        RD <= 5'd0;
    end
    else begin
        Alu_out_E <= Alu_out ;
        DM_WE <= DM_Write_E;
        Result_EX <= Result_E;
        DM_WD_E <= RD2_E;
        RF_WE <= RF_WE_E;
        RD <= RD_E;
    end
end

// assigning the output
assign Alu_out_M = Alu_out_E;
assign DM_Write_M = DM_WE;
assign Result_M = Result_EX; 
assign DM_WD_M = DM_WD_E;   
assign RF_WE_M = RF_WE;
assign RD_M = RD;
   
endmodule
