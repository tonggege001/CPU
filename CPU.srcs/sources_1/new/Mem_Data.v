`timescale 1ns / 1ps

/**
Clk: ʱ���ź�
Addr����ַ
Datain�����������
MemWrite���ڴ�д�ź�
Sel��Ƭѡ�źţ�1000,0100,0010,0001(ֻ��д�����������ã�
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
    //TODO ��ʼ�������ڴ�
    
    
    end
    
    always@(posedge Clk) begin
        //д������
        if(MemWrite) begin
            //Ƭѡ�ź�
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
