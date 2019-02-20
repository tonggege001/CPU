`timescale 1ns / 1ps

module Reg_File(Clk,rA,rB,rW,WE,wData,A,B);
    input Clk;
    input [4:0]rA;
    input [4:0]rB;
    input [4:0]rW;//写入寄存器编号
    input WE;//写使能
    input [31:0]wData;//写入数据
    output wire[31:0] A;
    output wire[31:0] B;
    
    reg[31:0]Regfile[4:0];
    
    reg[5:0]count;
    
    initial begin
        //TODO 出初始化寄存器文件的值为0
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
    end
endmodule
