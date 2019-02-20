`timescale 1ns / 1ps

module Reg_File(Clk,rA,rB,rW,WE,wData,A,B);
    input Clk;
    input [4:0]rA;
    input [4:0]rB;
    input [4:0]rW;//写入寄存器编号
    input WE;//写使能
    input [31:0]wData;//写入数据
    output wire[31:0] A;
    output wire[31:0] B;
    
    reg[31:0]Regfile[31:0];
    
    reg[5:0]count;
    
    initial begin
        //TODO 出初始化寄存器文件的值为0
		for(count = 0;count <= 31; count = count + 1) begin
			Regfile[count] = 0;
		end
    end
    
    assign A = Regfile[rA];
    assign B = Regfile[rB];
    
    always @(posedge Clk) begin
        if(WE) begin
            Regfile[rW] <= wData;
        end
        else ;
        $display("____REG____\n");
        $display("addr = %d, Data=%d\n",0,Regfile[0]);
        $display("addr = %d, Data=%d\n",1,Regfile[1]);
        $display("addr = %d, Data=%d\n",2,Regfile[2]);
        $display("addr = %d, Data=%d\n",3,Regfile[3]);
        $display("addr = %d, Data=%d\n",4,Regfile[4]);
        $display("addr = %d, Data=%d\n",5,Regfile[5]);
        $display("addr = %d, Data=%d\n",6,Regfile[6]);
        $display("addr = %d, Data=%d\n",7,Regfile[7]);
        $display("addr = %d, Data=%d\n",8,Regfile[8]);
        $display("addr = %d, Data=%d\n",9,Regfile[9]);
        $display("addr = %d, Data=%d\n",10,Regfile[10]);
        $display("addr = %d, Data=%d\n",11,Regfile[11]);
        $display("addr = %d, Data=%d\n",12,Regfile[12]);
        $display("addr = %d, Data=%d\n",13,Regfile[13]);
        $display("addr = %d, Data=%d\n",14,Regfile[14]);
        $display("addr = %d, Data=%d\n",15,Regfile[15]);
        $display("addr = %d, Data=%d\n",16,Regfile[16]);
        $display("addr = %d, Data=%d\n",17,Regfile[17]);
        $display("addr = %d, Data=%d\n",18,Regfile[18]);
        $display("addr = %d, Data=%d\n",19,Regfile[19]);
        $display("addr = %d, Data=%d\n",31,Regfile[31]);
    end
endmodule
