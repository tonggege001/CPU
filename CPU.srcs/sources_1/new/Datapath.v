`timescale 1ns / 1ps

//����ͨ·
module Datapath(Clk_ms, Rst, Go,MemShowNum, LedData, TotalCirc, NobranchCirc, BranchCirc, MemShow);
	input Clk_ms;  //ԭʼ��ʱ�ӣ�Ҳ��Ӳ����Ƶ���ʱ��
    input Rst;
    input Go;     //
    input wire[31:0]MemShowNum;   //�ڴ���ʾ
    output reg[31:0]LedData;
    output reg[15:0]TotalCirc;
    output reg[15:0]NobranchCirc;
    output reg[15:0]BranchCirc;
    output reg[31:0]MemShow;      //�ڴ���ʾ
    
    reg[31:0]PC;    //PC�Ĵ���
    wire[31:0] IR;
    wire Clk;   //ʱ���źţ��������״̬�ı䣬ͨ��G0��ϵͳ���ÿ���
    //�����ź�����
    wire[3:0] AluOp; wire MemtoReg; wire MemWrite; wire AluSrc; wire RegWrite; wire Syscall;
    wire SignedExt; wire RegDst; wire BEQ; wire BNE; wire JR; wire JMP; wire JAL;
    
    
    //��ȡָ��,������ָ�����
    Mem_Ins A1(PC[11:2],IR);
    wire[5:0] OP; wire[5:0]Func; wire[4:0]rs; wire[4:0]rt; wire[4:0]rd;
    wire [4:0]Shamt; //��λ�Ĵ���������
    wire[31:0]Imme16; //��16λ������
    wire[31:0]Imme26;   //��������תָ��
    
    
    assign OP = IR[31:26];
    assign Func = IR[5:0];
    assign rs = IR[25:21];
    assign rt = IR[20:16];
    assign rd = IR[15:11];
    assign Shamt = IR[10:6];
	assign Imme16 = {{16{SignedExt & IR[15]}},{IR[15:0]}};    //��������չ
    assign Imme26 = {{6{SignedExt & IR[25]}},{IR[25:0]}};
    initial begin
        //TODO ��ʼ����صļĴ���
        PC = 0;  
        pause_state = 0;  
        iii = 0;
    end


    //���������Ӳ���
    Controller A2(OP, Func, AluOp,  MemtoReg , MemWrite, AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL);
    
    //�Ĵ����˿��ź�����
    reg[4:0]rA; reg[4:0]rB;reg[4:0]rW; reg[31:0]wData; //�Ĵ��������
    wire[31:0] RegOutA; wire[31:0]RegOutB;  //�Ĵ��������
    //�Ĵ����ļ�����
    Reg_File A3(Clk,rA,rB,rW,RegWrite,wData,RegOutA,RegOutB);
	
	//�Ĵ������˿�
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
	//�Ĵ���д�˿�
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
	//�Ĵ���д����
	always@(Result,PC,JAL)begin
	   if(JAL)
	       wData = PC + 4;
	   else
	       wData = Result;
	end
 
    
    //���������Ӳ���
    reg [31:0]Alu_InB; //�Ĵ�����B�����Դ��������һ���Ƿ�����չ��һ���ǼĴ���
    wire[31:0] Alu_Out;
    wire [31:0]Alu_Out2;
    wire Equal;
    Alu A4(RegOutA,Alu_InB,AluOp,Shamt,Equal,Alu_Out,Alu_Out2);
    always @(AluSrc,Imme16, RegOutB) begin  
        if(AluSrc) 
            Alu_InB = Imme16;  //��չ���������
        else
            Alu_InB = RegOutB;
    end
    
	//���ݴ洢�����Ӳ���
    wire[31:0]Mem_Data_In;
    wire[3:0]Sel;    //Ƭѡ�ź�1000 0100 0010 0001
    wire[31:0]Mem_Data_Out;
    wire[19:0] MemAddr; //�洢����ַ
    
    assign Sel = 15;    //24��ָ��Ƭѡ��1111
    assign Mem_Data_In = RegOutA;   //24��ָ��
    assign MemAddr = Alu_Out[21:2];
    Mem_Data A5(Clk,MemAddr,Mem_Data_In, MemWrite,Sel, Mem_Data_Out,Rst);
    
    reg[31:0] Result;  //����������Դ��ALU�������ݴ洢��
    always@(MemtoReg,Alu_Out,Mem_Data_Out) begin
        if(!MemtoReg)
            Result =  Alu_Out;
        else
            Result = Mem_Data_Out;
    end
    
    //����ϵͳ����ģ��
    reg [31:0]SyscallNum;   ///V0
    always@(Syscall) begin
        SyscallNum = RegOutA;
    end
    reg pause;//pauseϵͳ����
    reg showLED;
    always@(Syscall) begin
        if(Syscall) begin
            if(SyscallNum == 34) begin   //V0����34  �����  ��������ͣ��stop
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
    //TODO ��ͣ���֣�д��CLK��ʱ���߼�����
    
    //��ʾ����ܲ���
    always@(showLED) begin
        LedData = RegOutB;
    end
    
    reg pause_state;   // 0ʱ�������У� 1ʱ������ͣ
    //PC�Ĵ�������ģ���Լ�����ͨ·��ʱ�򲿷�
    reg[31:0] iii;
    always@(posedge Clk) begin
        if(BEQ || BNE) begin   //��תָ��
            BranchCirc <= BranchCirc + 1;
            PC <= Imme16<<2 + PC + 4;
        end
        else if(JAL || JMP) begin
            NobranchCirc <= NobranchCirc + 1;
            PC <= Imme26 << 2;
        end
        else if(JR) begin
            NobranchCirc <= NobranchCirc + 1;
            PC <= Result;
        end
        else begin
            PC <= PC + 4;
        end
        TotalCirc <= TotalCirc + 1;
        
        pause_state <= pause | (~pause) & (~Go) & pause_state;
        

        $display("���� = %d ��\n",iii);
        $display("PC = %h��\n",PC);
        $display("IR = %h��\n",IR);
        $display("OP=%d, Func = %d",OP,Func);
        $display("�����źţ�\n");
        $display("AluOp = %d, MemToReg=%d, MemWrite=%d, Alu_Src=%d, RegWrite=%d, Syscall=%d, SignedExt = %d\n", AluOp,MemtoReg,MemWrite,AluSrc,RegWrite, Syscall, SignedExt);
        $display("RegDst = %d, BEQ=%d, BNE = %d, JR=%d, JMP=%d, JAL=%d\n",RegDst,BEQ,BNE,JR,JMP,JAL  );
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
        $display("showLED = %d\n",showLED);
        $display("pause_state = %d\n",pause_state);
        $display("Go = %d\n",Go);
        $display("LedData = %d\n",LedData);
        
        iii <= iii+1;
        
        
        
    end
    
    assign Clk = (~pause_state) & Clk_ms;
endmodule
