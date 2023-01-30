`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 11:45:49 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(
    input [15:0] Address,
    input [15:0] WriteData,
    input MemWrite,
    input MemRead,
    input Clock,
    output [15:0] ReadData
    );
    
    reg[7:0] dataMem[127:0];

initial
$readmemb("dataMemory.mem", dataMem);

initial
$readmemb("dataMemory.mem", dataMem);

always@(posedge Clock)
begin
    if(MemWrite) 
        begin
            //bigEndian
            dataMem[Address + 16'd0] <= WriteData[15:12];
            dataMem[Address + 16'd1] <= WriteData[11:8];
            dataMem[Address + 16'd2] <= WriteData[7:4];
            dataMem[Address + 16'd3] <= WriteData[3:0];
           end
end

always@(negedge Clock)
begin
$writememb("dataMemory.mem", dataMem);
end

 
 assign ReadData[15:12] = dataMem[Address + 16'd0];
 assign ReadData[11:8] = dataMem[Address + 16'd1];
 assign ReadData[7:4] = dataMem[Address + 16'd2];
 assign ReadData[3:0] = dataMem[Address + 16'd3];


    
endmodule
