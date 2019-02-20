`timescale 1ns / 1ps
 
module Alu(A,B,Aluop,Shamt,Equal,result1,result2);
    input signed [31:0] A;
    input signed [31:0] B;
    input [3:0] Aluop;
    input [4:0] Shamt;
    output reg [31:0]result1;
    output reg [31:0]result2;
    output Equal;

    initial begin
      result1<=0;
      result2<=0;
    end
    
    assign Equal = (A == B ? 1 : 0);
    
    always @(*) begin
        case(Aluop)
            4'b0000:begin  //0.逻辑左移
                    result1 <= B << Shamt;
                    end
            4'b0001:begin  //1.运算右移
                    result1 <= B >>> Shamt;
                    end
            4'b0010:begin  //2.逻辑右移
                    result1 <= B >> Shamt;
                    end
            4'b0011:begin  //3.乘法
                   {result2,result1} <= A * B;
                   // result1 <= multi[31:0];
                   // result2 <= multi[63:32];
                    end
            4'b0100:begin  //4.除法
                    result1 <= A / B;  //商
                    result2 <= A % B; //余数
                    end
            4'b0101:begin  //5.加法
                    result1 <= A + B;  
                    end
            4'b0110:begin  //6.减法
                    result1 <= A - B;  
                    end
            4'b0111:begin  //7.按位与
                    result1 <= A & B;  
                    end
            4'b1000:begin  //8.按位或
                    result1 <= A | B;  
                    end
            4'b1001:begin  //9.按位异或
                    result1 <= A ^ B;  
                    end
            4'b1010:begin  //10.按位或非
                    result1 <= ~(A | B); 
                    end
            4'b1011:begin  //11.有符号数比较
                    result1 <= A < B ? 1 : 0; 
                    end
            4'b1100:begin  //12.无符号数比较
                    result1 <= $unsigned(A) < $unsigned(B) ? 1 : 0; 
                    end
        endcase
    end
endmodule
