`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2022 08:12:19 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(
    input clock,
    input RegDst,
    input Branch,
    input MemRead,
    input MemWrite,
    input RegWrite, 
    input MemToReg,
    input ALUSrc,
    input [1:0] ALUOp, 
    output [5:0] opcode
    );
    
    reg[15:0] pc_initial; // Regjistri PC
    wire [15:0] pc_next, pc4; //TELAT: T1, T2
    wire [15:0] instruction; //TELI T5
    wire [4:0] mux_regfile; //TELI T6
    wire[15:0] readData1, readData2, writeData, //TELAT T7 T8 T9 
    muxALU, ALU_Out, Zgjerimi, memToMux, //TELAT T10 T11 T12 T13
    shifter1, branchAdderToMux; //TELAT T14  T17 
    wire[3:0] ALUCtrl; //TELI T19
    wire zerof, overflow, carryout; // TELAT T20 T21 T22
    wire andMuxBranch; //t23
    
    
    initial
begin
    pc_initial = 16'd10; //inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
    
end

//T2 - PC rritet per 2 (ne sistemet 16 biteshe) per te gjitha instruksionet pervec BEQ, BNE, JUMP
assign pc2 = pc_initial + 2; 

//T14 - pergatitja e adreses per kercim ne BEQ (164 bit si MSB, 16 bit nga pjesa imediate, 2 bit shtyrje majtas (x4) 
assign shifter1 = {{8{instruction[9]}}, instruction[6:0], 2'b00};

//Instr mem //inicializimi i IM (PC adresa hyrje, teli instruction dajle)
InstructionMem IM(pc_initial, instruction); 

//T6 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1 ne foto
assign mux_regfile = (RegDst == 1'b1) ? instruction[6:4] : instruction[9:7]; 

// T12 - Zgjerimi nga 7 ne 16 bit - 16 bit si MSB dhe pjesa e instruction[15:0] - S1 ne foto
assign Zgjerimi = {{16{instruction[15]}}, instruction[6:0]};  

//REGFILE
//inicializimi i RF(RS, RT, T6 (RD[RD=RD || RD=RT]), T9, CU_OUT_x, CPU_IN_1, T7, T8)
RegsiterFile RF(instruction[12:10], instruction[9:7], mux_regfile, writeData, RegWrite, Clock, readData1, readData2 ); 

// T10 - Percaktimi nese hyrja e MUX-it M2 para ALU eshte Regjstri 2 i RF apo vlera imediate e instruksionit 
assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2; 

//inicializimi i ALU Control (CU_OUT_x, Function Code nga R-formati, Opcode, T19) - eshte shtuar ALUOp per I-format qe nuk eshte ne foto po kerkohet ne detyre 
ALU_Control AC(ALUOp[1:0], instruction[3:0], instruction[15:14], ALUCtrl[2:0]); 

//inicializimi i ALU (T7, T10, T19[3], T19[2], T19[1:0], T20, T11, T21, T22)
ALU_16bit ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2], ALUCtrl[1:0], zerof, ALU_Out, overflow, carryout);

//inicializimi i Data Memory (T11, CU_OUT_x, CU_OUT_x, CPU_IN_1, T13) 
DataMem DM(ALU_Out, MemWrite, MemRead, Clock, memToMux);

//T9 - Teli qe i dergon te dhenat nga MUX - M3 ne Regfile
assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

//T23 - Teli qe del nga porta DHE ne pjesen e eperme te fotos (shikon nese plotesohet kushti per BEQ
assign andMuxBranch = zerof & shifter1;

//T17, Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
assign beqAddress = pc2 + shifter1; 

//Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[15:13];
    
    
    
endmodule
