`timescale 1ns / 1ps

module Mem_Ins(Addr,Dataout);
    input reg[MEMLEN:0]Addr;
    output wire[31:0]Dataout;
    
    parameter MEMLEN = 20;
    reg[32:0]Mem[MEMLEN:0];
    
    initial begin
    //TODO ������Ӧ��ָ���ļ� �� Mem��
    
    
    end
    
    assign Dataout = Mem[Addr];
    
endmodule
