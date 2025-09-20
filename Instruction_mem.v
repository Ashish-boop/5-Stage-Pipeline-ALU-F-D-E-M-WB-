`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 01:44:52
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem(
    input  wire [31:0] A,    // byte address
    output reg  [31:0] RD
);
    reg [31:0] mem [0:1023];
   
    // initialize (example instructions)
    /*initial begin
    
        mem[0] = 32'h006280b3; // add  x1, x5, x6    
        mem[1] = 32'h40628133; // sub  x2, x5, x6    
        mem[2] = 32'h00327433; // and x8, x4, x3
        //mem[3] = 32'h0062e233; // or   x4, x5, x6
        mem[3] = 32'h0092a023; // sw   x9, 0(x5)     -> store reg9 into memory 
        mem[4] = 32'h0002a383; // lw   x7, 0(x5)     -> load into x7 from same address
    end
    */
    
    initial begin 
        mem[0] = 32'h002082B3; // add x5,x1,x2
        mem[1] = 32'h00328333; // add x6,x5,x3
        mem[2] = 32'h004303B3; // add x7,x6,x4
        mem[3] = 32'h00A08593; // addi x11,x1,10
        mem[4] = 32'h0002A403; // lw x8,0(x5)
        mem[5] = 32'h001404B3; // add x9,x8,x1
        mem[6] = 32'h0024A433; // add x10,x9,x2
        mem[7] = 32'h00000013; // nop
        end
        
    always @(*) begin
        RD = mem[A[31:2]];
    end

endmodule
