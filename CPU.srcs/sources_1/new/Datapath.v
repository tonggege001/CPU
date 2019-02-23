`timescale 1ns / 1ps

//数据通路
module Datapath(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
	input Clk_ms;  //原始的时钟，也即硬件分频后的时钟
    input Rst;
    input Go;     //
    input wire[31:0]MemShowNum;   //内存显示
    output reg[31:0]LedData;
    output reg[15:0]TotalCirc;
    output reg[15:0]NobranchCirc;
    output reg[15:0]BranchCirc;
    output wire[31:0]MemShow;      //内存显示
    
    reg[31:0]PC;    //PC寄存器
    wire[31:0] IR;
    wire Clk;   //时钟信号，在最后有状态改变，通过G0和系统调用控制
    //控制信号声明
    wire[3:0] AluOp; wire MemtoReg; wire MemWrite; wire AluSrc; wire RegWrite; wire Syscall;
    wire SignedExt; wire RegDst; wire BEQ; wire BNE; wire JR; wire JMP; wire JAL;wire BGEZ;
    
    
    //获取指令,并进行指令解析
    Mem_Ins A1(PC[11:2],IR);
    wire[5:0] OP; wire[5:0]Func; wire[4:0]rs; wire[4:0]rt; wire[4:0]rd;
    wire [4:0]Shamt; //移位寄存器的输入
    wire[31:0]Imme16; //后16位立即数
    wire[31:0]Imme26;   //无条件跳转指令
    
    reg pause_state;   // 0时程序运行， 1时程序暂停
    reg[31:0] iii;  //统计周期数
        
    assign OP = IR[31:26];
    assign Func = IR[5:0];
    assign rs = IR[25:21];
    assign rt = IR[20:16];
    assign rd = IR[15:11];
    assign Shamt = IR[10:6];
	assign Imme16 = {{16{SignedExt & IR[15]}},{IR[15:0]}};    //符号数扩展
    assign Imme26 = {{6{SignedExt & IR[25]}},{IR[25:0]}};
    initial begin
        //TODO 初始化相关的寄存器
        PC = 0;  
        pause_state = 0;  
        iii = 0;
        TotalCirc = 0;
        NobranchCirc = 0;
        BranchCirc = 0;
        LedData = 0;
    end


    //控制器连接部分
    Controller A2(OP, Func, AluOp,  MemtoReg , MemWrite, AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL, BGEZ);
    
    //寄存器端口信号声明
    reg[4:0]rA; reg[4:0]rB;reg[4:0]rW; reg[31:0]wData; //寄存器输入口
    wire[31:0] RegOutA; wire[31:0]RegOutB;  //寄存器输出口
    //寄存器文件连接
    Reg_File A3(Clk_ms,Rst,rA,rB,rW,RegWrite,wData,RegOutA,RegOutB);
	
	//寄存器读端口
	always@(rs,Syscall) begin
	   if(Syscall) 
	       rA = 2;
	   else 
	       rA = rs;
	end
	always@(rt,Syscall) begin
	   if(Syscall) 
	       rB = 4;
	   else
	       rB = rt;
	end
	//寄存器写端口
	always@(RegDst,JAL,rt,rd) begin
	   if(JAL) begin
	       rW = 31;
	   end
	   else begin
	       if(RegDst)
	           rW = rd;
	       else 
	           rW = rt;
	   end
	end
	//寄存器写数据
	always@(Result,PC,JAL)begin
	   if(JAL)
	       wData = PC + 4;
	   else
	       wData = Result;
	end
 
    
    //运算器连接部分
    reg [31:0]Alu_InB; //寄存器的B入口来源有两个，一个是符号扩展，一个是寄存器
    wire[31:0] Alu_Out;
    wire [31:0]Alu_Out2;
    wire Equal;
    wire Big;
    assign Big = ($signed(RegOutA) >= 0);
    Alu A4(RegOutA,Alu_InB,AluOp,Shamt,Equal,Alu_Out,Alu_Out2);
    always @(AluSrc,Imme16, RegOutB) begin  
        if(AluSrc) 
            Alu_InB = Imme16;  //扩展后的立即数
        else
            Alu_InB = RegOutB;
    end
    
	//数据存储器连接部分
    wire[31:0]Mem_Data_In;
    wire[3:0]Sel;    //片选信号1000 0100 0010 0001
    wire[31:0]Mem_Data_Out;
    wire[19:0] MemAddr; //存储器地址
    
    assign Sel = 15;    //24条指令片选是1111
    assign Mem_Data_In = RegOutB;   //24条指令
    assign MemAddr = Alu_Out[21:2];
    Mem_Data A5(Clk,Rst,MemShowNum,MemAddr,Mem_Data_In, MemWrite,Sel, Mem_Data_Out, MemShow);
    reg[31:0] Result;  //输出结果，来源是ALU或者数据存储器
    always@(MemtoReg,Alu_Out,Mem_Data_Out) begin
        if(!MemtoReg)
            Result =  Alu_Out;
        else
            Result = Mem_Data_Out;
    end
    
    //处理系统调用模块
    reg [31:0]SyscallNum;   ///V0
    always@(RegOutA) begin
        SyscallNum = RegOutA;
    end
    reg pause;//pause系统调用
    reg showLED;
    always@(Syscall,SyscallNum) begin
        if(Syscall) begin
            if(SyscallNum == 34) begin   //V0等于34  则输出  不等于则停机stop
                pause = 0;    
                showLED = 1;
            end
            else begin
                pause = 1;
                showLED = 0;
            end
        end
        else begin
            pause = 0;
            showLED = 0;
        end
    end
    //TODO 暂停部分，写到CLK的时序逻辑部分
    

    //PC寄存器连接模块以及数据通路的时序部分

    
    //reg [31:0] PC
    always@(posedge Clk_ms) begin
        if(!Rst && !pause_state) begin
            if((BEQ && Equal) || (BNE && !Equal) ||(BGEZ && Big)) begin   //跳转指令
                BranchCirc <= BranchCirc + 1;
                PC <= (((Imme16<<2) + PC )+ 4);
                $display("BEQ || BNE");
                $display("PC next is %d",((Imme16<<2) + PC) + 4);
            end
            else if(JAL || JMP) begin
                NobranchCirc <= NobranchCirc + 1;
                PC <= Imme26 << 2;
                $display("JAL || JMP");
                $display("PC next is %d",Imme26 << 2);
            end
            else if(JR) begin
                NobranchCirc <= NobranchCirc + 1;
                PC <= Result;
                $display("JR");
                $display("PC next is %d",Result);
            end
            else begin
                PC <= PC + 4;
                $display("PC + 4");
                $display("PC next is %d",PC + 4);
            end
            TotalCirc <= TotalCirc + 1;
            if(showLED)
                LedData <= RegOutB;
            else 
                LedData <= LedData;
        end
        else if(Rst)begin
            PC <= 0;
            TotalCirc <= 0;
            NobranchCirc <= 0;
            BranchCirc <= 0;
            pause_state <= 0;
        end
        else ;
        pause_state <= pause | (~pause) & (~Go) & pause_state;

        $display("周期 = %d ：\n",iii);
        $display("PC = %h：\n",PC);
        $display("IR = %h：\n",IR);
        $display("OP=%d, Func = %d",OP,Func);
        $display("控制信号：\n");
        $display("AluOp = %d, MemToReg=%d, MemWrite=%d, Alu_Src=%d, RegWrite=%d, Syscall=%d, SignedExt = %d\n", AluOp,MemtoReg,MemWrite,AluSrc,RegWrite, Syscall, SignedExt);
        $display("RegDst = %d, BEQ=%d, BNE = %d, JR=%d, JMP=%d, JAL=%d\n",RegDst,BEQ,BNE,JR,JMP,JAL  );
        $display("Equal = %d\n",Equal);
        $display("rs = %d\n",rs);
        $display("rt = %d\n",rt);
        $display("rd = %d\n",rd);
        $display("rA = %d\n",rA);
        $display("rB = %d\n",rB);
        $display("rW = %d\n",rW);
        $display("imme16 = %d\n",Imme16);
        $display("imme26 = %d\n",Imme26);
        $display("wData = %d\n",wData);
        $display("RegOutA = %d\n",RegOutA);
        $display("RegOutB = %d\n",RegOutB);
        $display("Alu_InB = %d\n",Alu_InB);
        $display("Alu_Out = %d\n",Alu_Out);
        $display("MemAddr = %d\n",MemAddr);
        $display("Mem_Data_In = %d\n",Mem_Data_In);
        $display("Mem_Data_Out = %d\n",Mem_Data_Out);
        $display("Result = %d\n",Result);
        $display("SyscallNum = %d\n",SyscallNum);
        $display("showLED = %d\n",showLED);
        $display("LedData = %d\n",LedData);
        $display("pause = %d\n",pause);
        $display("pause_state = %d\n",pause_state);
        $display("Go = %d\n",Go);
        $display("TotalCirc = %d\n",TotalCirc);
        $display("NoBranchCirc = %d\n",NobranchCirc);
        $display("BranchCirc = %d\n",BranchCirc);
        iii <= iii+1;
        
        
        
    end
    
    assign Clk = (~pause_state) & Clk_ms;
endmodule
