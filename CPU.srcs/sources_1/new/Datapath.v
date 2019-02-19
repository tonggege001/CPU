`timescale 1ns / 1ps

//����ͨ·
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
    
    reg[31:0]PC;    //PC�Ĵ���
    wire[31:0] IR;
    
    //�����ź�����
    wire[3:0] AluOp; wire MemtoReg; wire MemWrite; wire AluSrc; wire RegWrite; wire Syscall;
    wire SignedExt; wire RegDst; wire BEQ; wire BNE; wire JR; wire JMP; wire JAL;
    
    
    //��ȡָ��,������ָ�����
    Mem_Ins(PC[21:2],IR);
    wire[5:0] OP; wire[5:0]Func; wire[4:0]rs; wire[4:0]rt; wire[4:0]rd;
    wire [4:0]Shamt; //��λ�Ĵ���������
    wire[31:0]Imme16; //��16λ������
    wire[31:0]Imme26;
    
    
    assign OP = IR[31:25];
    assign Func = IR[5:0];
    assign rs = IR[25:21];
    assign rt = IR[20:16];
    assign rd = IR[15:11];
    assign Shamt = IR[10:6];
    assign Imme16 = {16{SignedExt & IR[15],IR[15:0]}};    //��������չ
    assign Imme26 = {6{SignedExt & IR[25],IR[25:0]}};
    initial begin
        //TODO ��ʼ����صļĴ���
        PC = 0;
    
    end


    //���������Ӳ���
    Controller(OP, Func, AluOp,  MemtoReg , MemWrite, AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL);
    
    //�Ĵ����˿��ź�����
    reg[4:0]rA; reg[4:0]rB;reg[4:0]rW; wire[31:0]wData; //�Ĵ��������
    wire[31:0] RegOutA; wire[31:0]RegOutB;  //�Ĵ��������
    //�Ĵ����ļ�����
    Reg_File(Clk,rA,rB,rW,RegWrite,wData,RegOutA,RegOutB);
    
    always@(Syscall,RegDst) begin
        //�Ĵ������˿�
        if(!Syscall) begin
            rA = rs;
            rB = rt;
        end
        else begin
            rA = 2; //�Ĵ���ѡ��a0��v0�Ĵ���
            rB = 4;
        end
        //�Ĵ���д�˿�
        if(JAL) rW = 31;
        else begin
            if(RegDst) rW = rd;
            else rW = rt;
        end
    end
    
    //���������Ӳ���
    reg [31:0]Alu_InB; //�Ĵ�����B�����Դ��������һ���Ƿ�����չ��һ���ǼĴ���
    wire[31:0] Alu_Out;
    wire Equal;
    Alu(RegOutA,Alu_InB,AluOp,Shamt,Alu_Out,Equal);
    always @(AluSrc) begin  
        if(AluSrc) 
            Alu_InB = Imme16;
        else
            Alu_InB = RegOutB;
    end
    
	//���ݴ洢�����Ӳ���
    wire[31:0]Mem_Data_In;
    wire[3:0]Sel;    //Ƭѡ�ź�1000 0100 0010 0001
    wire[31:0]Mem_Data_Out;
    
    assign Sel = 15;    //24��ָ��Ƭѡ��1111
    assign Mem_Data_In = RegOutA;   //24��ָ��
    Mem_Data(Clk,Alu_Out[21:2],Mem_Data_In, MemWrite,Sel, Mem_Data_Out);
    
    reg[31:0] Result;  //����������Դ��ALU�������ݴ洢��
    always@( MemtoReg) begin
        if(!MemtoReg)
            Result =  Alu_Out;
        else
            Result = Mem_Data_Out;
    end
    
    
    
    //PC�Ĵ�������ģ��
    always@(posedge Clk) begin
        if(BEQ || BNE) begin   //��תָ��
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
