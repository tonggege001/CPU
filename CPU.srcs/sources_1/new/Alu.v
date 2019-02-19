`timescale 1ns / 1ps

module Alu(A,B,Aluop,Shamt,R,Equal);
    input wire[31:0]A;
    input wire[31:0]B;
    input wire[3:0]Aluop;
    input wire[4:0]Shamt;
    output reg[31:0]R;
    output wire Equal;
    
    wire signed[31:0] A_signed;
    wire signed[31:0] B_signed;
    
    assign A_signed = A;
    assign B_signed = B;
    assign Equal = ( A==B );
    //TODO 这里填你们自己的运算，比如BGEZ指令的话，额外在output处增加一个大于等于信号
    //assign Big = A_signed > -1
            
    always@(A,B,Aluop,Shamt) begin
        case(Aluop) 
        0:  //逻辑左移
            begin
            R = B << Shamt;
            end
        1:  //算数右移
            begin
            R = B >>> Shamt;
            end
        2:  //逻辑右移
            begin
            R = B >> Shamt;
            end
        3:  //无符号乘法
            begin
            R = A * B;
            end
        4:  //无符号除法
            begin
            R = A / B;
            end
        5:  //加法
            begin
            R = A + B;
            end
        6:  //减法
            begin
            R = A - B;
            end
        7:  //按位与
            begin
            R = A & B;
            end
        8:  //按位或
            begin
            R = A | B;
            end
        9:  //按位异或
            begin
            R = A ^ B;
            end
        10: //按位或非
            begin
            R = ~(A | B);
            end
        11: //有符号比较
            begin
            R = (A_signed < B_signed);
            end
        12: //无符号比较
            begin
            R = (A < B);
            end
        endcase
    end

endmodule
