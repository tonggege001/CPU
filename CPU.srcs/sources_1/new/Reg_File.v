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
    
    reg[5:0]count;
    
    initial begin
        //TODO ����ʼ���Ĵ����ļ���ֵΪ0
        count = 0;
        while(count <= 31) begin
            Regfile[count] = 0;
            count = count + 1;
        end
    end
    
    assign A = Regfile[rA];
    assign B = Regfile[rB];
    
    always @(posedge Clk) begin
        if(WE) begin
            Regfile[rW] <= wData;
        end
    end;
endmodule
