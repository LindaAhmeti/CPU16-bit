`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 09:45:47 PM
// Design Name: 
// Module Name: CPU
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


module CPU(input Clock);


reg[15:0] PC;
wire[15:0] Instruction;

//TELAT E BRENDSHEM TE CPU
wire [5:0] opcode; //D_OUT_1
//CU_OUT_x
wire RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
wire [1:0] ALUOp;


initial
begin
assign PC = 16'd10;
end

//InstructionMem IM(PC, Instruction);


//inicializimi i Datapath    
DataPath DP
(
Clock,
RegDst,
Branch,
MemRead, 
MemWrite,
RegWrite,
MemToReg,
ALUSrc,
ALUOp,
opcode
);

//Inicializimi i COntrol Unit
ControlUnit ControlUnit(opcode,//Instruction[15:13],
RegDst, 
Branch, 
MemRead, 
MemToReg,
ALUOp,
MemWrite, 
ALUSrc,
RegWrite
);

endmodule
