`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 20:12:20
// Design Name: 
// Module Name: Top_module_TB
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


module Top_module_TB();
// declaring the wires
reg clk,rst;


// instantiating the top module
Top_module uut(.clk(clk),.rst(rst));

// initilizing clk
initial begin
clk = 0;
forever #50 clk = ~clk;
end

initial begin
rst = 1;

#150 rst = 0;
end

// monitoring the signals
initial begin
// Fetch
/*$monitor($time, "Instr_D_wire :%h  ", uut.Decode_u.Instr_D);

// Decode
$monitor($time, "RD1_E :%h  ", uut.Decode_u.RD1_E);
$monitor($time, "RD2_E :%h  ", uut.Decode_u.RD2_E);
$monitor($time, "Extend_E :%h  ", uut.Decode_u.Extend_E);
$monitor($time, "Alu_op_E :%b  ", uut.Decode_u.Alu_op_E);
$monitor($time, "Alu_src_E :%b  ", uut.Decode_u.Alu_src_E);
$monitor($time, "DM_Write_E :%b  ", uut.Decode_u.DM_Write_E);
$monitor($time, "Result_E :%b  ", uut.Decode_u.Result_E);
$monitor($time, "RF_WE_E :%b  ", uut.Decode_u.RF_WE_E);

// Execute
$monitor($time, "Alu_out_M :%h  ", uut.Execute_u.Alu_out_M);
$monitor($time, "DM_WD_M :%h  ", uut.Execute_u.DM_WD_M);

// Memory
$monitor($time, "DM_RD_out_WB :%h  ", uut.Memory_u.DM_RD_out_WB);
$monitor($time, "Alu_out_M :%h  ", uut.Memory_u.Alu_out_M);

// Write Back 
$monitor($time, "ResultSrc_WB :%h  ", uut.Write_back_u.ResultSrc_WB);
$monitor($time, "Result_out_final :%h  ", uut.Write_back_u.Result_out_final);
*/

end

endmodule
