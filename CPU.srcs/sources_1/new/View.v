`timescale 1ns / 1ps

module View(clk,rst,go,choose,memshownum,Freq ,SEG,AN);
    input clk;
    input rst;
    input go;
    input wire[2:0]choose;  //暂时设置为switch选择
    input wire[9:0]memshownum;
    input [1:0]Freq;
    output wire [7:0]SEG;
    output wire [7:0]AN;
    
    wire[31:0]LedData;
    wire[15:0]TotalCirc;
    wire[15:0]NobranchCirc;
    wire[15:0]BranchCirc;

    wire[31:0]MemShow;

    wire[7:0] data; //待显示的某位数据

    wire [31:0]MemShowNum;
    assign MemShowNum = {{22{0}},memshownum};

    CPU cpu(clk, rst, go, MemShowNum, Freq, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);

    Number2Seg num(data,SEG);
    FindData finddata(clk,choose,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,AN,data);
    


endmodule
