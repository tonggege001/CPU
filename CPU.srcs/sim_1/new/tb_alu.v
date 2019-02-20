`timescale 1ns / 1ps
module tb_alu();
    reg [31:0] A;
    reg [31:0] B;
     reg [3:0] Aluop;
     reg [4:0] Shamt;
     wire [31:0] result1;
      wire [31:0] result2;
     wire Equal;
      
    
  
   Alu T5(A,B,Aluop,Shamt,Equal,result1, result2);
            initial begin
             A = 2000;
             B = 200;
             Aluop=0;
             Shamt=0;
             
           
            #5 Shamt=2;
            #5 Aluop=0;
            #5 Aluop=1;
            #5 Aluop=2;
            #5 Aluop=3;
            #5  Aluop=4;
            #5  Aluop=5;
            #5  Aluop=6;
            #5  Aluop=7;
            #5   Aluop=8;
            #5   Aluop=9;
            #5   Aluop=10;
            #5   Aluop=11;
           #5    Aluop=12;
       
           end
endmodule
