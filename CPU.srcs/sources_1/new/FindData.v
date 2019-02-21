`timescale 1ns / 1ps
/*
����ѡ��ģʽchoose�ź�ѡ����Ҫ�������Ϣ��
���õ��������Ϣ���������Ϣ��ʱ��ʱ��ָ��λie��ʮλ����λ��ǧλ��data�ź���
*/
module FindData(clk,choose,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,AN,data);
    input clk;
    input wire[2:0]choose;   //0:������ʾ    1:�ڴ���ʾ
    input wire[31:0]LedData;
    input wire[15:0]TotalCirc;
    input wire[15:0]NobranchCirc;
    input wire[15:0]BranchCirc;
    input wire[31:0]MemShow;
    output reg[7:0]AN;
    output reg[7:0]data;
    

    reg[3:0] count;
    wire showClk;   //��ʾ���ٶ�
    reg [32:0] curData; //����ģʽѡ��LedDara\TotalCirc\NobranchCirc\BranchCirc�е�һ������
    
    Divider showDivider(clk,showClk);
    
    initial begin
        count <= 0;
    end

    always@(choose,LedData,TotalCirc,NobranchCirc,BranchCirc,MemShow) begin
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
        count <= count + 1;
        if(count == 0) begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= curData%10;
            else
                data <= curData %16;
            AN <= 8'b11111110;
        end
        else if(count == 1)begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/10) % 10;
            else
                data <= (curData/16) %16;
            AN <= 8'b11111101;
        end
        else if(count == 2) begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/100) % 10;
            else
                data <= (curData/256) %16;
            AN <= 8'b11111011;
        end
        else if(count == 3) begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/1000) % 10;
            else
                data <= (curData/4096) %16;
            AN <= 8'b11110111;
        end
        else if(count == 4) begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/10000) % 10;
            else
                data <= (curData/65536) %16;
            AN <= 8'b11101111;
        end
        else if(count ==5)begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/100000) % 10;
            else
                data <= (curData/1048576) %16;
            AN <= 8'b11011111;
        end
        else if(count == 6)begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/1000000) % 10;
            else
                data <= (curData/16777216) %16;
            AN <= 8'b10111111;
        end
        else if(count == 7)begin
            if(choose == TotalCirc || choose == NobranchCirc || choose == BranchCirc)
                data <= (curData/10000000) % 10;
            else
                data <= (curData/268435456) %16;
            AN <= 8'b01111111;
        end
        else begin
            data <= 0;
            AN <= 8'b11111111;
        end
    end
endmodule
