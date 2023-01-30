`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 04:01:19 PM
// Design Name: 
// Module Name: ALU_16bit
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


module ALU_16bit(
    input [15:0] A,
    input [15:0] B,
    input [1:0] ALUOp,
    input Binvert,           
    input BNegate,
    output Zero,
    output Overflow,
    output CarryOut,
    output [15:0] Result
    );
     wire [14:0] COUT;
     
     ALU_1bit ALU0(A[0], B[0], Result[15], BNegate, Binvert, ALUOp,Result[0], COUT[0]);
     ALU_1bit ALU1(A[1], B[1], 0, COUT[0], Binvert, ALUOp, Result[1], COUT[1]);
     ALU_1bit ALU2(A[2], B[2], 0, COUT[1], Binvert, ALUOp, Result[2], COUT[2]);
     ALU_1bit ALU3(A[3], B[3], 0,  COUT[2],  Binvert, ALUOp, Result[3], COUT[3]);
     ALU_1bit ALU4(A[4], B[4], 0, COUT[3],  Binvert, ALUOp, Result[4], COUT[4]);
     ALU_1bit ALU5(A[5], B[5], 0, COUT[4], Binvert, ALUOp, Result[5], COUT[5]);
     ALU_1bit ALU6(A[6], B[6], 0, COUT[5],  Binvert, ALUOp, Result[6], COUT[6]);
     ALU_1bit ALU7(A[7], B[7], 0, COUT[6],  Binvert, ALUOp, Result[7], COUT[7]);
     ALU_1bit ALU8(A[8], B[8], 0, COUT[7],  Binvert, ALUOp, Result[8], COUT[8]);
     ALU_1bit ALU9(A[9], B[9], 0, COUT[8],  Binvert, ALUOp, Result[9], COUT[9]);
     ALU_1bit ALU10(A[10], B[10],0,  COUT[9],  Binvert, ALUOp, Result[10], COUT[10]);
     ALU_1bit ALU11(A[11], B[11], 0, COUT[10],  Binvert, ALUOp, Result[11], COUT[11]);
     ALU_1bit ALU12(A[12], B[12],0,  COUT[11], Binvert, ALUOp, Result[12], COUT[12]);
     ALU_1bit ALU13(A[13], B[13],0,  COUT[12],  Binvert, ALUOp, Result[13], COUT[13]);
     ALU_1bit ALU14(A[14], B[14], 0, COUT[13], Binvert, ALUOp, Result[14], COUT[14]);
     ALU_1bit ALU15(A[15], B[15], 0, COUT[14],  Binvert, ALUOp, Result[15], CarryOut);
     
     assign Zero = ~(Result[0] | Result[1] | 
                     Result[2] | Result[3] | 
                     Result[4] | Result[5] | 
                     Result[6] | Result[7] | 
                     Result[8] | Result[9] | 
                     Result[10] | Result[11] | 
                     Result[12] | Result[13] | 
                     Result[14] | Result[15]);
                     
      assign Overflow = COUT[14] ^ CarryOut;
     
endmodule
