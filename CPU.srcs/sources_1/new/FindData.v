`timescale 1ns / 1ps
/*
数据选择模块，当choose为某一模式时，某一时刻数据为相应源数据的某一位
*/
module FindData(clk,choose,LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow,AN,data);
    input clk;
    input wire[2:0]choose;   //0:锟斤拷锟斤拷锟斤拷示    1:锟节达拷锟斤拷示
    input wire[31:0]LedData;
    input wire[15:0]TotalCirc;
    input wire[15:0]NobranchCirc;
    input wire[15:0]BranchCirc;
    input wire[31:0]MemShow;
    output reg[7:0]AN;
    output reg[7:0]data;
    

    reg[3:0] count;
    wire showClk;   //锟斤拷示锟斤拷锟劫讹拷
    reg [32:0] curData; //锟斤拷锟斤拷模式选锟斤拷LedDara\TotalCirc\NobranchCirc\BranchCirc锟叫碉拷一锟斤拷锟斤拷锟斤拷
    
    Divider showDivider(clk,showClk);
    
    initial begin
        count <= 0;
    end

    always@(choose,LedData,TotalCirc,NobranchCirc,BranchCirc,MemShow) begin
        case(choose)
        0:begin     //LED显示
            curData = LedData;
        end
        1:begin     //总周期数
            curData = {{16{0}},TotalCirc};
        end
        2:begin //无条件跳转
            curData = {{16{0}},NobranchCirc};
        end
        3:begin //有条件跳转
            curData = {{16{0}},BranchCirc};
        end
        4:begin //内存显示
            curData = MemShow;
        end
        endcase
    end
    
    
    always@(posedge showClk) begin
        count <= count + 1;
        if(count == 0) begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= curData%10;
            else
                data <= curData %16;
            AN <= 8'b11111110;
        end
        else if(count == 1)begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/10) % 10;
            else
                data <= (curData/16) %16;
            AN <= 8'b11111101;
        end
        else if(count == 2) begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/100) % 10;
            else
                data <= (curData/256) %16;
            AN <= 8'b11111011;
        end
        else if(count == 3) begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/1000) % 10;
            else
                data <= (curData/4096) %16;
            AN <= 8'b11110111;
        end
        else if(count == 4) begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/10000) % 10;
            else
                data <= (curData/65536) %16;
            AN <= 8'b11101111;
        end
        else if(count ==5)begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/100000) % 10;
            else
                data <= (curData/1048576) %16;
            AN <= 8'b11011111;
        end
        else if(count == 6)begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/1000000) % 10;
            else
                data <= (curData/16777216) %16;
            AN <= 8'b10111111;
        end
        else if(count == 7)begin
            if(choose == 1 || choose == 2 || choose == 3)
                data <= (curData/10000000) % 10;
            else
                data <= (curData/268435456) %16;
            AN <= 8'b01111111;
        end
        else begin
            data <= 0;
            AN <= 8'b11111111;
        end
    end
endmodule
