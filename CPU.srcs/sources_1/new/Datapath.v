`timescale 1ns / 1ps

//数据通路
module Datapath(Clk, Rst, Go, RegShowNum, MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc,RegShow, MemShow, PCShow);
	input Clk;
    input Rst;
    input Go;
    input wire[5:0]RegShowNum;
    input wire[32:0]MemShowNum;
    output reg[31:0]LedData;
    output reg[15:0]TotalCirc;
    output reg[15:0]NobranchCirc;
    output reg[15:0]BranchCirc;
    output reg[31:0]RegShow;
    output reg[31:0]MemShow;
    output reg[31:0]PCShow;
    
    reg[31:0]PC;    //PC寄存器
    wire[31:0] IR;
    
    //控制信号声明
    wire[3:0] AluOp; wire MemtoReg; wire MemWrite; wire AluSrc; wire RegWrite; wire Syscall;
    wire SignedExt; wire RegDst; wire BEQ; wire BNE; wire JR; wire JMP; wire JAL;
    
    
    //获取指令,并进行指令解析
    Mem_Ins(PC[21:2],IR);
    wire[5:0] OP; wire[5:0]Func; wire[4:0]rs; wire[4:0]rt; wire[4:0]rd;
    wire [4:0]Shamt; //移位寄存器的输入
    wire[31:0]Imme16; //后16位立即数
    wire[31:0]Imme26;
    
    
    assign OP = IR[31:25];
    assign Func = IR[5:0];
    assign rs = IR[25:21];
    assign rt = IR[20:16];
    assign rd = IR[15:11];
    assign Shamt = IR[10:6];
    assign Imme16 = {16{SignedExt & IR[15],IR[15:0]}};    //符号数扩展
    assign Imme26 = {6{SignedExt & IR[25],IR[25:0]}};
    initial begin
        //TODO 初始化相关的寄存器
        PC = 0;
    
    end


    //控制器连接部分
    Controller(OP, Func, AluOp,  MemtoReg , MemWrite, AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL);
    
    //寄存器端口信号声明
    reg[4:0]rA; reg[4:0]rB;reg[4:0]rW; wire[31:0]wData; //寄存器输入口
    wire[31:0] RegOutA; wire[31:0]RegOutB;  //寄存器输出口
    //寄存器文件连接
    Reg_File(Clk,rA,rB,rW,RegWrite,wData,RegOutA,RegOutB);
    
    always@(Syscall,RegDst) begin
        //寄存器读端口
        if(!Syscall) begin
            rA = rs;
            rB = rt;
        end
        else begin
            rA = 2; //寄存器选择a0、v0寄存器
            rB = 4;
        end
        //寄存器写端口
        if(JAL) rW = 31;
        else begin
            if(RegDst) rW = rd;
            else rW = rt;
        end
    end
    
    //运算器连接部分
    reg [31:0]Alu_InB; //寄存器的B入口来源有两个，一个是符号扩展，一个是寄存器
    wire[31:0] Alu_Out;
    wire Equal;
    Alu(RegOutA,Alu_InB,AluOp,Shamt,Alu_Out,Equal);
    always @(AluSrc) begin  
        if(AluSrc) 
            Alu_InB = Imme16;
        else
            Alu_InB = RegOutB;
    end
    
	//数据存储器连接部分
    wire[31:0]Mem_Data_In;
    wire[3:0]Sel;    //片选信号1000 0100 0010 0001
    wire[31:0]Mem_Data_Out;
    
    assign Sel = 15;    //24条指令片选是1111
    assign Mem_Data_In = RegOutA;   //24条指令
    Mem_Data(Clk,Alu_Out[21:2],Mem_Data_In, MemWrite,Sel, Mem_Data_Out);
    
    reg[31:0] Result;  //输出结果，来源是ALU或者数据存储器
    always@( MemtoReg) begin
        if(!MemtoReg)
            Result =  Alu_Out;
        else
            Result = Mem_Data_Out;
    end
    
    
    
    //PC寄存器连接模块
    always@(posedge Clk) begin
        if(BEQ || BNE) begin   //跳转指令
            BranchCirc <= BranchCirc + 1;
            PC <= Imme16;
        end
        else if(JAL || JMP) begin
            NobranchCirc <= NobranchCirc + 1;
            PC <= Imme26;
        end
        else if(JR) begin
            NobranchCirc <= NobranchCirc + 1;
            PC <= Result;
        end
        else begin
            PC <= PC + 4;
        end
        TotalCirc <= TotalCirc + 1;
    end
    
    
    
    
    

    
    
endmodule
