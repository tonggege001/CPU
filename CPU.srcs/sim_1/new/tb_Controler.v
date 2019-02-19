`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 14:50:43
// Design Name: 
// Module Name: tb_Controler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Controler();

	 wire[5:0] OP;
	 wire[5:0] Func;
	 wire[3:0]AluOp;
	wire  MemtoReg;
	wire  MemWrite;
	wire   AluSrc;
	wire  RegWrite;
	wire  Syscall;
	wire  SignedExt;
	wire  RegDst;
	wire  BEQ;
	wire  BNE;
	wire  JR;
	wire  JMP;
	wire  JAL;
 Controller T6(OP, Func, AluOp,  MemtoReg , MemWrite, AluSrc, RegWrite, Syscall, SignedExt, RegDst , BEQ, BNE, JR, JMP, JAL);
     always #5 clk = ~clk; 
     initial begin
     AluOp = 0;
      RegWrite = 0;RegDst= 0;
      MemtoReg = 0;MemWrite = 0;AluSrc = 0;Syscall = 0;SignedExt = 0;
      BEQ = 0;BNE = 0;JR = 0;JMP = 0;JAL = 0;
      #10  OP = 0 ; Func=0;   //SLL
      #10  OP = 0 ; Func=3;    //SRA
      #10  OP = 0 ; Func=2;    //SRL
      #10  OP = 0 ; Func=32;    //ADD
      #10  OP = 0 ; Func=33;     //ADDU
      #10  OP = 0 ; Func=34;      //SUB
      #10  OP = 0 ; Func=36;      //SUB
      #10  OP = 0 ; Func=37;       //OR
      #10  OP = 0 ; Func=39;       //NOR
      #10  OP = 0 ; Func=42;       //SLT
      #10  OP = 0 ; Func=43;       //SLTU
      #10  OP = 0 ; Func=8;        //JR
      #10  OP = 0 ; Func=12;       //SYSCALL
      #10  OP = 2 ; Func=0;       //J
      #10  OP = 3 ; Func=0;       //JAL
      #10  OP = 4 ; Func=0;      //BEQ
      #10  OP = 5 ; Func=43;      //BNE
      #10  OP = 8 ; Func=8;        //ADDI
      #10  OP =12 ; Func=0;      //ANDI
      #10  OP = 9 ; Func=0;       //ANDI
      #10  OP = 10 ; Func=0;       //SLTI
      #10  OP = 13 ; Func=0;      //ORI
      #10  OP = 35 ; Func=0;       //LW
      #10  OP = 43 ; Func=0;      //SW
   end
      
endmodule
