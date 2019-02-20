`timescale 1ns / 1ps
//整体的CPU，包括分频显示

//原始的信号用小写，其中原始信号包括原始时钟、原始未加防抖动按钮
module CPU(clk, rst, go, memshownum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    input clk;
    input rst;
    input go;
    input memshownum;
    output wire[31:0]LedData;
    output wire[15:0]TotalCirc;
    output wire[15:0]NobranchCirc;
    output wire[15:0]BranchCirc;
    output wire[31:0]MemShow;      //内存显示
    
    wire Clk_ms;    //分频后的
    wire Rst;       //防抖动后的
    wire Go;
    wire MemShowNum;  
    
    Divider(clk, Clk_ms);   //分频显示模块
    Button_Signal RSTBS(Clk_ms,rst,Rst);    //按键防抖动模块
    Button_Signal GOBS(Clk_ms,go,Go);
    Button_Signal MEMSHOWNUM(Clk_ms,memshownum,MemShowNum);
    
    Datapath(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
endmodule
