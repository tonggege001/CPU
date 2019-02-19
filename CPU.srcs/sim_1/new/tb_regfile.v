`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:22:12
// Design Name: 
// Module Name: tb_regfile
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


module tb_regfile();
    reg Clk;
    wire[4:0]rA;
    wire[4:0]rB;
    wire[4:0]rW;
    wire WE;
     wire[31:0]wData;
     wire[31:0] A;
     wire[31:0] B;

    reg[31:0]Regfile[1:31];  
     Reg_File T4(Clk,rA,rB,rW,WE,wData,A,B);
   always #10 clk = ~clk; 
           initial begin
          rA = 1;
          rB = 2;
          rW = 3;
          WE = 1;
          Regfile[1] = 100;
          Regfile[2] = 200;
           wData<=500;       
           #50 WE = 0;
          end
endmodule

