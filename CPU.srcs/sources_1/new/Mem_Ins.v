`timescale 1ns / 1ps

module Mem_Ins(Addr,Dataout);
    input [MEMLEN:0]Addr;
    output wire[31:0]Dataout;
    
    parameter MEMLEN = 9;
    reg[31:0]Mem[0:1024];
    
    initial begin
    // 载入相应的指令文件 到 Mem中
    //$readmemh("D:/branch.hex",Mem);
    $readmemh("D:/benchmark.hex",Mem);
    end
    
    assign Dataout = Mem[Addr];
    
endmodule
