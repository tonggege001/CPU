`timescale 1ns / 1ps

module tb_View();
    reg clk;
    reg rst;
    reg go;
    reg [2:0]choose;  //暂时设置为switch选择
    reg[9:0]memshownum;
    reg[1:0]Freq;
    wire [7:0]SEG;
    wire [7:0]AN;
    
    initial begin
        clk <= 0;
        rst <= 0;
        choose <= 0;
        go <= 0;
        memshownum<= 0;
        Freq <= 0;
        #2452090 memshownum <= 1;
    end
    
    always #1 clk = ~clk; 
    
    View tb_view(clk,rst,go,choose,memshownum,Freq ,SEG,AN);
    
endmodule
