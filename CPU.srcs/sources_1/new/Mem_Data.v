`timescale 1ns / 1ps

/**
Clk: 时钟信号
Addr：地址
Datain：数据输入端
MemWrite：内存写信号
Sel：片选信号，1000,0100,0010,0001(只对写入数据起作用）
**/
module Mem_Data(Clk,Addr,Datain,MemWrite,Sel,Dataout,Rst);
    input Rst;
    input Clk;
    input [19:0]Addr;
    input [31:0]Datain;
    input MemWrite;
    input Sel;
    output [31:0]Dataout;
    
    reg[20:0] count;
    parameter MEMLEN = 1023;
    reg[31:0]Mem[0:MEMLEN];
    assign Dataout = Mem[Addr];
    
    initial begin
        for(count = 0;count <= MEMLEN; count = count + 1) begin
            Mem[count] = 0;
        end
    end
    
    always @(posedge Clk)begin
        if(MemWrite) begin
            Mem[Addr] <= Datain;
            $display("____MEM____CHANGE____\n");
            $display("Addr = %d, Data=%d\n",Addr,Mem[Addr]);
        end
        else ;
        if(Rst==1'b1)begin
            for(count=0;count<1023;count=count+1)
                Mem[count] <= 0;
        end
        else ;
    end
endmodule
  /*
    always@(Rst) begin
        count = 0;
        while(count<1024)begin
        Mem[count] = 0;
        count = count +1;
        end
    end
    
    always@(posedge Clk) begin
        //写入数据
        if(MemWrite) begin
            //片选信号
            Mem[Addr]=Datain;
//            if(Sel % 2 != 0) 
//                Mem[Addr][7:0] <= Datain[7:0];
//            else if((Sel/2) != 0)
//                Mem[Addr][15:8] <= Datain[15:8];
//            else if((Sel/4) != 0)
//                Mem[Addr][23:16] <= Datain[23:16];
//            else if ((Sel/8) !=0)
//                Mem[Addr][31:24] <= Datain[31:24];
        
        end
    end
endmodule*/