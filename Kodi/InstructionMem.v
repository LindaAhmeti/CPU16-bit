`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 07:36:17 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(
     input wire[15:0] PC,
     output wire[15:0] Instruction);

     reg[7:0] instrMem[127:0];

      initial
        $readmemh("instructionMemory.mem", instrMem);

assign Instruction[15:12] = instrMem[PC];
assign Instruction[11:8] = instrMem[PC + 16'd1];
assign Instruction[7:4] = instrMem[PC+ 16'd2];
assign Instruction[3:0] = instrMem[PC + 16'd3];


   
endmodule
