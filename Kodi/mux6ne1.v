`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 03:25:02 PM
// Design Name: 
// Module Name: mux6ne1
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


module mux6ne1(
        input hyrja0,
        input hyrja1,
        input hyrja2,
        input hyrja3,
        input hyrja4,
        input hyrja5,
        input[4:0] S,
        output reg Dalja
    );

  
    always @(*) 
    begin
        case (S)
            1: Dalja = hyrja1; 
            2: Dalja = hyrja0; 
            3: Dalja = hyrja4; 
            4: Dalja = hyrja2; 
            5: Dalja = hyrja5; 
            default: Dalja = hyrja3;   
        endcase
    end
endmodule 


   

