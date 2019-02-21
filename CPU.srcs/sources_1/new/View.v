`timescale 1ns / 1ps

module View(clk,rst,go,choose,/*memshownum,freq ,*/SEG,AN);
    input clk;
    input rst;
    input go;
    input wire[2:0]choose;  //暂时设置为switch选择
    output wire [7:0]SEG;
    output wire [7:0]AN;


    reg [31:0]memshownum;   //改变量是暂时的先不显示内存
    
    wire[31:0]LedData;
    wire[15:0]TotalCirc;
    wire[15:0]NobranchCirc;
    wire[15:0]BranchCirc;
    wire[31:0]MemShow;

    wire[7:0] data; //待显示的某位数据


    cpu CPU(clk, rst, go, memshownum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);

    num Number2Seg(data,SEG);
    finddata FindData(clk,choose,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,AN,data)

    initial begin
        memshownum = 0;
    end





endmodule
