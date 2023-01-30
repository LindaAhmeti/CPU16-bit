`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:29:02 AM
// Design Name: 
// Module Name: Mbledhesi_1bit
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


module Mbledhesi_1bit(
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
    );
    
    assign SUM = CIN ^ A ^ B;
    assign COUT = CIN & A | CIN & B | A & B;
endmodule
