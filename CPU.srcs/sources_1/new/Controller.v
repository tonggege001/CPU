`timescale 1ns / 1ps

//������Լ���ָ���ʱ����Ҫ����ڴ���չ�Լ����ź�
module Controller(OP, Func, AluOp,  MemtoReg , MemWrite,  
	 AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL);

	input wire[5:0] OP;
	input wire[5:0] Func;
	output wire[3:0]AluOp;
	output MemtoReg;
	output MemWrite;
	output AluSrc;
	output RegWrite;
	output Syscall;
	output SignedExt;
	output RegDst;
	output BEQ;
	output BNE;
	output JR;
	output JMP;
	output JAL;

	initial begin
		//TODO ��ʼ���ڲ��Ĵ���
	end

	always@(OP,Func) begin

		/** R��ָ��**/
		if(OP ==  0 && Func == 0) begin	//SLL
			AluOp = 0;
			RegWrite = 1;RegDst= 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;SignedExt = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 3) begin	//SRA
			AluOp = 1;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if (OP==0 && Func == 2) begin	//SRL
			AluOp = 2;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==0 && Func == 32) begin	//ADD
			AluOp = 5;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0; MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==0 && Func == 33) begin	//ADDU
			AluOp = 5;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==0 && Func == 34) begin	//SUB
			AluOp = 6;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 36) begin	//SUB
			AluOp = 7;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 37)begin		//OR
			AluOp = 8;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 39)begin		//NOR
			AluOp = 10;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 42)begin		//SLT
			AluOp = 12;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 43) begin	//SLTU
			AluOp = 12;
			RegWrite = 1;RegDst = 1;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		
		else if(OP==0 && Func == 8) begin		//JR
			AluOp = 5;
			JR = 1;
			RegWrite = 0;RegDst = 0;
			MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JMP = 0;JAL = 0;
		end
		else if(OP == 0 && Func == 12) begin	//SYSCALL
			AluOp = 0;
			Syscall = 1;
			RegWrite = 0;RegDst = 0;
			MemtoReg = 0;MemWrite = 0;AluSrc =  0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP== 2) begin		//J
			AluOp = 0;
			JMP= 1;
			RegWrite = 0;RegDst = 0;Syscall =0;
			MemtoReg =0; MemWrite = 0;AluSrc =  0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR  = 0;JAL = 0;
		end
		else if(OP == 3) begin	//JAL
			AluOp = 0;
			RegWrite = 1;JAL = 1;
			RegDst = 0;Syscall =0;
			MemtoReg = 0;MemWrite = 0;AluSrc =  0;
			SignedExt = 0;BEQ = 0;BNE = 0;
			JR  = 0;JMP = 0;
		end
		else if(OP==4) begin		//BEQ
			AluOp = 0;
			SignedExt = 1;BEQ = 1;
			RegWrite = 0;RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite = 0;AluSrc = 0;
			BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==5)begin		//BNE
			AluOp = 0;
			SignedExt = 1;BNE = 1;
			RegWrite = 0;RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite = 0;AluSrc = 0;
			BEQ = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==8) begin	//ADDI
			AluOp = 5;
			AluSrc = 1;RegWrite = 1;SignedExt = 1;
			RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite  = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 12) begin	//ANDI
			AluOp = 7;
			AluSrc = 1;RegWrite = 1;
			SignedExt = 0;RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 9) begin	//ADDIU
			AluOp = 5;
			AluSrc = 1;RegWrite = 1;SignedExt = 1;
			RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite  = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP==10) begin	//SLTI
			AluOp = 12;
			AluSrc = 1;RegWrite = 1;SignedExt = 1;
			RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 13) begin	//ORI
			AluOp = 8;
			AluSrc = 1;RegWrite = 1;
			SignedExt = 0;RegDst = 0;Syscall = 0;MemtoReg = 0;MemWrite  = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 35) begin	//LW
			AluOp = 0;
			MemtoReg = 1;AluSrc = 1;RegWrite = 1;SignedExt = 1;
			RegDst = 0;Syscall = 0;MemWrite = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else if(OP == 43) begin	//SW
			MemWrite = 1;AluSrc = 1;SignedExt = 1;
			MemtoReg = 0;RegWrite = 0;RegDst = 0;Syscall = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		else begin	//��״̬
			MemWrite = 0; AluSrc =0; SignedExt = 0;
			MemtoReg = 0;RegWrite = 0;RegDst = 0;Syscall = 0;
			BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
		end
		
	end

endmodule