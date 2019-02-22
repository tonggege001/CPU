`timescale 1ns / 1ps

module tb_CPU();
    reg clk;
    reg rst;
    reg go;
    reg [31:0]MemShowNum;
    reg [1:0] Freq;
    wire[31:0]LedData;
    wire[15:0]TotalCirc;
    wire[15:0]NobranchCirc;
    wire[15:0]BranchCirc;
    wire[31:0]MemShow;      //�ڴ���ʾ
    
    always #1 clk = ~clk; 
    
    initial begin
        clk<=0;
        rst<=0;
        go<=0;
        MemShowNum<=0;
        Freq = 0;
    end 
    CPU tb_CPU(clk, rst, go, MemShowNum, Freq, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    
endmodule
