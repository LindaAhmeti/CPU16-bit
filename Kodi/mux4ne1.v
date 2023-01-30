`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:22:40 AM
// Design Name: 
// Module Name: mux4ne1
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


module mux4ne1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input [1:0] S,
    output Dalja
    );
    
    //S 00 H0
    //S 01 H1
    //S 10 H2
    //S 11 H3
    assign Dalja = S[1] ? (S[0] ? Hyrja3 : Hyrja2) : (S[0] ? Hyrja1 : Hyrja0);   
endmodule
