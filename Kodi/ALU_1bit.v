`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:55:19 AM
// Design Name: 
// Module Name: ALU_1bit
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


module ALU_1bit(
    input A,
    input B,
    input CIN,
    input LESS,
    input Binvert,
    input [1:0] Operation,
    output Result,
    output COUT
    );
    
    wire JoB, mB, Dhe, Ose, Mbledhesi, XOR, slti; 
    
   assign JoB = ~B;
    
    mux2_ne1 muxB(B, JoB, BInvert, mB);
    
    assign AND = A & mB;
    assign OR = A | mB;
    assign XOR = A ^ mB;
  
    
    SLTI s(A,slti);
  
    Mbledhesi_1bit Adder(A, mB, CIN, Mbledhesi, COUT);
   // mux4ne1 muxalu(Dhe, Ose, Mbledhesi,LESS, Operation, Result);
    mux6ne1 muxALU(AND, OR, Mbledhesi, XOR, slti, LESS, Operation, Result);
endmodule
