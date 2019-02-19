`timescale 1ns / 1ps

/**
Clk: 时钟信号
Addr：地址
Datain：数据输入端
MemWrite：内存写信号
Sel：片选信号，1000,0100,0010,0001(只对写入数据起作用）
**/
module Mem_Data(Clk,Addr,Datain,MemWrite,Sel,Dataout);
    input Clk;
    input Addr;
    input Datain;
    input MemWrite;
    input Sel;
    output Dataout;
    
    parameter MEMLEN = 20;
    reg[31:0]Mem[MEMLEN:0];
    assign Dataout = Mem[Addr];
    
    initial begin
    //TODO 初始化数据内存
    
    
    end
    
    always@(posedge Clk) begin
        //写入数据
        if(MemWrite) begin
            //片选信号
            if(Sel % 2 != 0) 
                Mem[Addr][7:0] <= Datain[7:0];
            else if((Sel/2) != 0)
                Mem[Addr][15:8] <= Datain[15:8];
            else if((Sel/4) != 0)
                Mem[Addr][23:16] <= Datain[23:16];
            else if ((Sel/8) !=0)
                Mem[Addr][32:24] <= Datain[32:24];
        
        end;
    end
endmodule
