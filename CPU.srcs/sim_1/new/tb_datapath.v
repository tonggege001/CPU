`timescale 1ns / 1ps

module tb_datapath();
    reg Clk_ms;  //原始的时钟，也即硬件分频后的时钟
    reg Rst;
    reg Go;     //
    reg [31:0] MemShowNum;   //内存显示
    wire [31:0]LedData;
    wire [15:0]TotalCirc;
    wire [15:0]NobranchCirc;
    wire [15:0]BranchCirc;
    wire [31:0]MemShow;      //内存显示
    
    always #1 Clk_ms = ~Clk_ms; 
    initial begin
        Clk_ms<=0;
        Rst<=0;
        Go<=0;
        MemShowNum<=0;
    end 
    Datapath MM(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    
endmodule
