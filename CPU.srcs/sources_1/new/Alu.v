`timescale 1ns / 1ps

module Alu(A,B,Aluop,Shamt,R,Equal);
    input wire[31:0]A;
    input wire[31:0]B;
    input wire[3:0]Aluop;
    input wire[4:0]Shamt;
    output wire[31:0]R;
    output wire Equal;
    
    wire signed[31:0] A_signed;
    wire signed[31:0] B_signed;
    
    assign A_signed = A;
    assign B_signed = B;
    assign Equal = ( A==B );
    //TODO �����������Լ������㣬����BGEZָ��Ļ���������output������һ�����ڵ����ź�
    //assign Big = A_signed > -1
            
    always@(A,B,Aluop,Shamt) begin
        case(Aluop) 
        0:  //�߼�����
            begin
            R = B << Shamt;
            end
        1:  //��������
            begin
            R = B >>> Shamt;
            end
        2:  //�߼�����
            begin
            R = B >> Shamt;
            end
        3:  //�޷��ų˷�
            begin
            R = A * B;
            end
        4:  //�޷��ų���
            begin
            R = A / B;
            end
        5:  //�ӷ�
            begin
            R = A + B;
            end
        6:  //����
            begin
            R = A - B;
            end
        7:  //��λ��
            begin
            R = A & B;
            end
        8:  //��λ��
            begin
            R = A | B;
            end
        9:  //��λ���
            begin
            R = A ^ B;
            end
        10: //��λ���
            begin
            R = ~(A | B);
            end
        11: //�з��űȽ�
            begin
            R = (A_signed < B_signed);
            end
        12: //�޷��űȽ�
            begin
            R = (A < B);
            end
        endcase
    end

endmodule
