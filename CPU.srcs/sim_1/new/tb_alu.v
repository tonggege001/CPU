`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:32:11
// Design Name: 
// Module Name: tb_alu
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


module tb_alu();
   wire[31:0]A;
   wire[31:0]B;
   wire[3:0]Aluop;
   wire[4:0]Shamt;
   reg [31:0]R;
   wire Equal;
   
   Alu T5(A,B,Aluop,Shamt,R,Equal);
            initial begin
            #5 A = 100;
               B = 200;
            #5 Shamt=2;
               Aluop=0;
               Aluop=1;
               Aluop=2;
               Aluop=3;
               Aluop=4;
               Aluop=5;
               Aluop=6;
               Aluop=7;
               Aluop=8;
               Aluop=9;
               Aluop=10;
               Aluop=11;
               Aluop=12;
       
           end
endmodule
