`timescale 1ns / 1ps

/**
Clk: 时钟信号
Addr：地址
Datain：数据输入端
MemWrite：内存写信号
Sel：片选信号，1000,0100,0010,0001(只对写入数据起作用）
**/
module Mem_Data(Clk,Rst,MemShowNum,Addr,Datain,MemWrite,Sel,Dataout,MemShow);
    input Clk;
    input Rst;
    input [31:0]MemShowNum;
    input [19:0]Addr;
    input [31:0]Datain;
    input MemWrite;
    input [3:0]Sel;
    output [31:0]Dataout;
    output wire[31:0]MemShow;
    
    reg[20:0] count;
    parameter MEMLEN = 255;
    reg[31:0]Mem[0:MEMLEN];
    assign Dataout = Mem[Addr];
    
    initial begin
        for(count = 0;count <= MEMLEN; count = count + 1) begin
            Mem[count] = 0;
        end
    end
    assign MemShow = Mem[MemShowNum];
    always @(posedge Clk)begin
        
        if(MemWrite) begin
            Mem[Addr] <= Datain;
            //$display("____MEM____CHANGE____\n");
            //$display("Addr = %d, Data=%d\n",Addr,Mem[Addr]);
        end
        else ;
        if(Rst==1'b1)begin
            for(count=0;count<1023;count=count+1)
                Mem[count] <= 0;
        end
        else ;
        
        $display("\n____MEM____\n");
        $display("MemShow is %d",MemShow);
        $display("addr = %d, Data=%d\n",0,Mem[0]);
        $display("addr = %d, Data=%d\n",1,Mem[1]);
        $display("addr = %d, Data=%d\n",2,Mem[2]);
        $display("addr = %d, Data=%d\n",3,Mem[3]);
        $display("addr = %d, Data=%d\n",4,Mem[4]);
        $display("addr = %d, Data=%d\n",5,Mem[5]);
        $display("addr = %d, Data=%d\n",6,Mem[6]);
        $display("addr = %d, Data=%d\n",7,Mem[7]);
        $display("addr = %d, Data=%d\n",8,Mem[8]);
        $display("addr = %d, Data=%d\n",9,Mem[9]);
        $display("addr = %d, Data=%d\n",10,Mem[10]);
        $display("addr = %d, Data=%d\n",11,Mem[11]);
        $display("addr = %d, Data=%d\n",12,Mem[12]);
        $display("addr = %d, Data=%d\n",13,Mem[13]);
        $display("addr = %d, Data=%d\n",14,Mem[14]);
        $display("addr = %d, Data=%d\n",15,Mem[15]);
        $display("addr = %d, Data=%d\n",16,Mem[16]);
        $display("addr = %d, Data=%d\n",17,Mem[17]);
        $display("addr = %d, Data=%d\n",18,Mem[18]);
        $display("addr = %d, Data=%d\n",19,Mem[19]);
        $display("addr = %d, Data=%d\n",31,Mem[31]);
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