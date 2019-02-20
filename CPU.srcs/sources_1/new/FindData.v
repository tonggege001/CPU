`timescale 1ns / 1ps
/*
根据选择模式choose信号选择需要输出的信息，
当得到输出的信息后，输出的信息按时钟时序分割个位ie、十位、百位、千位到data信号中
*/
module FindData(clk,choose,AN,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,data);
    input clk;
    input [2:0]choose;   //0:程序显示    1:内存显示
    input [7:0]AN;
    input wire[31:0]LedData;
    input wire[15:0]TotalCirc;
    input wire[15:0]NobranchCirc;
    input wire[15:0]BranchCirc;
    input wire[31:0]MemShow;
    output reg[7:0] data;
    
    reg[3:0] count;
    wire showClk;   //显示的速度
    reg [32:0] curData; //根据模式选择LedDara\TotalCirc\NobranchCirc\BranchCirc中的一个数据
    
    
    
    Divider showDivider(clk,showClk);
    
    initial begin
        count <= 0;
    end
    always@(choose) begin
        case(choose)
        0:begin     //LED显示
            curData = LedData;
        end
        1:begin     //总周期数显示
            curData = {{16{0}},TotalCirc};
        end
        2:begin //无条件跳转指令数显示
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
        if(count == 0) begin
            data <= curData/10;
            AN = 8'b01111111;
        end
        else if(count == 1)begin
            //TODO 显示数码管
            
            
        end
    
    end
    
    
    
endmodule
