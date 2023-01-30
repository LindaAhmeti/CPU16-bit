`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2022 04:59:44 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
     input[1:0] ALUOp,
     input[3:0] Funct,
     output reg[3:0] Operacioni,
     input [2:0] OPCODE
     );
     
     always @(ALUOp)
begin

case(ALUOp)
2'b00:                  //LW, SW 
begin
assign Operacioni = 4'b0010;
end
2'b01:
begin                   //BNE
assign Operacioni = 4'b0110;
end
2'b10:
begin
    case(Funct)
    4'b0000:                    //ADD
    begin
    assign Operacioni = 4'b0010;
    end
    4'b0001:                    //SUB
    begin
    assign Operacioni = 4'b1110;
    end
    4'b0010:                    //MOD
    begin
    assign Operacioni = 4'b0110;
    end
    4'b1101:                    //XOR
    begin
    assign Operacioni = 4'b0011;
    end
    endcase
 end   
2'b11:
begin
    case(OPCODE)  
    3'b001:                    //ANDI
    begin
    assign Operacioni = 4'b0000;
    end
    3'b010:                    //ORI
    begin
    assign Operacioni = 4'b0001;                 
    end
    3'b100:                    //SLTI             
    begin
    assign Operacioni = 4'b0100;              
    end
    endcase
  end  
endcase

end
endmodule
