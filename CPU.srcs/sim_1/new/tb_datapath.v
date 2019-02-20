`timescale 1ns / 1ps

module tb_datapath();
    reg Clk_ms;  //ԭʼ��ʱ�ӣ�Ҳ��Ӳ����Ƶ���ʱ��
    reg Rst;
    reg Go;     //
    reg [31:0] MemShowNum;   //�ڴ���ʾ
    wire [31:0]LedData;
    wire [15:0]TotalCirc;
    wire [15:0]NobranchCirc;
    wire [15:0]BranchCirc;
    wire [31:0]MemShow;      //�ڴ���ʾ
    
    always #5 Clk_ms = ~Clk_ms; 
    initial begin
        Clk_ms<=0;
        Rst<=0;
        Go<=0;
        MemShowNum<=0;
    end 
    Datapath MM(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
    
endmodule
