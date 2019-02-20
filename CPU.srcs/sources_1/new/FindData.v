`timescale 1ns / 1ps
/*
����ѡ��ģʽchoose�ź�ѡ����Ҫ�������Ϣ��
���õ��������Ϣ���������Ϣ��ʱ��ʱ��ָ��λie��ʮλ����λ��ǧλ��data�ź���
*/
module FindData(clk,choose,AN,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,data);
    input clk;
    input [2:0]choose;   //0:������ʾ    1:�ڴ���ʾ
    input [7:0]AN;
    input wire[31:0]LedData;
    input wire[15:0]TotalCirc;
    input wire[15:0]NobranchCirc;
    input wire[15:0]BranchCirc;
    input wire[31:0]MemShow;
    output reg[7:0] data;
    
    reg[3:0] count;
    wire showClk;   //��ʾ���ٶ�
    reg [32:0] curData; //����ģʽѡ��LedDara\TotalCirc\NobranchCirc\BranchCirc�е�һ������
    
    
    
    Divider showDivider(clk,showClk);
    
    initial begin
        count <= 0;
    end
    always@(choose) begin
        case(choose)
        0:begin     //LED��ʾ
            curData = LedData;
        end
        1:begin     //����������ʾ
            curData = {{16{0}},TotalCirc};
        end
        2:begin //��������תָ������ʾ
            curData = {{16{0}},NobranchCirc};
        end
        3:begin
            curData = {{16{0}},BranchCirc};
        end
        4:begin
            curData = MemShow;
        end
        endcase
    end
    
    
    always@(posedge showClk) begin
        if(count == 0) begin
            data <= curData/10;
            AN = 8'b01111111;
        end
        else if(count == 1)begin
            //TODO ��ʾ�����
            
            
        end
    
    end
    
    
    
endmodule
