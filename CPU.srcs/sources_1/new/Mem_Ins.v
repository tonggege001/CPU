`timescale 1ns / 1ps

module Mem_Ins(Addr,Dataout);
    input Addr;
    output Dataout;
    
    parameter MEMLEN = 20;
    reg[32:0]Mem[MEMLEN:0];
    
    initial begin
    //TODO 载入相应的指令文件 到 Mem中
    
    
    end
    
    assign Dataout = Mem[Addr];
    
endmodule
