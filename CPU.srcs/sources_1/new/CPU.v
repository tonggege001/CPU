`timescale 1ns / 1ps
//�����CPU��������Ƶ��ʾ

//ԭʼ���ź���Сд������ԭʼ�źŰ���ԭʼʱ�ӡ�ԭʼδ�ӷ�������ť
module CPU(clk, rst, go, memshownum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    input clk;
    input rst;
    input go;
    input [31:0]memshownum;
    output wire[31:0]LedData;
    output wire[15:0]TotalCirc;
    output wire[15:0]NobranchCirc;
    output wire[15:0]BranchCirc;
    output wire[31:0]MemShow;      //�ڴ���ʾ
    
    wire Clk_ms;    //��Ƶ���?
    wire Rst;       //���������?
    wire Go;
    wire MemShowNum;  
    
    Divider divider(clk, Clk_ms);   //��Ƶ��ʾģ��
    Button_Signal RSTBS(Clk_ms,rst,Rst);    //����������ģ��
    Button_Signal GOBS(Clk_ms,go,Go);
    
    Datapath(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
endmodule
