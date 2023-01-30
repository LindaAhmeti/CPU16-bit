`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:10:55 AM
// Design Name: 
// Module Name: mux2_ne1
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


module mux2_ne1(
    input Hyrja0,
    input Hyrja1,
    input S,
    output Dalja
    );
    
  assign Dalja = S ? Hyrja1 : Hyrja0;  
    
endmodule
