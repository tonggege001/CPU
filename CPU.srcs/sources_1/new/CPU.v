`timescale 1ns / 1ps

module CPU(clk, rst, go, MemShowNum, Freq, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    input clk;
    input rst;
    input go;
    input [31:0]MemShowNum;
    input [1:0] Freq;
    output wire[31:0]LedData;
    output wire[15:0]TotalCirc;
    output wire[15:0]NobranchCirc;
    output wire[15:0]BranchCirc;
    output wire[31:0]MemShow;      //�ڴ���ʾ
    
    wire Clk_ms;    //��Ƶ���?
    wire Rst;       //���������?
    wire Go;
    
    Divider divider(clk, Clk_ms, Freq);   //��Ƶ��ʾģ��
    
    Button_Signal RSTBS(Clk_ms,rst,Rst);    //����������ģ��
    Button_Signal GOBS(Clk_ms,go,Go);
    
    Datapath datapath(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    
    always@(posedge Clk_ms) begin
        $display("CPU module, MemShow is %d",MemShow);
    
    end
endmodule
