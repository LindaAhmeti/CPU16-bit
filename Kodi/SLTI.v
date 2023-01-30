`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2022 07:22:15 PM
// Design Name: 
// Module Name: SLTI
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


module SLTI(

     input[15:0] A,
    output[15:0] B
    );
reg slti;

integer int ;
initial begin
    int = A;
    end
initial begin
   if(int < 2)
    assign slti = 1;
    else
    assign slti = 0;
end
 
assign B = slti;
endmodule
