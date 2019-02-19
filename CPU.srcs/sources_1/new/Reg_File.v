`timescale 1ns / 1ps

module Reg_File(Clk,rA,rB,rW,WE,wData,A,B);
    input Clk;
    input wire[4:0]rA;
    input wire[4:0]rB;
    input wire[4:0]rW;
    input WE;
    input wire[31:0]wData;
    output wire[31:0] A;
    output wire[31:0] B;
    
    reg[31:0]Regfile[4:0];
    
    initial begin
    //TODO 出初始化寄存器文件的值为0
    

    end
    
    assign A = Regfile[rA];
    assign B = Regfile[rB];
    
    always @(posedge Clk) begin
        if(WE) begin
            Regfile[rW] <= wData;
        end
    end;
endmodule
